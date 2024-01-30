package kr.co.gudi.resource.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("cr")
public class CopyrightDTO {

	
	String cr_no ;
	int perSong_no;
	int member_no;
	String cr_name;
	int cr_price;
	Date cr_regdate;
	Date cr_expdate;
	Date cr_contdate; 
	String cr_state;
	
	int perhis_no;
	int per_price;
	Date per_date;
	String per_member;
	String cr_member;
	String cr_namae;
	String per_state;
	
	int depart_no;
	String name;
	String member_position;

	String approval_title;
	String approval_content;
	int approval_no;
	
	String appcr_member;
	Date appcr_regdate;
	
	
	
	public String getAppcr_member() {
		return appcr_member;
	}
	public void setAppcr_member(String appcr_member) {
		this.appcr_member = appcr_member;
	}
	public Date getAppcr_regdate() {
		return appcr_regdate;
	}
	public void setAppcr_regdate(Date appcr_regdate) {
		this.appcr_regdate = appcr_regdate;
	}
	public int getApproval_no() {
		return approval_no;
	}
	public void setApproval_no(int approval_no) {
		this.approval_no = approval_no;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public int getDepart_no() {
		return depart_no;
	}
	public void setDepart_no(int depart_no) {
		this.depart_no = depart_no;
	}
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
	public String getPer_state() {
		return per_state;
	}
	public void setPer_state(String per_state) {
		this.per_state = per_state;
	}
	public String getPer_member() {
		return per_member;
	}
	public void setPer_member(String per_member) {
		this.per_member = per_member;
	}
	public String getCr_namae() {
		return cr_namae;
	}
	public void setCr_namae(String cr_namae) {
		this.cr_namae = cr_namae;
	}
	public String getCr_member() {
		return cr_member;
	}
	public void setCr_member(String cr_member) {
		this.cr_member = cr_member;
	}
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
	public int getPerSong_no() {
		return perSong_no;
	}
	public void setPerSong_no(int perSong_no) {
		this.perSong_no = perSong_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCr_name() {
		return cr_name;
	}
	public void setCr_name(String cr_name) {
		this.cr_name = cr_name;
	}
	public int getCr_price() {
		return cr_price;
	}
	public void setCr_price(int cr_price) {
		this.cr_price = cr_price;
	}
	public Date getCr_regdate() {
		return cr_regdate;
	}
	public void setCr_regdate(Date cr_regdate) {
		this.cr_regdate = cr_regdate;
	}
	public Date getCr_expdate() {
		return cr_expdate;
	}
	public void setCr_expdate(Date cr_expdate) {
		this.cr_expdate = cr_expdate;
	}
	public Date getCr_contdate() {
		return cr_contdate;
	}
	public void setCr_contdate(Date cr_contdate) {
		this.cr_contdate = cr_contdate;
	}
	public String getCr_state() {
		return cr_state;
	}
	public void setCr_state(String cr_state) {
		this.cr_state = cr_state;
	}
	public int getPerhis_no() {
		return perhis_no;
	}
	public void setPerhis_no(int perhis_no) {
		this.perhis_no = perhis_no;
	}
	public int getPer_price() {
		return per_price;
	}
	public void setPer_price(int per_price) {
		this.per_price = per_price;
	}
	public Date getPer_date() {
		return per_date;
	}
	public void setPer_date(Date per_date) {
		this.per_date = per_date;
	}
	


}
