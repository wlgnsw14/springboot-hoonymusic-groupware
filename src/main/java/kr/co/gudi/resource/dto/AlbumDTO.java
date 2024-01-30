package kr.co.gudi.resource.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("album")
public class AlbumDTO {
	private int alb_no;
	private int member_no;
	private int art_no;
	private String alb_name;
	private int alb_price;
	private double alb_revenue;
	private Date alb_contract;
	private Date alb_startdate;
	private Date alb_expiredate;
	private String alb_state;
	
	private String art_name;
	private String member_id;
	private String name;
	private String member_position;
	
	private int albpro_round;
	private int albpro_price;

	private int albsold_stock;
	private int total_albsold_stock;
	private int albsold_amount;
	private int albsold_profit;
	private Date albsold_date;
	
	private String file_location;
	private int file_unique_no;
	private String file_oriname;
	private String file_newname;
	
	
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
	
	public String getFile_location() {
		return file_location;
	}
	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}
	public int getFile_unique_no() {
		return file_unique_no;
	}
	public void setFile_unique_no(int file_unique_no) {
		this.file_unique_no = file_unique_no;
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
	public Date getAlbsold_date() {
		return albsold_date;
	}
	public void setAlbsold_date(Date albsold_date) {
		this.albsold_date = albsold_date;
	}
	public int getAlbsold_profit() {
		return albsold_profit;
	}
	public void setAlbsold_profit(int albsold_profit) {
		this.albsold_profit = albsold_profit;
	}
	public int getAlbsold_amount() {
		return albsold_amount;
	}
	public void setAlbsold_amount(int albsold_amount) {
		this.albsold_amount = albsold_amount;
	}
	public int getAlbpro_price() {
		return albpro_price;
	}
	public void setAlbpro_price(int albpro_price) {
		this.albpro_price = albpro_price;
	}
	public int getTotal_albsold_stock() {
		return total_albsold_stock;
	}
	public void setTotal_albsold_stock(int total_albsold_stock) {
		this.total_albsold_stock = total_albsold_stock;
	}
	public int getAlbpro_round() {
		return albpro_round;
	}
	public void setAlbpro_round(int albpro_round) {
		this.albpro_round = albpro_round;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getAlbsold_stock() {
		return albsold_stock;
	}
	public void setAlbsold_stock(int albsold_stock) {
		this.albsold_stock = albsold_stock;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
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
	public int getArt_no() {
		return art_no;
	}
	public void setArt_no(int art_no) {
		this.art_no = art_no;
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
	public double getAlb_revenue() {
		return alb_revenue;
	}
	public void setAlb_revenue(double alb_revenue) {
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
	
	
	
}
