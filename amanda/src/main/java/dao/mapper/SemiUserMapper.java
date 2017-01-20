package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.SemiUser;
import logic.Simsa;
import logic.UserProfile;

public interface SemiUserMapper {

   @Select("select * from semi_member where m_number!=#{loginUserNumber}")
   List<SemiUser> getSemiUser(int loginUserNumber);
   
   @Select("select * from member_profile where m_number = #{m_number}")
   UserProfile getsemiUserProfile(int m_number);

   @Select("select * from semi_member where m_number=#{m_number}")
   SemiUser getSemiUserByNumScore(Map<Object, Object> map);
   
   @Update("update semi_member set s_score=s_score+#{s_score}, s_usercount=s_usercount+1 where m_number=#{m_number}")
   void pointCountUp(SemiUser semiuser);

   @Delete("delete from semi_member where (select s_score/s_usercount from semi_member where s_usercount >= 5 and m_number=#{m_number}) < 3 and m_number=#{m_number}")
   void semiDelete(SemiUser semiuser);

   @Select("select * from semi_member where m_number=#{m_number} and s_usercount>=5 and s_score/s_usercount>=3")
   SemiUser getOkMember(SemiUser semiuser);

   @Insert("insert into member (m_number, m_email, m_password, m_name, gender, m_score, m_usercount) values (#{m_number}, #{s_email}, #{s_password}, #{s_name}, #{gender}, #{s_score}, #{s_usercount})")
   void memberInsert(SemiUser selectOkMember);

   @Insert("insert into idealtype_profile (m_number, i_height, i_bodytype, i_character, i_religion, i_smoking, i_drinking) values (#{m_number}, 0, 0, 0, 0, 0, 0)")
   void idealTypeInsert(SemiUser selectOkMember);

   @Select("select simsa_number from duplication where m_number=#{m_number}")
   Simsa getSimsaMember(int m_number);

   @Update("update duplication set simsa_number=#{loginUserNumber} where m_number=#{m_number}")
   void UpdateSimsa(Map<Object, Object> map);

   @Select("select * from member_profile where m_number = #{m_number}")
   UserProfile getUserProfile(int m_number);
}