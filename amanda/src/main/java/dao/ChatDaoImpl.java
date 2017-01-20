package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MemberMapper;
import logic.Chat;
import logic.Member;
import logic.User;

@Repository
public class ChatDaoImpl implements ChatDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.MemberMapper.";
	private final String CS = "dao.mapper.ChatMapper.";
	
			@Override
			public List<User> mlikelist(User myNum) {
				
			      Map<String, Object> param = new HashMap<String, Object>();
			      param.put("myNum", myNum.getM_number()); 
			      return sqlSession.selectList(NS + "mlikelist", param);
			}

			@Override
			public List<Member> detail(int num) {
				 /*Map<String, Integer> param = new HashMap<String, Integer>();
				 param.put("num", num); 
				return sqlSession.selectOne(NS+"detail", param);*/
				return sqlSession.getMapper(MemberMapper.class).detail(num);
			}
			

			@Override
			public Chat content(int c_number) {
				 Map<String, Object> param = new HashMap<String, Object>();
				 param.put("c_number", c_number);
				return sqlSession.selectOne(CS+"content", c_number);
			}

			@Override
			public void send(String userId, String myId, String ms, int num) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("userId", userId);
				//param.put("myId", myId);
//				ms = "&lt;br&gt;"+myId +" :" + ms; 
				ms= myId + " :" + ms;
				param.put("ms", ms);
				param.put("num", num); 
				sqlSession.update(CS + "send", param);	 
				
			}

}
