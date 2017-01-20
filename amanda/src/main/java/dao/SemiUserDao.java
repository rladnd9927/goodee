package dao;

import java.util.List;

import logic.SemiUser;
import logic.Simsa;
import logic.UserProfile;

public interface SemiUserDao {
   List<SemiUser> getSemiUser(int loginUserNumber); //
   UserProfile getsemiUserProfile(int m_number); //
   SemiUser getSemiUserbyNumScore(int m_number, int s_score); //
   void pointCountUp(SemiUser semiuser); //
   void semiDelete(SemiUser semiuser); //
   SemiUser getOkMember(SemiUser semiuser);//
   void memberInsert(SemiUser selectOkMember);//
   void idealTypeInsert(SemiUser selectOkMember);//
   Simsa getSimsaMember(int m_number); //
   void UpdateSimsa(int m_number, int loginUserNumber);//
   UserProfile getUserProfile(int m_number);
}