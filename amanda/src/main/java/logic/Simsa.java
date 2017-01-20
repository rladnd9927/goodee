package logic;

public class Simsa {
   private int m_number;
   private int simsa_number;
   
   public int getM_number() {
      return m_number;
   }
   public void setM_number(int m_number) {
      this.m_number = m_number;
   }
   public int getSimsa_number() {
      return simsa_number;
   }
   public void setSimsa_number(int simsa_number) {
      this.simsa_number = simsa_number;
   }
   @Override
   public String toString() {
      return "Simsa [m_number=" + m_number + ", simsa_number=" + simsa_number + "]";
   }
}