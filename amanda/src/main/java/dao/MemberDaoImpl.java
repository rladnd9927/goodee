package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Member;
import logic.User;

@Repository
public class MemberDaoImpl implements MemberDao {

      @Autowired
      private SqlSessionTemplate sqlSession;
      private final String MS = "dao.mapper.MemberMapper.";
      
      public List<Member> mypage(User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("myNum", myNum.getM_number());
         return sqlSession.selectList(MS + "mypage", param);
      }

      public List<Member> youpage(User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("myNum", myNum.getM_number());
         return sqlSession.selectList(MS + "youpage", param);
      }
   
}