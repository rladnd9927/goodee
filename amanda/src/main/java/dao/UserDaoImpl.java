package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.SemiUserMapper;
import dao.mapper.UserMapper;
import logic.Member;
import logic.SemiUser;
import logic.User;
import logic.UserProfile;

@Repository
public class UserDaoImpl implements UserDao{
   @Autowired
   private SqlSessionTemplate sqlSession;
   private final String NS = "dao.mapper.UserMapper.";
   private final String CS = "dao.mapper.ChatMapper.";

   //@Override
   public User getUser(String email, String password) {
      Map<String, String> param = new HashMap<String,String>();
      param.put("email", email);
      param.put("password", password);
      return sqlSession.selectOne(NS + "getUser",param);
   }

   //@Override
   public List<User> getUser() {
      return sqlSession.selectList(NS + "getUser" );
   }

   //@Override
   public List<User> getUser(String[] idchks) {
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("idchks", idchks);
      return sqlSession.selectList(NS+"getUser",map);
   }

   public User getUserbyNum(int m_number) {
      return sqlSession.getMapper(UserMapper.class).getUserbyNum(m_number);
   }

   public void createSemi(UserProfile userprofile) {
      sqlSession.getMapper(UserMapper.class).createsemi(userprofile);
   }

   public void createProfile(UserProfile userprofile) {
      sqlSession.getMapper(UserMapper.class).createprofile(userprofile);
   }

   public int getNum() {
      return sqlSession.getMapper(UserMapper.class).getNum();
   }

   public void delete(int m_number) {
      sqlSession.getMapper(UserMapper.class).delete(m_number);
   }
   
   public UserProfile getUserProfile(int m_number) {
      return sqlSession.getMapper(UserMapper.class).getUserProfile(m_number);
   }

   public List<User> userlist() {
      return sqlSession.selectList(NS + "userlist"); 
   }
   
      public List<User> likelist(int userNum, User myNum, int c_number) {
         Map<String, Object> param = new HashMap<String, Object>();
         //param.put("num", num);
         param.put("userNum", userNum); 
         param.put("c_number", c_number);
         param.put("myNum",  myNum.getM_number());
         System.out.println(param);
         return sqlSession.selectList(NS + "likelist", param);
         
      }

      public List<User> likelist2(int userNum, User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         //param.put("num", num);
         param.put("userNum", userNum); 
         param.put("myNum",  myNum.getM_number());
         Integer search1 = sqlSession.selectOne(NS + "search1",param); 
         System.out.println(search1); 
         if(search1!=1){            
            sqlSession.delete(CS + "chatdelete1", search1);
         }
         return sqlSession.selectList(NS + "likelist2", param);
      } 

      public String ser(int userNum, User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum);
         param.put("myNum",  myNum.getM_number());  
         System.out.println( myNum.getM_number()+"User 확인 ㅎ");
         System.out.println(param+"ser param값");
         return sqlSession.selectOne(NS + "ser", param); 
      }
      
      public String aer(int userNum, User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum);
         param.put("myNum", myNum.getM_number());  
         System.out.println(userNum+"++++"+myNum);
         System.out.println("누름? 안누름?");
         return sqlSession.selectOne(NS + "aer", param);   
      }

      public List<User> likelist3(int userNum, User myNum, int m_like) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum); 
         param.put("myNum",  myNum.getM_number());
         System.out.println(m_like);       
         //맞좋아요 되는순간 CHAT 테이블에 고유번호 추가되서 방만들기
         sqlSession.selectList(CS + "listadd", m_like);
         return sqlSession.selectList(NS + "likelist3", param);
      }

      public List<User> nolist(int userNum, User myNum) {
         Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum);  
         param.put("myNum",  myNum.getM_number());
         
         Integer search2 = sqlSession.selectOne(NS + "search2",param);      
         if(search2!=1){            
            sqlSession.delete(CS + "chatdelete1", search2);
         }
         sqlSession.delete(CS + "chatdelete2", param);
         return sqlSession.selectList(NS + "nolist", param);
      }

   @Override 
   public int m_like(int userNum, User myNum) {
        Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum); 
         param.put("myNum",  myNum.getM_number());
         return sqlSession.selectOne(NS + "m_like", param);
   }
   @Override
   public String cer(int userNum, User myNum) {
       Map<String, Object> param = new HashMap<String, Object>();
         param.put("userNum", userNum);
         param.put("myNum", myNum.getM_number());  
         return sqlSession.selectOne(NS + "cer", param);
   }
   public List<User> list(String column, String find) {
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("column", column);
      param.put("find", find);
      return sqlSession.selectList(NS + "list" , param);
   }

   @Override
   public User getUser(int m_number) {
      return sqlSession.getMapper(UserMapper.class).getUserbyNum(m_number);
   }

   @Override
   public Member like(int m_number) {
      return sqlSession.getMapper(UserMapper.class).like(m_number);
   }

   @Override
   public UserProfile getUserScore(int m_num) {
      return sqlSession.getMapper(UserMapper.class).userScore(m_num);
   }

   @Override
   public List<UserProfile> getUserProfile() {
      return sqlSession.selectList(NS + "getUserProfile2" );
   }

   @Override
   public UserProfile getUserPro() {
      return sqlSession.getMapper(UserMapper.class).getUserPro();
   }


   @Override
   public User getUpdateUser(int m_number) {
      return sqlSession.getMapper(UserMapper.class).getUpdateUser(m_number);
   }

   @Override
   public UserProfile getUpdateUserProfile(int m_number) {
      return sqlSession.getMapper(UserMapper.class).getUpdateUserProfile(m_number);
   }

   @Override
   public void updateUser(UserProfile userProfile) {
      sqlSession.getMapper(UserMapper.class).updateUser(userProfile);
   }

   @Override
   public void updateProfile(UserProfile userProfile) {
      sqlSession.getMapper(UserMapper.class).updateProfile(userProfile);
   }

   @Override
   public SemiUser duplicateUser(String semiuser) {
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("UserId", semiuser);
      return sqlSession.selectOne(NS + "duplicateUser" , param);
   }

	@Override
	public void insertDuple(int m_number) {
		sqlSession.getMapper(UserMapper.class).insertDuple(m_number);
	}
}