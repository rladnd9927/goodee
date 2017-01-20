package controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.AdminRequiredException;
import exception.LoginRequiredException;
import logic.IdealType;
import logic.IdealTypeService;
import logic.Member;
import logic.SemiUser;
import logic.User;
import logic.UserProfile;
import logic.UserService;

@Controller
public class UserController {

   @Autowired
   private UserService userService;

   @Autowired
   private IdealTypeService idealtypeService;
   
      @RequestMapping("user/userList")
   public ModelAndView userList(String column, String find, HttpServletRequest request, HttpSession session){
      List<User> userList = userService.getUser();

      User loginUser = (User)session.getAttribute("USER");
      if(loginUser == null) {
          throw new LoginRequiredException();
      }
      int m_num = loginUser.getM_number();
      UserProfile score = userService.getUserScore(m_num);
      List<UserProfile> userProfile = userService.getUserProfile();
      //UserProfile userProfile = userService.getUserPro();
      if(column == null || column.equals("")) column = null;
      if(find == null || find.equals("")) find = null;
      if(column == null) find = null;
      if(find == null) column = null;
      if(find != null && request.getMethod().equalsIgnoreCase("GET")){
         try{
            find = new String(find.getBytes("8859_1"),"euc-kr");
         }catch(UnsupportedEncodingException e){
            e.printStackTrace();
         }
      }
      ModelAndView mav = new ModelAndView();
    List<User> userCount = userService.listFind(column,find);
    mav.addObject("userList",userList);
      mav.addObject("userProfile",userProfile);
      System.out.println(userProfile);
    mav.addObject("userCount",userCount);
    mav.addObject("find",find);
    mav.addObject("score",score);
    return mav;
   }
   
   @RequestMapping("user/userlist2")
    public ModelAndView userlist2(){
       ModelAndView mav = new ModelAndView("user/userlist2");
       List<User> chat = userService.userlist();
       mav.addObject("userlist", chat);
       return mav;
    }
      
   @RequestMapping("user/userDetail")
   public ModelAndView userDetail(int m_number){
      ModelAndView mav = new ModelAndView();
      UserProfile userProfile = userService.getUserProfile(m_number);
      mav.addObject(userProfile);
      return mav;
   }
   @RequestMapping("user/main")
   public ModelAndView main(HttpSession session){
      ModelAndView mav = new ModelAndView();
      User loginUser = (User)session.getAttribute("USER");
      if(loginUser == null) {
          throw new LoginRequiredException();
      }
      return mav;
   }
   ////////////////////////////////////////////////////////////////////////////////////////////////////////
   //알림창
   @RequestMapping("user/alert")
   public ModelAndView alert(){
      ModelAndView mav = new ModelAndView("user/alert");
      return mav;
   }

   //좋아요를 눌렀을때.
    @RequestMapping("user/likelist")
    public ModelAndView likelist(int userNum, HttpSession session){
       System.out.println(userNum+"유저아이디"); 
      User myNum = (User)session.getAttribute("USER");
       ModelAndView mav = new ModelAndView();  
       
       //내가 좋아요를 누르기 전에 내가 좋아요를 누르려는 사람이 이미 나를 좋아요를 눌렀는지 안눌렀는지 테스트.
       String bb = userService.aer(userNum, myNum);
       
       //이미 좋아요를 눌렀는지 테스트 1이 리턴되서 aa에 들어가면 이미 좋아요를 눌렀다는 뜻.
       String aa = userService.ser(userNum, myNum);
       
       String cc= userService.cer(userNum, myNum);
       

       //이미 좋아요 눌럿는데도 해제안되서 한번 검토
      if(cc!=null){  
         userService.nolist(userNum, myNum);
          return new ModelAndView("chat/alert");          
          
       }
       //상대가 나를 좋아요 누르지 않았을때
       if(bb==null){
          //내가 상대를 이미 좋아요늘 눌렀는지 안눌렀는지 
          //널일경우 안눌렀음. 
          if(aa==null){   
          //고유번호 생성
             int c_number = (int)(Math.random() * 1000 + 1);
             System.out.println("ㄴㄴ");
             //좋아요 테이블에 상대추가.
             List<User> chat = userService.likelist(userNum, myNum,c_number);
             mav.addObject("userlist", chat);
             mav.setViewName("redirect:/user/userlist2.do");
             return new ModelAndView("chat/alert2"); 
              
          //내가 좋아요룰 이미 누른상태일때. 
          }else{
             System.out.println("ㅇㅇ");
             //likelist2는 좋아요 해제. 
             List<User> chat = userService.likelist2(userNum, myNum);
             mav.addObject("userlist", chat);
             mav.setViewName("redirect:/user/userlist2.do");
             return new ModelAndView("chat/alert");
          }
       //상대가 나를 좋아요 눌렀을때
       }else{
         int m_like = userService.m_like(userNum, myNum);
         
         //i_like_member 테이블에 m_like 1 추가.
          List<User> chat = userService.likelist3(userNum, myNum,m_like);
          mav.addObject("userlist", chat);
          mav.setViewName("redirect:/user/userlist2.do");
          return new ModelAndView("chat/alert2"); 
       }
    }

   @RequestMapping("user/nolist")
   public ModelAndView nolist(int userNum, HttpSession session){
      User myNum = (User)session.getAttribute("USER");
      ModelAndView mav = new ModelAndView();
      List<User> chat = userService.nolist(userNum, myNum);
      mav.addObject("userlist", chat);
      mav.setViewName("redirect:/user/mypage2.do");
      return new ModelAndView("chat/alert");
   } 

   @RequestMapping("user/mypage2")
   public ModelAndView mypage2 (HttpSession session){
      ModelAndView mav = new ModelAndView("user/mypage2");
      User myNum = (User)session.getAttribute("USER");
      if(myNum == null) {
          throw new LoginRequiredException();
      }
      int m_num = myNum.getM_number();
      List<Member> chat = userService.mypage(myNum);
      List<Member> chat2 = userService.youpage(myNum);
      List<User> userList = userService.getUser();
      UserProfile userProfile = userService.getUserProfile(m_num);
      mav.addObject("userList",userList);
      mav.addObject("mypage", chat); 
      mav.addObject("youpage", chat2);   
      mav.addObject("userProfile",userProfile);
      return mav; 
   }

   @RequestMapping("user/loginForm")
   public ModelAndView login(){
      ModelAndView mav = new ModelAndView("user/login");
      mav.addObject(new User());
      return mav;
   }

   @RequestMapping("user/login")
   public ModelAndView login(@Valid User user, BindingResult bindingResult, HttpSession session){
      ModelAndView mav = new ModelAndView();
      if(bindingResult.hasErrors()){
         mav.getModel().putAll(bindingResult.getModel());
         return mav;
      }
      
      User loginUser = userService.getUserByIdPw(user);
      if(loginUser == null){
         bindingResult.reject("error.login.id");
         mav.getModel().putAll(bindingResult.getModel());
         return mav;
      }
      session.setAttribute("USER", loginUser);

      mav.addObject("user",loginUser);
      mav.setViewName("user/main");

      return mav;
   }
   @RequestMapping("user/logout")
   public ModelAndView logout(HttpSession session){
      ModelAndView mav = new ModelAndView();
      session.invalidate();
      mav.setViewName("redirect:loginForm.do");
      return mav;
   }

   @RequestMapping("user/joinForm1")
   public ModelAndView joinForm1(){
      ModelAndView mav = new ModelAndView();
      SemiUser semiuser = new SemiUser();
      mav.addObject("semiuser",semiuser);      
      return mav;
   }
   @RequestMapping("user/join1")
   public ModelAndView join1(@Valid SemiUser semiuser, BindingResult bindingResult){
      ModelAndView mav = new ModelAndView();
      
      System.out.println(semiuser.getS_email());
      if(bindingResult.hasErrors()){
         bindingResult.reject("error.input.user");
         mav.getModel().putAll(bindingResult.getModel());
         return mav;
      }
      
      UserProfile userprofile = new UserProfile();
      semiuser.setM_number(userService.getNum()+1);
      userprofile.setSemiuser(semiuser);
      
      SemiUser a = userService.duplicateUser(semiuser.getS_email());
      if(a != null) {
         return new ModelAndView("user/alert");
      } else {
      mav.addObject("userprofile",userprofile);
      mav.setViewName("user/joinForm2");
      return mav;
      }
   }

   @RequestMapping("user/joinForm2")
   public ModelAndView joinForm2(SemiUser semiuser, UserProfile userprofile, BindingResult bindingResult, HttpServletRequest request){
      ModelAndView mav = new ModelAndView();
      DateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
      try{
         userprofile.setM_birthday(sf.parse("1980-01-01"));
      }catch(ParseException e){
         e.printStackTrace();
      }
      userprofile.setSemiuser(semiuser);
      userprofile.setM_number(userService.getNum());
      mav.addObject("userprofile",userprofile);

      try{
         userService.createUser(userprofile,request);
         userService.insertDuple(userprofile.getM_number()); //중복 테이블에 Insert
      }catch(DuplicateKeyException e){
         e.printStackTrace();
         bindingResult.reject("error.duplicate.user");
         return mav;
      }
      mav.setViewName("redirect:loginForm.do");
      return mav;
   }

   @InitBinder
   public void initBinder(WebDataBinder binder) {
      DateFormat dateFormat =  new SimpleDateFormat("yyyy-MM-dd");
      binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
   }
      
   @RequestMapping("user/admin")
   public ModelAndView admin(HttpSession session, String column, String find, HttpServletRequest request){
      User loginUser = (User)session.getAttribute("USER");
      if(loginUser == null){
         throw new LoginRequiredException();
      }
      if(!loginUser.getM_email().equals("admin")){
         throw new AdminRequiredException();
      }
      ModelAndView mav = new ModelAndView();
      List<User> userList = userService.getUser();

      List<UserProfile> userProfile = new ArrayList<UserProfile>();
      for(int i =0; i<userList.size(); i++){
         userProfile.add(userService.getUserProfile(userList.get(i).getM_number()));
      }

      if(column == null || column.equals("")) column = null;
      if(find == null || find.equals("")) find = null;
      if(column == null) find = null;
      if(find == null) column = null;
      if(find != null && request.getMethod().equalsIgnoreCase("GET")){
         try{
            find = new String(find.getBytes("8859_1"),"euc-kr");
         }catch(UnsupportedEncodingException e){
            e.printStackTrace();
         }
      }
      List<User> userCount = userService.listFind(column,find);
      mav.addObject("userList",userList);
      mav.addObject("userProfile",userProfile);
      mav.addObject("userCount",userCount);
      mav.addObject("find",find);
      return mav;
   }
   
   @RequestMapping("user/updateForm")
   public ModelAndView updateForm(int m_number){
      ModelAndView mav = new ModelAndView();
      User updateuser = userService.getUpdateUser(m_number);
      UserProfile updateuserProfile = userService.getUpdateUserProfile(m_number);
      updateuserProfile.setUser(updateuser);
      mav.addObject(updateuser);
      mav.addObject(updateuserProfile);
      return mav;
   }
   
   @RequestMapping("user/update") //편집한 이상형 업데이트 & 일치하는 이상형을 리스트로 출력
      public ModelAndView update(HttpSession session, 
            UserProfile userProfile, User user, 
            BindingResult bindingResult, HttpServletRequest request, int m_number){
      ModelAndView mav = new ModelAndView("user/updateForm");
      mav.addObject("userProfile",userProfile);
      
      if(userProfile.getUser().getM_password().equals("") || userProfile.getUser().getM_password() == null){
         return mav;
      }
      
      try{
         userService.updateUserProfile(userProfile,request);
      }catch(DuplicateKeyException e){
         e.printStackTrace();
         bindingResult.reject("error.duplicate.user");
         return mav;
      }
      mav.setViewName("redirect:admin.do");
      return mav;
   }
   
   @RequestMapping("user/idealtype") //현재 내가 설정한 이상형 보여주기
   public ModelAndView idealtype(HttpSession session){
      ModelAndView mav = new ModelAndView("user/idealtype");
      User loginUser = (User)session.getAttribute("USER");
      int loginUserNumber = loginUser.getM_number();//로그인 번호 빼오기
      IdealType idealType = idealtypeService.getIdealType(loginUserNumber);//로그인 유저가 설정한 이상형 테이블을 검색
      mav.addObject("idealType",idealType);
      return mav; 
   }
   
   @RequestMapping("user/idealtype2") //내 이상형 편집
   public ModelAndView idealtype2(HttpSession session){
      ModelAndView mav = new ModelAndView("user/idealtype2");
      User loginUser = (User)session.getAttribute("USER");
      int loginUserNumber = loginUser.getM_number();
      IdealType idealType = idealtypeService.getIdealType(loginUserNumber);
      mav.addObject("idealType",idealType);
      return mav; 
   }
   
   @RequestMapping("user/idealtype_update") //편집한 이상형 업데이트 & 일치하는 이상형을 리스트로 출력
   public ModelAndView idealtype_update(HttpSession session, UserProfile userProfile, IdealType idealType, BindingResult bindingResult){
      ModelAndView mav = new ModelAndView("user/idealtype_update");
      User loginUser = (User)session.getAttribute("USER");
      List<UserProfile> idealList = idealtypeService.getIdealList(idealType.getI_height());
      int loginUserNumber = loginUser.getM_number();
      idealtypeService.idealUpdate(loginUserNumber, idealType);
      mav.addObject("idealList",idealList);
      mav.setViewName("user/userList");
      return mav;
   }
}