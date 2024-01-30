package kr.co.gudi.archive.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("archive")
public class ArchiveDTO {

	private int arch_no;
	private int member_no;
	private String arch_depart;
	private Date arch_date;
	private String arch_state;
	
	private String file_oriname;
	private String file_newname;
	private String file_size;
	
	private String name;
	private String depart_name;
	private int depart_p_no;
	private int depart_no;
	
	
	public String getArch_state() {
		return arch_state;
	}
	public void setArch_state(String arch_state) {
		this.arch_state = arch_state;
	}
	public int getDepart_p_no() {
		return depart_p_no;
	}
	public void setDepart_p_no(int depart_p_no) {
		this.depart_p_no = depart_p_no;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFile_oriname() {
		return file_oriname;
	}
	public void setFile_oriname(String file_oriname) {
		this.file_oriname = file_oriname;
	}
	public String getFile_newname() {
		return file_newname;
	}
	public void setFile_newname(String file_newname) {
		this.file_newname = file_newname;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public int getArch_no() {
		return arch_no;
	}
	public void setArch_no(int arch_no) {
		this.arch_no = arch_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getArch_depart() {
		return arch_depart;
	}
	public void setArch_depart(String arch_depart) {
		this.arch_depart = arch_depart;
	}
	public Date getArch_date() {
		return arch_date;
	}
	public void setArch_date(Date arch_date) {
		this.arch_date = arch_date;
	}
	
}
