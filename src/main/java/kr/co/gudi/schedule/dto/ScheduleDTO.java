package kr.co.gudi.schedule.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("sch")
public class ScheduleDTO {
   private int sch_no;
   private int member_no;
   private String sch_depart;
   private String title;
   private String content;
   private Timestamp start;
   private Timestamp end;
   private String sch_state;
   public int getSch_no() {
      return sch_no;
   }
   public void setSch_no(int sch_no) {
      this.sch_no = sch_no;
   }
   public int getMember_no() {
      return member_no;
   }
   public void setMember_no(int member_no) {
      this.member_no = member_no;
   }
   public String getSch_depart() {
      return sch_depart;
   }
   public void setSch_depart(String sch_depart) {
      this.sch_depart = sch_depart;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Timestamp getStart() {
      return start;
   }
   public void setStart(Timestamp start) {
      this.start = start;
   }
   public Timestamp getEnd() {
      return end;
   }
   public void setEnd(Timestamp end) {
      this.end = end;
   }
   public String getSch_state() {
      return sch_state;
   }
   public void setSch_state(String sch_state) {
      this.sch_state = sch_state;
   }
   
   
   
}