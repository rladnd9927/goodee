package dao.mapper;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Member;
import logic.User;
import logic.UserProfile;
//Member
public interface UserMapper {

   @Select("select * from member where m_number = #{m_number}")
   User getUserbyNum(int m_number);
   
   @Insert("insert into semi_member (m_number, s_email, s_password, s_name, s_score, gender, s_usercount) "
         + " values(#{semiuser.m_number}, #{semiuser.s_email}, #{semiuser.s_password}, #{semiuser.s_name}, 0, #{semiuser.gender}, 0)")
   void createsemi(UserProfile userprofile);
   
   @Select("select * from member_profile where m_number = #{m_number}")
   UserProfile getUserProfile(int m_number);
   
   /* @Insert("insert into member_profile (m_number, m_picture1, m_picture2, m_picture3, "*/

   @Insert("insert into member_profile (m_number, m_picture1, m_picture2, m_picture3, "
         + " m_nickname, gender, m_school ,m_major ,m_job, m_area, m_birthday, m_height, m_bloodtype, "
         + " m_religion, m_smoking, m_drinking, m_bodytype, m_character, m_score) "
         + " values(#{semiuser.m_number}, #{m_pictureUrl1}, #{m_pictureUrl2}, #{m_pictureUrl3}, "
         + " #{m_nickname}, #{semiuser.gender}, #{m_school}, #{m_major}, #{m_job}, #{m_area}, #{m_birthday}, "
         + " #{m_height}, #{m_bloodtype}, #{m_religion}, #{m_smoking}, #{m_drinking}, #{m_bodytype}, "
         + " #{m_character}, 0)")
   void createprofile(UserProfile userprofile);

   @Select("select nvl(max(m_number),0) from semi_member")
   int getNum();
   @Delete("delete from member where m_number=#{m_number}")
   void delete(int m_number);

   @Select("select * from i_like_member where m_number = #{m_number}")
   Member like(int m_number);

   @Select("select * from member_profile where m_score >= 3 order by m_score desc")
   UserProfile userScore(int m_num);

   @Select("select * from member_profile")
   UserProfile getUserPro();

   @Select("select * from member where m_number = #{m_number}")
   User getUpdateUser(int m_number);

   String col = "m_number, m_picture1 m_pictureUrl1, m_picture2 m_pictureUrl2, m_picture3 m_pictureUrl3, "
         + " m_nickname, gender, m_school ,m_major ,m_job, m_area, m_birthday, m_height, m_bloodtype, "
         + " m_religion, m_smoking, m_drinking, m_bodytype, m_character, m_score";

   @Select("select " + col + " from member_profile where m_number = #{m_number}")
   UserProfile getUpdateUserProfile(int m_number);

   @Update("update member set "
            + "m_password=#{user.m_password} "
            + "where m_number=#{user.m_number}")
   void updateUser(UserProfile userProfile);
   
   @Update("update member_profile set "
            + "m_picture1=#{m_pictureUrl1}, m_picture2=#{m_pictureUrl2}, "
            + "m_picture3=#{m_pictureUrl3}, m_nickname=#{m_nickname}, "
            + "m_school=#{m_school}, m_major=#{m_major}, "
            + "m_job=#{m_job}, m_area=#{m_area}, "
            + "m_birthday=#{m_birthday}, m_height=#{m_height}, "
            + "m_bloodtype=#{m_bloodtype}, m_religion=#{m_religion}, "
            + "m_smoking=#{m_smoking}, m_drinking=#{m_drinking}, "
            + "m_bodytype=#{m_bodytype} "
            + "where m_number=#{user.m_number}") 
   void updateProfile(UserProfile userProfile);
   
   @Insert("insert into duplication (m_number, simsa_number) values (#{m_number}, 0)")
   void insertDuple(int m_number);
}