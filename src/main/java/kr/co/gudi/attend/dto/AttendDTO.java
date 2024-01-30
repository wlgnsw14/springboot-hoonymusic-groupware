package kr.co.gudi.attend.dto;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("attend")
public class AttendDTO {
	
	private int attend_no;
	private int member_no;
	private Date att_date;
	private Time att_intime;
	private Time att_outtime;
	private Time work_hours;
	private String off_check;
	private String off_type;
	private Timestamp off_start;
	private Timestamp off_end;
	private double use_date;
	public void setUse_date(double use_date) {
		this.use_date = use_date;
	}

	public double getUse_date() {
		return use_date;
	}

	public int getAttend_no() {
		return attend_no;
	}
	public void setAttend_no(int attend_no) {
		this.attend_no = attend_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	public Time getAtt_intime() {
		return att_intime;
	}
	public void setAtt_intime(Time att_intime) {
		this.att_intime = att_intime;
	}
	public Time getAtt_outtime() {
		return att_outtime;
	}
	public void setAtt_outtime(Time att_outtime) {
		this.att_outtime = att_outtime;
	}
	public Time getWork_hours() {
		return work_hours;
	}
	public void setWork_hours(Time work_hours) {
		this.work_hours = work_hours;
	}
	public String getOff_check() {
		return off_check;
	}
	public void setOff_check(String off_check) {
		this.off_check = off_check;
	}
	public String getOff_type() {
		return off_type;
	}
	public void setOff_type(String off_type) {
		this.off_type = off_type;
	}
	public Timestamp getOff_start() {
		return off_start;
	}
	public void setOff_start(Timestamp off_start) {
		this.off_start = off_start;
	}
	public Timestamp getOff_end() {
		return off_end;
	}
	public void setOff_end(Timestamp off_end) {
		this.off_end = off_end;
	}

}
