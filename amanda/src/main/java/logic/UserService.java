package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
   List<Integer> getOthersNum(int m_number);
   User getUserByIdPw(User user);
   void createUser(UserProfile userprofile, HttpServletRequest request);
   int getNum();
   List<User> getUser();
   void delete(int num);
   UserProfile getUserProfile(int m_number);
   List<User> userlist();
    List<Member> mypage(User myNum);
    List<Member> youpage(User myNum);
    String ser(int userNum, User myNum);
    String aer(int userNum, User myNum);
    List<User> likelist3(int userNum, User myNum,int m_like);
    List<User> likelist(int userNum, User myNum, int c_number);
    List<User> likelist2(int userNum, User myNum);
    List<User> nolist(int userNum, User myNum); 
    int m_like(int userNum, User myNum);
    String cer(int userNum, User myNum);
    List<User> listFind(String column, String find);
    User getUser(int m_number);
   Member like(int m_number);
   UserProfile getUserScore(int m_num);
   List<UserProfile> getUserProfile();
   UserProfile getUserPro();
   User getUpdateUser(int m_number);
   UserProfile getUpdateUserProfile(int m_number);
   
   void updateUserProfile(UserProfile userProfile, HttpServletRequest request);
   //ID 중복확인
   SemiUser duplicateUser(String semiuser);
   void insertDuple(int m_number);
   
}