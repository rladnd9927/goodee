package controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import exception.LoginRequiredException;
import logic.Reply;
import logic.Sns;
import logic.SnsService;
import logic.User;

@Controller
public class SnsController {
	@Autowired
	private SnsService snsService;
	
	@RequestMapping("sns/snsmain")//모든 팔로워들의 글이 다 나타나야함. (SNS디비의 모든 정보를 조회)
	public ModelAndView snsmain(HttpSession session){
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("USER");
		if(loginUser == null) {
	         throw new LoginRequiredException();
	    }
		
		List<Sns> snsList = new ArrayList<Sns>();
		snsList = snsService.getList(loginUser.getM_number()); //sns디비의 모든 게시물 정보를 가져올건데, 현재 로그인 유저의 유저번호를 이용하여, 좋아요 한사람의 게시물만 sns디비에서 가져온다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		mav.addObject("today",today);
		mav.addObject("snsList",snsList);
		mav.addObject("loginUser",loginUser);
		return mav;
	}
	
	@RequestMapping("sns/othersnslist") //snsmain 뷰단에서 "내가좋아요 한 회원의 sns게시물"을 눌렀을 경우, 이 requestmapping으로 연결
	public ModelAndView othersnslist(HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<Integer> m_numberList = new ArrayList<Integer>(); //좋아요 한 회원의 m_number를 받아올 변수
		List<Sns> snsList = new ArrayList<Sns>(); //선택된 회원의 sns게시물 정보를 저장.

		User loginUser = (User)session.getAttribute("USER");
		if(loginUser == null) {
	         throw new LoginRequiredException();
	    }
		m_numberList = snsService.getOthersNum(loginUser.getM_number()); //로그인한 유저의 회원번호를 이용하여, 좋아요한 회원의 회원번호들을 list로 가져온다.
		
		for(int i = 0 ; i<m_numberList.size(); i++){
			for(int j = 0 ; j < snsService.getList(m_numberList.get(i)).size(); j++){
				snsList.add(snsService.getList(m_numberList.get(i)).get(j)); //내가 좋아요한 회원의 회원번호를 가져와서, 그 번호로 sns디비에서 게시물 목록을 뽑아서 게시물 객체들을 snsList에 등록
			}
			
		}
		
		Collections.sort(snsList,new Comparator<Sns>() { //다른 회원들 sns리스트를 날짜,시간 최신별로 정렬.
			public int compare(Sns o1, Sns o2) {
				return o2.getSns_date().compareTo(o1.getSns_date());
			}
		});
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		mav.addObject("today",today);
		mav.addObject("snsList",snsList);
		mav.addObject("loginUser",loginUser);
		return mav;
	}
	@RequestMapping("sns/snsdetail")
	public @ResponseBody List<Object> snsdetail(int sns_no, int m_number){
		Sns sns = snsService.detail(sns_no,m_number);
		List<Reply> replyList = snsService.replyList(sns_no,m_number);
		List<Object> responseObj = new ArrayList<Object>();
		String snsjson=null;
		String snsreplyList=null;
		try {
			snsjson = snsService.ObjectToJSONString(sns);
			snsreplyList = snsService.ObjectToJSONString(replyList); //sns객체와 replyList객체룰 json String형태로 변환함.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		responseObj.add(snsjson);
		responseObj.add(snsreplyList);
		return responseObj;
	}
	
	@RequestMapping("sns/snsreg")
	public ModelAndView snsreg(HttpSession session){
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("USER");
		if(loginUser == null) {
	         throw new LoginRequiredException();
	    }
		Sns sns = new Sns();
		sns.setM_number(loginUser.getM_number());
		mav.addObject(sns);
		mav.addObject("loginUser",loginUser);
		mav.setViewName("sns/snsreg");
		return mav;
	}

	@RequestMapping("sns/snswrite")
	public ModelAndView snswrite(@Valid Sns sns, BindingResult bindingResult, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("sns/snsreg");
		if(bindingResult.hasErrors()){
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		snsService.write(sns,request);
		mav.setViewName("redirect:snsmain.do");
		return mav;
	}
	
	@RequestMapping("sns/snsmodify")
	public ModelAndView snsmodify(@Valid Sns sns, BindingResult bindingResult, HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView("sns/snsmodifyForm");
		User loginUser = (User)session.getAttribute("USER");
		List<Reply> replyList = snsService.replyList(sns.getSns_no(),sns.getM_number());
		
		if(bindingResult.hasErrors()){
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("snsdetail",snsService.detail(sns.getSns_no(),sns.getM_number()));
			mav.addObject("replyList",replyList);
			return mav;
		}
		
		if(!loginUser.getM_email().equals((snsService.getUserbyNum(sns.getM_number())).getM_email())){ //로그인 유저와 sns유저가 다르다면? -> 수정 불가하게..
			mav.setViewName("sns/snsmodifyForm");
			bindingResult.reject("error.update.sns");
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("sns",snsService.detail(sns.getSns_no(),sns.getM_number()));
			return mav;
		}
		//수정시 새로 업로드 된 파일이 없음
		if(sns.getSns_picture().isEmpty()){
			sns.setFileUrl(request.getParameter("file2"));
		}else{//파일 업로드를 다시함
			sns.setFileUrl(sns.getSns_picture().getOriginalFilename());
		}
		snsService.update(sns,request);
		mav.setViewName("redirect:snsmain.do");
		mav.addObject("sns",sns);
		mav.addObject("loginUser",loginUser);
		return mav;
	}
	
	@RequestMapping("sns/snsmodifyForm")
	public ModelAndView snsmodifyForm(int sns_no, int m_number){
		ModelAndView mav = new ModelAndView();
		Sns sns = snsService.detail(sns_no,m_number);
		mav.addObject("sns",sns);
		
		return mav;
	}
	
	@RequestMapping("sns/snsdelete")
	public ModelAndView snsdelete(int sns_no,int m_number, HttpSession session){
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("USER");
		if(!loginUser.getM_email().equals((snsService.getUserbyNum(m_number)).getM_email())){ //로그인 유저와 sns유저가 다르다면? -> 삭제 불가하게..
			mav.setViewName("sns/snsmain");
			mav.addObject("sns",snsService.detail(sns_no,m_number));
			return mav;
		}
		
		snsService.delete(sns_no, m_number);
		mav.setViewName("redirect:snsmain.do");
		return mav;
	}
	@RequestMapping("sns/replyreg")
	public @ResponseBody List<Object> replyreg(int sns_no, String r_content, int m_number, HttpSession session){
		User loginUser = (User)session.getAttribute("USER");
		try {
			r_content = new String(r_content.getBytes("8859_1"),"EUC-KR");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int loginUserNumber = loginUser.getM_number();
		
		snsService.replyReg(sns_no, loginUserNumber, r_content);
		
		Sns sns = snsService.detail(sns_no,m_number);
		
		List<Reply> replyList = snsService.replyList(sns_no,m_number);
		List<Object> responseObj = new ArrayList<Object>();
		
		String snsjson=null;
		String snsreplyList=null;
		try {
			snsjson = snsService.ObjectToJSONString(sns);
			snsreplyList = snsService.ObjectToJSONString(replyList); //sns객체와 replyList객체룰 json String형태로 변환함.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		responseObj.add(snsjson);
		responseObj.add(snsreplyList);
		return responseObj;
	}
	@RequestMapping("sns/replydelete")
	public ModelAndView replydelete(int sns_no,int m_number, int r_num, HttpSession session){
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("USER");
		
		if(loginUser.getM_number() != m_number){ //로그인 유저와 sns유저가 다르다면? -> 삭제 불가하게..
			mav.setViewName("sns/snsmain");
			mav.addObject("sns",snsService.detail(sns_no,m_number));
			return mav;
		}
		snsService.replyDelete(sns_no, m_number,r_num);
		if(r_num != -1){
			mav.setViewName("redirect:othersnslist.do");
		}else{
			mav.setViewName("redirect:snsmain.do");
		}
		return mav;
	}
}
