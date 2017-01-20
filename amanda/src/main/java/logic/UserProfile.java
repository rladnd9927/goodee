package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserProfile {
   private int m_number;
   private MultipartFile m_picture1;
   private MultipartFile m_picture2;
   private MultipartFile m_picture3;
   private String m_pictureUrl1;
   private String m_pictureUrl2;
   private String m_pictureUrl3;
   private String gender;
   private String m_nickname;
   private String m_school;
   private String m_major;
   private String m_job;
   private String m_area;
   private Date m_birthday;
   private int m_height;
   private String m_bloodtype;
   private String m_religion;
   private String m_smoking;
   private String m_drinking;
   private String m_bodytype;
   private String m_character;
   private int m_score;
   private SemiUser semiuser;
   private User user;
   public int getM_number() {
      return m_number;
   }
   public void setM_number(int m_number) {
      this.m_number = m_number;
   }
   public MultipartFile getM_picture1() {
      return m_picture1;
   }
   public void setM_picture1(MultipartFile m_picture1) {
      this.m_picture1 = m_picture1;
   }
   public MultipartFile getM_picture2() {
      return m_picture2;
   }
   public void setM_picture2(MultipartFile m_picture2) {
      this.m_picture2 = m_picture2;
   }
   public MultipartFile getM_picture3() {
      return m_picture3;
   }
   public void setM_picture3(MultipartFile m_picture3) {
      this.m_picture3 = m_picture3;
   }
   public String getM_pictureUrl1() {
      return m_pictureUrl1;
   }
   public void setM_pictureUrl1(String m_pictureUrl1) {
      this.m_pictureUrl1 = m_pictureUrl1;
   }
   public String getM_pictureUrl2() {
      return m_pictureUrl2;
   }
   public void setM_pictureUrl2(String m_pictureUrl2) {
      this.m_pictureUrl2 = m_pictureUrl2;
   }
   public String getM_pictureUrl3() {
      return m_pictureUrl3;
   }
   public void setM_pictureUrl3(String m_pictureUrl3) {
      this.m_pictureUrl3 = m_pictureUrl3;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getM_nickname() {
      return m_nickname;
   }
   public void setM_nickname(String m_nickname) {
      this.m_nickname = m_nickname;
   }
   public String getM_school() {
      return m_school;
   }
   public void setM_school(String m_school) {
      this.m_school = m_school;
   }
   public String getM_major() {
      return m_major;
   }
   public void setM_major(String m_major) {
      this.m_major = m_major;
   }
   public String getM_job() {
      return m_job;
   }
   public void setM_job(String m_job) {
      this.m_job = m_job;
   }
   public String getM_area() {
      return m_area;
   }
   public void setM_area(String m_area) {
      this.m_area = m_area;
   }
   public Date getM_birthday() {
      return m_birthday;
   }
   public void setM_birthday(Date m_birthday) {
      this.m_birthday = m_birthday;
   }
   public int getM_height() {
      return m_height;
   }
   public void setM_height(int m_height) {
      this.m_height = m_height;
   }
   public String getM_bloodtype() {
      return m_bloodtype;
   }
   public void setM_bloodtype(String m_bloodtype) {
      this.m_bloodtype = m_bloodtype;
   }
   public String getM_religion() {
      return m_religion;
   }
   public void setM_religion(String m_religion) {
      this.m_religion = m_religion;
   }
   public String getM_smoking() {
      return m_smoking;
   }
   public void setM_smoking(String m_smoking) {
      this.m_smoking = m_smoking;
   }
   public String getM_drinking() {
      return m_drinking;
   }
   public void setM_drinking(String m_drinking) {
      this.m_drinking = m_drinking;
   }
   public String getM_bodytype() {
      return m_bodytype;
   }
   public void setM_bodytype(String m_bodytype) {
      this.m_bodytype = m_bodytype;
   }
   public String getM_character() {
      return m_character;
   }
   public void setM_character(String m_character) {
      this.m_character = m_character;
   }
   public int getM_score() {
      return m_score;
   }
   public void setM_score(int m_score) {
      this.m_score = m_score;
   }
   public SemiUser getSemiuser() {
      return semiuser;
   }
   public void setSemiuser(SemiUser semiuser) {
      this.semiuser = semiuser;
   }
   public User getUser() {
      return user;
   }
   public void setUser(User user) {
      this.user = user;
   }
}