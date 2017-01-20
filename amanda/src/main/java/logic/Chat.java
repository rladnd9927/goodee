package logic;

public class Chat {
   private int C_number;
   private String C_subject;
   public int getC_number() {
      return C_number;
   }
   public void setC_number(int c_number) {
      C_number = c_number;
   }
   public String getC_subject() {
      return C_subject;
   }
   public void setC_subject(String c_subject) {
      C_subject = c_subject;
   }
   
   @Override
   public String toString() {
      return "Chat [C_number=" + C_number + ", C_subject=" + C_subject + "]";
   }
   

}