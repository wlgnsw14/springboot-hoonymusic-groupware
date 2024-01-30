package kr.co.gudi.member.dto;


import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	
	private int member_no;
	private String member_car_no;
	private String member_id;
	private String pw;
	private String file_oriname;
	private String file_newname;
	private String name;
	private String gender;
	private Date birth;
	private String phone;
	private String address;
	private String address_detail;
	private String email;
	private Date hired;
	private int total_leave;
	private int total_point;
	private String member_state;
	private Date resign_date;
	private String member_position;
	private String depart_name;
	private String depart_state;
	private int depart_no;
	private String depart_master;
	private Date depart_date;
	private Date depart_del_date;
	private int depart_p_no;
	private int total_member;
	
	
	
	public int getTotal_member() {
		return total_member;
	}
	public void setTotal_member(int total_member) {
		this.total_member = total_member;
	}
	public Date getDepart_date() {
		return depart_date;
	}
	public void setDepart_date(Date depart_date) {
		this.depart_date = depart_date;
	}
	public Date getDepart_del_date() {
		return depart_del_date;
	}
	public void setDepart_del_date(Date depart_del_date) {
		this.depart_del_date = depart_del_date;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getFile_newname() {
		return file_newname;
	}
	public void setFile_newname(String file_newname) {
		this.file_newname = file_newname;
	}
	public String getDepart_state() {
		return depart_state;
	}
	public int getDepart_p_no() {
		return depart_p_no;
	}
	public void setDepart_p_no(int depart_p_no) {
		this.depart_p_no = depart_p_no;
	}
	public void setDepart_state(String depart_state) {
		this.depart_state = depart_state;
	}
	public int getDepart_no() {
		return depart_no;
	}
	public void setDepart_no(int depart_no) {
		this.depart_no = depart_no;
	}
	public String getDepart_master() {
		return depart_master;
	}
	public void setDepart_master(String depart_master) {
		this.depart_master = depart_master;
	}
	
	public String getDepart_name() {
		return depart_name;
	}
	public String getFile_oriname() {
		return file_oriname;
	}
	public void setFile_oriname(String file_oriname) {
		this.file_oriname = file_oriname;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMember_position() {
		return member_position;
	}
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
	public Date getHired() {
		return hired;
	}
	public void setHired(Date hired) {
		this.hired = hired;
	}
	public int getTotal_leave() {
		return total_leave;
	}
	public void setTotal_leave(int total_leave) {
		this.total_leave = total_leave;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public String getMember_state() {
		return member_state;
	}
	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}
	public Date getResign_date() {
		return resign_date;
	}
	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}
	public String getMember_car_no() {
		return member_car_no;
	}
	public void setMember_car_no(String member_car_no) {
		this.member_car_no = member_car_no;
	}
}
	
	
