

package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginRequiredException;
import logic.Chat;
import logic.ChatService;
import logic.Member;
import logic.User;
import logic.UserService;

@Controller
public class ChatController {
   
   @Autowired
   private ChatService chatService;
   
   @RequestMapping("chat/chatlist")
   public ModelAndView chatlsit(HttpSession session){
           User myNum = (User)session.getAttribute("USER");
           
            if(myNum == null) {
                throw new LoginRequiredException();
            }
            ModelAndView mav = new ModelAndView();      
            //내가 좋아요를 누르기 전에 내가 좋아요를 누르려는 사람이 이미 나를 좋아요를 눌렀는지 안눌렀는지 테스트.
            List<User> chat = chatService.mlikelist(myNum); 
                  mav.addObject("chatlist", chat);
                  mav.setViewName("chat/chatlist");
                  return mav; 
   }
   
   
   
   @RequestMapping("chat/detail")
   public ModelAndView detail(int num){ 

      ModelAndView mav = new ModelAndView();
      List<Member> chat = chatService.detail(num);
      mav.addObject("chat", chat);
      return mav;
      
   }
   
   @RequestMapping(value="detailAjax")
   public @ResponseBody ResponseEntity<String> detailAjax(int num, ModelAndView modelAndView) throws Throwable {
      ObjectMapper mapper = new ObjectMapper();
      HashMap<String, String> params = new HashMap<String, String>();

      /////////////////////////////////////////////////////////////
      List<Member> chat =chatService.detail(num);
      Chat chat2 = chatService.content(chat.get(0).getC_number());
      
      params.put("con", chat2.getC_subject());
      /////////////////////////////////////////////////////////////
      
      HttpHeaders header = new HttpHeaders(); 
      
      header.add("Content-type", "text/json; charset=EUC-KR");
      
      return new ResponseEntity<String>(mapper.writeValueAsString(params), header, HttpStatus.CREATED);
   }
   
   @RequestMapping("chat/send")
   public String send(String userId, String myId, String ms, int num){
      chatService.send(userId, myId, ms, num);
      return "redirect:detail.do?num=" + num;
      
   }
}