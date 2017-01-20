package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SemiUserMapper;
import dao.mapper.UserMapper;
import logic.SemiUser;
import logic.Simsa;
import logic.User;
import logic.UserProfile;

@Repository
public class SemiUserDaoImpl implements SemiUserDao{
   @Autowired
   private SqlSessionTemplate sqlSession;

   //@Override
   public List<SemiUser> getSemiUser(int loginUserNumber) {
      return sqlSession.getMapper(SemiUserMapper.class).getSemiUser(loginUserNumber);
   }

   public UserProfile getsemiUserProfile(int m_number) {
      return sqlSession.getMapper(SemiUserMapper.class).getsemiUserProfile(m_number);
   }
   
   @Override
   public SemiUser getSemiUserbyNumScore(int m_number, int s_score) {
      Map<Object, Object> map = new HashMap<Object, Object>();
      map.put("m_number", m_number);
      map.put("s_score", s_score);
      return sqlSession.getMapper(SemiUserMapper.class).getSemiUserByNumScore(map);
   }

   @Override
   public void pointCountUp(SemiUser semiuser) {
      sqlSession.getMapper(SemiUserMapper.class).pointCountUp(semiuser);
   }

   @Override
   public void semiDelete(SemiUser semiuser) {
      sqlSession.getMapper(SemiUserMapper.class).semiDelete(semiuser);
   }

   @Override
   public SemiUser getOkMember(SemiUser semiuser) {
      return sqlSession.getMapper(SemiUserMapper.class).getOkMember(semiuser);
   }

   @Override
   public void memberInsert(SemiUser selectOkMember) {
      sqlSession.getMapper(SemiUserMapper.class).memberInsert(selectOkMember);
   }

   @Override
   public void idealTypeInsert(SemiUser selectOkMember) {
      sqlSession.getMapper(SemiUserMapper.class).idealTypeInsert(selectOkMember);
   }

   @Override
   public Simsa getSimsaMember(int m_number) {
      return sqlSession.getMapper(SemiUserMapper.class).getSimsaMember(m_number);
   }

   @Override
   public void UpdateSimsa(int m_number, int loginUserNumber) {
      Map<Object, Object> map = new HashMap<Object, Object>();
      map.put("m_number", m_number);
      map.put("loginUserNumber", loginUserNumber);
      sqlSession.getMapper(SemiUserMapper.class).UpdateSimsa(map);
   }
   
   @Override
      public UserProfile getUserProfile(int m_number) {
         return sqlSession.getMapper(SemiUserMapper.class).getUserProfile(m_number);
      }
}