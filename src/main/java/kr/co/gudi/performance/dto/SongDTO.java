package kr.co.gudi.performance.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;


@Alias("song")
public class SongDTO {
	private int song_no;
	private int art_no;
	private int member_no;
	private String art_name;
	private String name;
	private String member_position;
	private String song_name;
	private Date song_contract;
	private Date song_startDate;
	private Date song_endDate;
	private String song_state;
	private Double song_revenue;
	private String song_owner;
	private int perSong_no;
	private String cr_no;
	private int allSong_profit;
	private int song_streaming;
	private String file_oriname;
	private String file_newname;
	
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	public int getArt_no() {
		return art_no;
	}
	public void setArt_no(int art_no) {
		this.art_no = art_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
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
	public String getSong_name() {
		return song_name;
	}
	public void setSong_name(String song_name) {
		this.song_name = song_name;
	}
	public Date getSong_contract() {
		return song_contract;
	}
	public void setSong_contract(Date song_contract) {
		this.song_contract = song_contract;
	}
	public Date getSong_startDate() {
		return song_startDate;
	}
	public void setSong_startDate(Date song_startDate) {
		this.song_startDate = song_startDate;
	}
	public Date getSong_endDate() {
		return song_endDate;
	}
	public void setSong_endDate(Date song_endDate) {
		this.song_endDate = song_endDate;
	}
	public String getSong_state() {
		return song_state;
	}
	public void setSong_state(String song_state) {
		this.song_state = song_state;
	}
	public Double getSong_revenue() {
		return song_revenue;
	}
	public void setSong_revenue(Double song_revenue) {
		this.song_revenue = song_revenue;
	}
	public String getSong_owner() {
		return song_owner;
	}
	public void setSong_owner(String song_owner) {
		this.song_owner = song_owner;
	}
	public int getPerSong_no() {
		return perSong_no;
	}
	public void setPerSong_no(int perSong_no) {
		this.perSong_no = perSong_no;
	}
	public String getCr_no() {
		return cr_no;
	}
	public void setCr_no(String cr_no) {
		this.cr_no = cr_no;
	}
	public int getAllSong_profit() {
		return allSong_profit;
	}
	public void setAllSong_profit(int allSong_profit) {
		this.allSong_profit = allSong_profit;
	}
	public int getSong_streaming() {
		return song_streaming;
	}
	public void setSong_streaming(int song_streaming) {
		this.song_streaming = song_streaming;
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
	
}
