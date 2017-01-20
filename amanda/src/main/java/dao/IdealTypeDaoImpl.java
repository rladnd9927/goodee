package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.IdealTypeMapper;
import logic.IdealType;
import logic.UserProfile;

@Repository
public class IdealTypeDaoImpl implements IdealTypeDao{

   @Autowired
   private SqlSessionTemplate sqlSession;

   //@Override
   public IdealType getIdealType(int loginUserNumber) {
      return sqlSession.getMapper(IdealTypeMapper.class).getIdealType(loginUserNumber);
   }

   //@Override
   public void idealUpdate(int loginUserNumber, IdealType idealtype) {
      Map<Object, Object> map = new HashMap<Object, Object>();
      map.put("loginUserNumber", loginUserNumber);
      map.put("idealtype", idealtype);
      sqlSession.getMapper(IdealTypeMapper.class).idealUpdate(map);
   }
   /*
   //@Override
   public List<UserProfile> getIdealList(IdealType idealtype) {
      return sqlSession.getMapper(IdealTypeMapper.class).getIdealList(idealtype);
   }
   */

   //@Override
   public List<UserProfile> getIdealList(int i_height) {
      return sqlSession.getMapper(IdealTypeMapper.class).getIdealList(i_height);
   }
   
   //@Override
      public void InsertZero(int loginUserNumber) {
         sqlSession.getMapper(IdealTypeMapper.class).InsertZero(loginUserNumber);
      }
   
   
}