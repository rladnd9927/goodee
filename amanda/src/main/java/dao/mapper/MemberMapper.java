package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Member;

public interface MemberMapper {

   @Select("select m.y_number as y_number,m.m_number as m_number , m.c_number as c_number , c.c_subject as c_subject"
       + " from chat c , i_like_member m "
      + " where c.C_NUMBER = m.C_NUMBER and c.C_NUMBER = #{num}")  
   public List<Member> detail(int num); 

}