package logic;

public class Member {
   private String m_number;
   private String y_number;
   private String m_like;
   private int c_number;
   
   public String getM_number() {
      return m_number;
   }
   public void setM_number(String m_number) {
      this.m_number = m_number;
   }
   public String getY_number() {
      return y_number;
   }
   public void setY_number(String y_number) {
      this.y_number = y_number;
   }
   public String getM_like() {
      return m_like;
   }
   public void setM_like(String m_like) {
      this.m_like = m_like;
   }
   public int getC_number() {
      return c_number;
   }
   public void setC_number(int c_number) {
      this.c_number = c_number;
   }
   
   
   @Override
   public String toString() {
      return "Member [m_number=" + m_number + ", y_number=" + y_number + ", m_like=" + m_like + ", c_number="
            + c_number + "]";
   }

   

}