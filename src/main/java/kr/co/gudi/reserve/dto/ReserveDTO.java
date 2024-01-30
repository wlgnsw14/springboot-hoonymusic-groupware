package kr.co.gudi.reserve.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("reserv")
public class ReserveDTO {
	
	int res_no;
	int member_no;
	String res_name;
	Date res_start;
	Date res_end;
	Date res_get;
	String res_content;
	String res_member;
	String res_state;
	String res_memberno;
	
	
	
	public String getRes_memberno() {
		return res_memberno;
	}
	public void setRes_memberno(String res_memberno) {
		this.res_memberno = res_memberno;
	}
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public Date getRes_start() {
		return res_start;
	}
	public void setRes_start(Date res_start) {
		this.res_start = res_start;
	}
	public Date getRes_end() {
		return res_end;
	}
	public void setRes_end(Date res_end) {
		this.res_end = res_end;
	}
	public Date getRes_get() {
		return res_get;
	}
	public void setRes_get(Date res_get) {
		this.res_get = res_get;
	}
	public String getRes_content() {
		return res_content;
	}
	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}
	public String getRes_member() {
		return res_member;
	}
	public void setRes_member(String res_member) {
		this.res_member = res_member;
	}
	
	
	

}
