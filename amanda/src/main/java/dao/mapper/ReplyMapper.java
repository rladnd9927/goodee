package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Reply;

public interface ReplyMapper {


	@Select("select nvl(max(r_num),0) from reply where sns_no = #{sns_no}")
	int getMaxRnum(int sns_no);

	@Insert("insert into reply(M_NUMBER, M_NICKNAME, R_NUM, R_CONTENT, SNS_NO) values(#{m_number}, #{m_nickname}, #{r_num}, #{r_content}, #{sns_no})")
	void register(Reply reply);
	
}
