package logic;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.LikeUserDao;
import dao.ReplyDao;
import dao.SemiUserDao;
import dao.SnsDao;
import dao.UserDao;

@Service
public class SnsServiceImpl implements SnsService {

	@Autowired
	private SnsDao snsDao;
	@Autowired
	private LikeUserDao	likeUserDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private SemiUserDao semiDao;
	
	
	public List<Sns> getList(int m_number) {//m_number : 게시물객체에 있는 m_number (어떤 회원의 게시물인지 판단하기위함)
		List<Sns> snsList = null;
		String encodeFilename = null;
		snsList = snsDao.list(m_number);
		for(int i = 0 ; i<snsList.size(); i++){
			try {
				encodeFilename = new String(snsList.get(i).getFileUrl().getBytes("8859_1"),"euc-kr");
				snsList.get(i).setFileUrl(encodeFilename);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			if(snsList.get(i).getM_number() == m_number){
				snsList.get(i).setUserProfile(userDao.getUserProfile(m_number));
			}else{
				break;
			}
		}
		return snsList;
	}

	public List<Integer> getOthersNum(Integer loginUserNumber) {
		List<Integer> othersNum = null;
		List<Integer> result = new ArrayList<Integer>();
		List<LikeUser> likeUserList = null;
		likeUserList = likeUserDao.getAll(loginUserNumber); //로그인한 유저의 번호에 해당하는 C_number를 전부 가져옴 ( m_number이든 y_number이든 로그인 유저의 번호가 있는 모든 컬럼을 긁어옴)
		
		/*1. m넘, y넘에 로그인 유저의 넘버와 같은 모든 목록을 가져온다.

		2. 반복문을 돌면서, 아래의 경우를 체크하고 경우에 따라 다른 명령 실행(각각에따라 뽑아야하는게 달라짐 m넘이냐 Y넘이냐)
		내 번호가 M넘버이고 M라이크가 0
		 - > 나만 좋아요를 누른 상태
		 == 상대번호는 Y_number

		내 번호가 M넘버이고 M라이크가 1
		- > 서로 좋아요 (내가 먼저 좋아요 검)
		== 상대 번호는 Y_NUMBER

		내 번호가 Y넘버이고 M라이크가 1
		-> 서로 좋아요 (상대가 날 먼저 좋아요 검)*/
		int flagA = 0; //for문 break 플래그
		int flagB = 0; //for문 break 플래그
		int flagC = 0; //for문 break 플래그
		for(int i = 0 ; i < likeUserList.size(); i++){ //아래 세가지 경우만 SNS리스트를 띄워주는 경우에 해당. -> 각각의 경우에 맞는 상대의 넘버 (경우에따라, m넘일수도, y넘일 수도 있음.) 
			if(likeUserList.get(i).getM_like() !=1 && likeUserList.get(i).getM_number() == loginUserNumber && flagA==0){
				othersNum=likeUserDao.othersNumWhenA(loginUserNumber); //나를 좋아요한 회원들의 회원번호를 리스트형태로 가져옴
				
				for(int j = 0; j<othersNum.size();j++){
					result.add(othersNum.get(j));
				}
				flagA++;
				continue;
			}else if(likeUserList.get(i).getM_like() == 1 && likeUserList.get(i).getM_number() == loginUserNumber && flagB==0){
				othersNum=likeUserDao.othersNumWhenB(loginUserNumber);
				for(int j = 0; j<othersNum.size();j++){
					result.add(othersNum.get(j));
				}
				flagB++;
				continue;
			}else if(likeUserList.get(i).getM_like() ==1 && likeUserList.get(i).getY_number() == loginUserNumber && flagC==0){
				othersNum=likeUserDao.othersNumWhenC(loginUserNumber);
				for(int j = 0; j<othersNum.size();j++){
					result.add(othersNum.get(j));
				}
				flagC++;
				continue;
			}
		}
		return result;
	}

	public void write(Sns sns, HttpServletRequest request) {
		if(sns.getSns_picture() != null && !sns.getSns_picture().isEmpty()){
			updateFileCreate(sns.getSns_picture(),request);
			sns.setFileUrl(sns.getSns_picture().getOriginalFilename());
		}else{
			sns.setFileUrl("nothing");
		}
		int snsMaxNum = snsDao.getMax(sns.getM_number());//로그인 회원의 M_number에 해당하는 SNS목록들중, 최대 SNS_no를 불러옴
		sns.setSns_no(++snsMaxNum); 
		snsDao.insert(sns);
	}

	private void updateFileCreate(MultipartFile sns_picture, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/")+"/fileupload/";
		FileOutputStream fos = null;
		try{
			fos = new FileOutputStream(uploadPath + sns_picture.getOriginalFilename());
			InputStream in = sns_picture.getInputStream();
			int len;
			byte[] buf = new byte[4096];
			while((len=in.read(buf))!=-1){
				fos.write(buf,0,len);
			}
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				if(fos!=null){
					fos.flush();
					fos.close();
				}
			}catch(IOException e){
				
			}
		}
	}
	//@Override
	public void update(Sns sns, HttpServletRequest request) {
		if(!sns.getSns_picture().isEmpty()){
			updateFileCreate(sns.getSns_picture(),request);
		}
		snsDao.update(sns);
	}
	public User getUserbyNum(int m_number) {
		User snsUser = userDao.getUserbyNum(m_number);
		return snsUser;
	}

	public void delete(int sns_no, int m_number) {
		snsDao.delete(sns_no,m_number);
		replyDao.delete(sns_no, m_number, -1); //sns게시물 자체를 삭제할시, -1을 넘겨 플래그로 사용
	}

	public Sns detail(Integer sns_no, int m_number) {
		return snsDao.detail(sns_no,m_number);
	}

	public List<Reply> replyList(int sns_no, int m_number) {
		return replyDao.replyList(sns_no,m_number);
	}

	@Override
	public String ObjectToJSONString(Object obj) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(obj);
		return json;
	}

	@Override
	public void replyDelete(int sns_no, int m_number, int r_num) {
		replyDao.delete(sns_no, m_number, r_num);
	}

	@Override
	public void replyReg(int sns_no, int m_number, String r_content) {
		Reply reply = new Reply();
		String m_nickname = semiDao.getUserProfile(m_number).getM_nickname();
		int r_num = replyDao.getMaxRnum(sns_no);
		
		reply.setSns_no(sns_no);
		reply.setM_number(m_number);
		reply.setR_content(r_content);
		reply.setM_nickname(m_nickname);
		reply.setR_num(++r_num);
		replyDao.register(reply);
	}
}
