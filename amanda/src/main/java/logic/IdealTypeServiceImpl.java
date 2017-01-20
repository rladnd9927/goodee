package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IdealTypeDao;

@Service
public class IdealTypeServiceImpl implements IdealTypeService{
   
   @Autowired
   private IdealTypeDao idealtypeDao;

   @Override
   public IdealType getIdealType(int loginUserNumber) {
      IdealType idealtype = idealtypeDao.getIdealType(loginUserNumber);
      return idealtype;
   }

   @Override
   public void idealUpdate(int loginUserNumber, IdealType idealtype) {
      idealtypeDao.idealUpdate(loginUserNumber,idealtype);
   }
   /*
   @Override
   public List<UserProfile> getIdealList(IdealType idealtype) {
      return idealtypeDao.getIdealList(idealtype);
   }
   */

   @Override
   public List<UserProfile> getIdealList(int i_height) {
      return idealtypeDao.getIdealList(i_height);
   }
   @Override
      public void InsertZero(int loginUserNumber) {
         idealtypeDao.InsertZero(loginUserNumber);
      }
}