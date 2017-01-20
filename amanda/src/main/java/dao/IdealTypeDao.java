package dao;

import java.util.List;

import logic.IdealType;
import logic.UserProfile;

public interface IdealTypeDao {
   IdealType getIdealType(int loginUserNumber);
   void idealUpdate(int loginUserNumber, IdealType idealtype);
   //List<UserProfile> getIdealList(IdealType idealtype);
   List<UserProfile> getIdealList(int i_height);
   void InsertZero(int loginUserNumber);
}