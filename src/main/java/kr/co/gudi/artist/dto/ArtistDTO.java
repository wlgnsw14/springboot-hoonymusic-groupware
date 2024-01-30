package kr.co.gudi.artist.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("artist")
public class ArtistDTO {
	
	int art_no;
	String art_name;
	String art_agency;
	
	//---album
	int alb_no;
	int member_no;
	String alb_name;
	int alb_price;
	String alb_revenue;
	Date alb_contract;
	Date alb_startdate;
	Date alb_expiredate;
	String alb_state;
	
	//----song
	int song_no;
	String song_name;
	Date song_contract;
	Date song_startDate;
	Date song_endDate;
	String song_state;
	String song_revenue;
	String song_owner;
	
	//----song_per
	int perSong_no;
	String cr_no;
	int allSong_profit;
	int song_streaming;
	
	
	
	
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
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
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
	public String getSong_revenue() {
		return song_revenue;
	}
	public void setSong_revenue(String song_revenue) {
		this.song_revenue = song_revenue;
	}
	public String getSong_owner() {
		return song_owner;
	}
	public void setSong_owner(String song_owner) {
		this.song_owner = song_owner;
	}
	public int getAlb_no() {
		return alb_no;
	}
	public void setAlb_no(int alb_no) {
		this.alb_no = alb_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getAlb_name() {
		return alb_name;
	}
	public void setAlb_name(String alb_name) {
		this.alb_name = alb_name;
	}
	public int getAlb_price() {
		return alb_price;
	}
	public void setAlb_price(int alb_price) {
		this.alb_price = alb_price;
	}
	public String getAlb_revenue() {
		return alb_revenue;
	}
	public void setAlb_revenue(String alb_revenue) {
		this.alb_revenue = alb_revenue;
	}
	public Date getAlb_contract() {
		return alb_contract;
	}
	public void setAlb_contract(Date alb_contract) {
		this.alb_contract = alb_contract;
	}
	public Date getAlb_startdate() {
		return alb_startdate;
	}
	public void setAlb_startdate(Date alb_startdate) {
		this.alb_startdate = alb_startdate;
	}
	public Date getAlb_expiredate() {
		return alb_expiredate;
	}
	public void setAlb_expiredate(Date alb_expiredate) {
		this.alb_expiredate = alb_expiredate;
	}
	public String getAlb_state() {
		return alb_state;
	}
	public void setAlb_state(String alb_state) {
		this.alb_state = alb_state;
	}
	public int getArt_no() {
		return art_no;
	}
	public void setArt_no(int art_no) {
		this.art_no = art_no;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getArt_agency() {
		return art_agency;
	}
	public void setArt_agency(String art_agency) {
		this.art_agency = art_agency;
	}
	
	

}
