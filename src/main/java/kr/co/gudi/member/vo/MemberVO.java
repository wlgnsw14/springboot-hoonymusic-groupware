package kr.co.gudi.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.gudi.comMail.dto.ComMailDTO;
import kr.co.gudi.member.dto.MemberAuthority;


public class MemberVO implements UserDetails {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	private int member_no;
	private String member_car_no;
	private String member_id;
	private String pw;
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
	private int depart_no;
	private String depart_name;
	private int depart_p_no;
	private String depart_p_name;
	private List<ComMailDTO> note;
	

	@Override		// 권한 판단
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		
		// 부서와 팀에 따른 권한 부여
		switch(depart_p_no) {
			case 1:
				auth.add(new SimpleGrantedAuthority(MemberAuthority.MARKETING.name()));
				switch (depart_no) {
					case 5:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.AD_TEAM_EMP.name()));
						break;
					case 6:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.PLANNING_TEAM_EMP.name()));
						break;
					case 7:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.DESIGN_TEAM_EMP.name()));
						break;
					}
					break;
						
			case 2:
				auth.add(new SimpleGrantedAuthority(MemberAuthority.OPERATIONS.name()));
				switch(depart_no) {
					case 8:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.DISTRIBUTION_TEAM_EMP.name()));
						break;
					case 9:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.CORYRIGHT_TEAM_EMP.name()));
						break;
					case 10:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.CONTRACT_TEAM_EMP.name()));
						break;
					case 11:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.STRATEGY_TEAM_EMP.name()));
						break;
				}
				break;
						
			case 3:
				auth.add(new SimpleGrantedAuthority(MemberAuthority.SUPPORT.name()));
				switch (depart_no) {
					case 12:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.SUPPORT_TEAM_EMP.name()));
						break;
					case 13:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.ADMINIST_TEAM_EMP.name()));
						break;
					case 14:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.REPRESENT_TEAM_EMP.name()));
						break;
				}
				break;
						
			case 4:
				auth.add(new SimpleGrantedAuthority(MemberAuthority.EXECUTIVE.name()));
				switch (depart_no) {
					case 15:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.CEO.name()));
						break;
					case 16:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.PRESIDENT.name()));
						break;
					case 17:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.SENIOR.name()));
						break;
					case 18:
						auth.add(new SimpleGrantedAuthority(MemberAuthority.EXEPRESIDENT.name()));
						break;
				}
				break;
		}
		
		return auth;
	}

	@Override		// 사용자 id 반환
	public String getUsername() {
		return member_id;
	}
	
	
	@Override		// 사용자 pw 반환
	public String getPassword() {
		return pw;
	}


	@Override		// 계정 만료 여부 반환
	public boolean isAccountNonExpired() {
		return true;	// true : 만료되지 않음
	}


	@Override		// 계정 잠금 여부 반환
	public boolean isAccountNonLocked() {
		return true;	// true : 잠금 되지 않음
	}


	@Override		// 퇴사자 권한 없음
	public boolean isCredentialsNonExpired() {
		return resign_date == null;
	}


	@Override		// 계정 사용 가능 여부 반환
	public boolean isEnabled() {
		return true;	// true : 사용 가능
	}

	
	public BCryptPasswordEncoder getEncoder() {
		return encoder;
	}


	public void setEncoder(BCryptPasswordEncoder encoder) {
		this.encoder = encoder;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getMember_car_no() {
		return member_car_no;
	}


	public void setMember_car_no(String member_car_no) {
		this.member_car_no = member_car_no;
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


	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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

	
	public String getMember_position() {
		return member_position;
	}

	
	public void setMember_position(String member_position) {
		this.member_position = member_position;
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

	public int getDepart_p_no() {
		return depart_p_no;
	}

	public void setDepart_p_no(int depart_p_no) {
		this.depart_p_no = depart_p_no;
	}

	public String getDepart_p_name() {
		return depart_p_name;
	}

	public void setDepart_p_name(String depart_p_name) {
		this.depart_p_name = depart_p_name;
	}

	public List<ComMailDTO> getNote() {
		return note;
	}

	public void setNote(List<ComMailDTO> note) {
		this.note = note;
	}
}
