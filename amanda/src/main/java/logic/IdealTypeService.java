package logic;

import java.util.List;

public interface IdealTypeService {
   IdealType getIdealType(int loginUserNumber);
   void idealUpdate(int loginUserNumber, IdealType idealtype);
   //List<UserProfile> getIdealList(IdealType idealtype);
   List<UserProfile> getIdealList(int i_height);
   void InsertZero(int loginUserNumber);
}