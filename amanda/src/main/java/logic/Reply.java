package logic;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

@JsonAutoDetect(fieldVisibility=Visibility.NONE, 
getterVisibility = Visibility.NONE, 
setterVisibility = Visibility.NONE)

@JsonPropertyOrder({"m_number","sns_no", "m_nickname", "r_num", "r_reflevel", 
    "r_content"})

public class Reply {
   
   @JsonProperty("m_number")
   private int m_number;
   
   @JsonProperty("m_nickname")
   private String m_nickname;
   
   @JsonProperty("r_num")
   private int r_num;
   
   @JsonProperty("r_content")
   private String r_content;
   
   @JsonProperty("sns_no")
   private int sns_no;
   
   public int getM_number() {
      return m_number;
   }
   public void setM_number(int m_number) {
      this.m_number = m_number;
   }
   public String getM_nickname() {
      return m_nickname;
   }
   public void setM_nickname(String m_nickname) {
      this.m_nickname = m_nickname;
   }
   public int getR_num() {
      return r_num;
   }
   public void setR_num(int r_num) {
      this.r_num = r_num;
   }
   public String getR_content() {
      return r_content;
   }
   public void setR_content(String r_content) {
      this.r_content = r_content;
   }
   public int getSns_no() {
      return sns_no;
   }
   public void setSns_no(int sns_no) {
      this.sns_no = sns_no;
   }
   @Override
   public String toString() {
      return "Reply [m_number=" + m_number + ", m_nickname=" + m_nickname + ", r_num=" + r_num + ", r_content=" + r_content + ", sns_no=" + sns_no + "]";
   }
   
   
}