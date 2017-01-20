package dao;

import java.util.List;

import logic.Chat;
import logic.Member;
import logic.User;

public interface ChatDao {

   List<User> mlikelist(User myNum);

   List<Member> detail(int num);

   Chat content(int c_number);

   void send(String userId, String myId, String ms, int num);

}