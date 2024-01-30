package kr.co.gudi.member.dto;

import java.io.Serializable;
import java.util.List;


public class Department implements Serializable{
	private static final long serialVersionUID = 5394728630150921069L;
	private int depart_no;
	private String depart_name;
	private int depart_p_no;
	private int depart_member;
	private String depart_state;
	
	
	public int getDepart_no() {
		return depart_no;
	}
	public void setDepart_no(int depart_no) {
		this.depart_no = depart_no;
	}
	public String getDepart_name() {
		return depart_name;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public int getDepart_parrent() {
		return depart_p_no;
	}
	public void setDepart_parrent(int depart_p_no) {
		this.depart_p_no = depart_p_no;
	}
	public int getDepart_member() {
		return depart_member;
	}
	public void setDepart_member(int depart_member) {
		this.depart_member = depart_member;
	}
	public String getDepart_state() {
		return depart_state;
	}
	public void setDepart_state(String depart_state) {
		this.depart_state = depart_state;
	}
}
