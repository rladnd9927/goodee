package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Sns;

public interface SnsMapper {
	@Insert("insert into SNS(M_NUMBER, SNS_NO, SNS_PICTURE, SNS_SUBJECT, SNS_CONTENT, SNS_DATE) values(#{m_number}, #{sns_no},  #{fileUrl}, #{sns_subject}, #{sns_content}, sysdate)")
	void insert(Sns sns);

	@Update("update sns set sns_subject = #{sns_subject}, sns_content = #{sns_content}, sns_picture = #{fileUrl} where sns_no = #{sns_no} and m_number = #{m_number}")
	void update(Sns sns);

	@Select("select nvl(max(sns_no),0) from sns where m_number = #{m_number}")
	int getMax(int m_number);

}
