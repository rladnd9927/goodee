package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ChatService {
//
//   void write(Chat chat, HttpServletRequest request);

   List<User> mlikelist(User myNum);

   List<Member> detail(int num);

   Chat content(int c_number);

   void send(String userId, String myId, String ms, int num);

}