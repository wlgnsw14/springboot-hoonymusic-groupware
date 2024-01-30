package kr.co.gudi.notification.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("noti")
public class NotiDTO {
	private int noti_no;
	private int noti_sender;
	private int noti_receiver;
	
	private Date noti_date;
	private String noti_content;
	private String noti_locate;
	private String noti_state;
	private String noti_depart_no;
	
	
	
	public String getNoti_depart_no() {
		return noti_depart_no;
	}
	public void setNoti_depart_no(String noti_depart_no) {
		this.noti_depart_no = noti_depart_no;
	}
	private int noti_count;
	
	public int getNoti_count() {
		return noti_count;
	}
	public void setNoti_count(int noti_count) {
		this.noti_count = noti_count;
	}
	private String name;
	private String member_position;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_position() {
		return member_position;
	}
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public int getNoti_sender() {
		return noti_sender;
	}
	public void setNoti_sender(int noti_sender) {
		this.noti_sender = noti_sender;
	}
	public int getNoti_receiver() {
		return noti_receiver;
	}
	public void setNoti_receiver(int noti_receiver) {
		this.noti_receiver = noti_receiver;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public String getNoti_locate() {
		return noti_locate;
	}
	public void setNoti_locate(String noti_locate) {
		this.noti_locate = noti_locate;
	}
	public String getNoti_state() {
		return noti_state;
	}
	public void setNoti_state(String noti_state) {
		this.noti_state = noti_state;
	}
	
	
}
