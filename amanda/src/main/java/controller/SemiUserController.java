package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.SimsaException;
import logic.SemiUser;
import logic.SemiUserService;
import logic.Simsa;
import logic.User;
import logic.UserProfile;

@Controller
public class SemiUserController {
   @Autowired
   private SemiUserService semiuserService;
   
    @RequestMapping("user/evaluate")
      public ModelAndView evaluate(HttpSession session, SemiUser semiuser){
         ModelAndView mav = new ModelAndView();
         User loginUser = (User)session.getAttribute("USER");
         int loginUserNumber = loginUser.getM_number();
         List<SemiUser> semiuserList = semiuserService.getSemiUser(loginUserNumber);
         mav.addObject("semiuserList",semiuserList);
         mav.addObject(semiuserList);
         return mav;
    } 
            
    @RequestMapping("user/semiDetail")
    public ModelAndView semiDetail(int m_number, SemiUser semiuser, HttpSession session){
         ModelAndView mav = new ModelAndView();
         User loginUser = (User)session.getAttribute("USER");
         int loginUserNumber = loginUser.getM_number();
         Simsa simsaMember = semiuserService.getSimsaMember(m_number);
         if(simsaMember.getSimsa_number() == loginUserNumber){
            throw new SimsaException();
         }
         UserProfile semiuserProfile = semiuserService.getsemiUserProfile(m_number);
         SemiUser semiUser = semiuserService.getSemiUserByNumScore(semiuser.getM_number(), semiuser.getS_score());
         mav.addObject("semiuserProfile",semiuserProfile);
         mav.addObject("semiUser", semiUser);
         mav.addObject(semiUser);
         return mav;
    }
    
     @RequestMapping("user/semi1")
      public ModelAndView semi1(SemiUser semiuser, HttpSession session){
         ModelAndView mav = new ModelAndView();
         User loginUser = (User)session.getAttribute("USER");
         int loginUserNumber = loginUser.getM_number();//현재 로그인 한 회원의 번호를 넘겨줌
         semiuserService.pointCountUp(semiuser); // 심사 평가후 심사한 유저수와 점수누적
         semiuserService.semiDelete(semiuser); // 유저카운트가 5 이상이면서 평점이 3점 미만인 회원 탈퇴
         semiuserService.UpdateSimsa(semiuser.getM_number(), loginUserNumber);
         SemiUser selectOkMember = semiuserService.getOkMember(semiuser);
         if(selectOkMember != null){
            semiuserService.memberInsert(selectOkMember);
            semiuserService.idealTypeInsert(selectOkMember);
         }
         mav.addObject("selectOkMember", selectOkMember);
         mav.setViewName("redirect:evaluate.do");
         return mav;
   }
}