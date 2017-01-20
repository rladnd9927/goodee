package logic;

import java.text.SimpleDateFormat;

import java.util.Date;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonAutoDetect(fieldVisibility=Visibility.NONE, 
getterVisibility = Visibility.NONE, 
setterVisibility = Visibility.NONE)

@JsonPropertyOrder({"m_number","sns_no", "sns_subject", "sns_content", "sns_date", 
    "fileUrl"})

public class Sns {
	@NotEmpty(message = "글 내용을 입력해 주세요")
	@JsonProperty("sns_content")
	private String sns_content; //글 내용
	
	@NotEmpty(message = "글 제목을 입력해 주세요")
	@JsonProperty("sns_subject")
	private String sns_subject;//글 제목
	
	@JsonProperty("sns_date") @JsonSerialize(using = ToStringSerializer.class)
	private Date sns_date; //등록일
	
	@JsonProperty("sns_no")
	private int sns_no; //글번호
	
	@JsonProperty("fileUrl")
	private String fileUrl;
	
	@JsonProperty("m_number")
	private int m_number; //유저번호
	private MultipartFile sns_picture; //파일
	
	private UserProfile userProfile;
	
	
	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public String getDatetoString(){
		SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd");
		return sf.format(sns_date);
	}
	
	public MultipartFile getSns_picture() {
		return sns_picture;
	}
	public void setSns_picture(MultipartFile sns_picture) {
		this.sns_picture = sns_picture;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public Date getSns_date() {
		return sns_date;
	}
	public void setSns_date(Date sns_date) {
		this.sns_date = sns_date;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public String getSns_subject() {
		return sns_subject;
	}
	public void setSns_subject(String sns_subject) {
		this.sns_subject = sns_subject;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}

	@Override
	public String toString() {
		return "Sns [sns_content=" + sns_content + ", sns_subject=" + sns_subject + ", sns_date=" + sns_date
				+ ", sns_no=" + sns_no + ", fileUrl=" + fileUrl + ", m_number=" + m_number + ", sns_picture="
				+ sns_picture + "]";
	}
	
}
