package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{
   @Autowired
   private ChatDao chatDao;
   
//   @Override
//   public void write(Chat chat, HttpServletRequest request) {
//      int num = chatDao.getMaxNum(); 
//      chat.setNum(++num);
//      chatDao.write(chat);
//      
//   }

   @Override
   public List<User> mlikelist(User myNum) {
      return chatDao.mlikelist(myNum);
   }

   @Override
   public List<Member> detail(int num) {
      return chatDao.detail(num);
   }
   

   @Override
   public Chat content(int c_number) {
      return chatDao.content(c_number);
   }

   @Override
   public void send(String userId, String myId, String ms, int num) {
      chatDao.send(userId, myId, ms, num);
   }

}