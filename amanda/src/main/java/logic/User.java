package logic;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

//member
public class User {
    private int m_number;
   
   @Size(min=3,message="아이디는 3자 이상으로 입력하세요.")
    private String m_email;
    
   @Size(min=3, max=18, message="비밀번호는 3자 이상 12자 이하로 입력하세요.")
    private String m_password;
    
    private String m_name;
    private int gender;
    private int s_score;    
    
   public int getM_number() {
      return m_number;
   }
   public void setM_number(int m_number) {
      this.m_number = m_number;
   }
   public String getM_email() {
      return m_email;
   }
   public void setM_email(String m_email) {
      this.m_email = m_email;
   }
   public String getM_password() {
      return m_password;
   }
   public void setM_password(String m_password) {
      this.m_password = m_password;
   }
   public String getM_name() {
      return m_name;
   }
   public void setM_name(String m_name) {
      this.m_name = m_name;
   }
   public int getGender() {
      return gender;
   }
   public void setGender(int gender) {
      this.gender = gender;
   }

   
   public int getS_score() {
      return s_score;
   }
   public void setS_score(int s_score) {
      this.s_score = s_score;
   }
   @Override
   public String toString() {
      return "User [m_number=" + m_number + ", m_email=" + m_email + ", m_password=" + m_password + ", m_name="
            + m_name + ", gender=" + gender + ", s_score=" + s_score + "]";
   }

}