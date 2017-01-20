package dao;

import java.util.List;

import logic.LikeUser;

public interface LikeUserDao {

   List<Integer> othersNumWhenA(int m_number);
   List<Integer> othersNumWhenB(int m_number);
   List<Integer> othersNumWhenC(int m_number);
   List<LikeUser> getAll(Integer loginUserNumber);
  
}