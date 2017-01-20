package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.IdealType;
import logic.UserProfile;

public interface IdealTypeMapper {

   @Select("select * from idealtype_profile where m_number=#{loginUserNumber}")
   IdealType getIdealType(int loginUserNumber);

   
   @Update("update idealtype_profile set i_height=#{idealtype.i_height}, "
         + "i_bodytype=#{idealtype.i_bodytype}, i_character=#{idealtype.i_character}, i_religion=#{idealtype.i_religion}, "
         + "i_smoking=#{idealtype.i_smoking}, i_drinking=#{idealtype.i_drinking} where m_number=#{loginUserNumber}")
   void idealUpdate(Map<Object, Object> map);


   //List<UserProfile> getIdealList(IdealType idealtype);


   @Select("select * from member_profile where m_height=#{i_height}")
   List<UserProfile> getIdealList(int i_height);


   @Insert("insert into idealtype_profile (m_number, i_height, i_bodytype, i_character, i_religion, i_smoking, i_drinking) values (#{loginUserNumber}, 0, 0, 0, 0, 0, 0)")
   void InsertZero(int loginUserNumber);

}