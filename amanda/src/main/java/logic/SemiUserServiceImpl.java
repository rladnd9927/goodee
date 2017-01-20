package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SemiUserDao;

@Service
public class SemiUserServiceImpl implements SemiUserService{

   @Autowired
   private SemiUserDao semiuserDao;
   
   public List<SemiUser> getSemiUser(int loginUserNumber) {
      return semiuserDao.getSemiUser(loginUserNumber);
   }

   public UserProfile getsemiUserProfile(int m_number) {
      UserProfile semiuserProfile = semiuserDao.getsemiUserProfile(m_number);
      return semiuserProfile;
   }

   @Override
   public SemiUser getSemiUserByNumScore(int m_number, int s_score) {
      return semiuserDao.getSemiUserbyNumScore(m_number, s_score);
   }

   @Override
   public void pointCountUp(SemiUser semiuser) {
      semiuserDao.pointCountUp(semiuser);
   }

   @Override
   public void semiDelete(SemiUser semiuser) {
      semiuserDao.semiDelete(semiuser);
   }

   @Override
   public SemiUser getOkMember(SemiUser semiuser) {
      return semiuserDao.getOkMember(semiuser);
   }

   @Override
   public void memberInsert(SemiUser selectOkMember) {
      semiuserDao.memberInsert(selectOkMember);
   }

   @Override
   public void idealTypeInsert(SemiUser selectOkMember) {
      semiuserDao.idealTypeInsert(selectOkMember);
   }

   @Override
   public Simsa getSimsaMember(int m_number) {
      return semiuserDao.getSimsaMember(m_number);
   }

   @Override
   public void UpdateSimsa(int m_number, int loginUserNumber) {
      semiuserDao.UpdateSimsa(m_number, loginUserNumber);
   }
}