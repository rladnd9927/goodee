package logic;

public class IdealType {
   private int m_number;
   private int i_height;
   private String i_bodytype;
   private String i_character;
   private String i_religion;
   private String i_smoking;
   private String i_drinking;
   
   public int getM_number() {
      return m_number;
   }
   public void setM_number(int m_number) {
      this.m_number = m_number;
   }
   public int getI_height() {
      return i_height;
   }
   public void setI_height(int i_height) {
      this.i_height = i_height;
   }
   public String getI_bodytype() {
      return i_bodytype;
   }
   public void setI_bodytype(String i_bodytype) {
      this.i_bodytype = i_bodytype;
   }
   public String getI_character() {
      return i_character;
   }
   public void setI_character(String i_character) {
      this.i_character = i_character;
   }
   public String getI_religion() {
      return i_religion;
   }
   public void setI_religion(String i_religion) {
      this.i_religion = i_religion;
   }
   public String getI_smoking() {
      return i_smoking;
   }
   public void setI_smoking(String i_smoking) {
      this.i_smoking = i_smoking;
   }
   public String getI_drinking() {
      return i_drinking;
   }
   public void setI_drinking(String i_drinking) {
      this.i_drinking = i_drinking;
   }
   @Override
   public String toString() {
      return "IdealType [m_number=" + m_number + ", i_height=" + i_height + ", i_bodytype=" + i_bodytype
            + ", i_character=" + i_character + ", i_religion=" + i_religion + ", i_smoking=" + i_smoking
            + ", i_drinking=" + i_drinking + "]";
   }
}