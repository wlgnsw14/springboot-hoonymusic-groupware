package kr.co.gudi.member.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.approval.dto.ApprovalDTO;
import kr.co.gudi.member.dto.Department;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.member.vo.MemberVO;


@Mapper
public interface MemberDAO {
	List<MemberDTO> getAllMembers = null;

	MemberVO selectMemberByParam(Map<String, Object> param);

	MemberVO selectApprovMember(String member_id);

	int updateProfileImg(Map<String, Object> param);

	int searchFileNo(int member_no);
	
	MemberVO getMember();
	
	List<MemberDTO> getAllDepartments();

	List<MemberDTO> getAllMembers();
	/*
	List<Department> getAllDepartments();

	List<MemberDTO> getTeamList(int depart_no);

	List<MemberDTO> getMemberList(int depart_no);
	*/
	List<MemberDTO> getMemberDetail(int member_no);

	void join(HashMap<String, String> params);

	int getMember_id();

	void uploadProfile(String file_location, int file_unique_no, String oriFileName, String newFileName, int size);

	ArrayList<MemberDTO> list(String member_state,int depart_no);

	void depart(int member_no, String depart_name);

	void team(int member_no, String team_name);

	ArrayList<MemberDTO> detail(String member_no);

	String file(String member_no, String string);

	void updateDo(String member_no);

	void updateProfile(String file_location, String member_no, String oriFileName, String newFileName, int size);

	ArrayList<MemberDTO> departList(String depart_state);

	List<MemberDTO> getDepartList();

	List<MemberDTO> teamList(int depart_no);

	String getDepartNo(HashMap<String, String> params);

	String teamName(int depart_no);

	String depart_name(int depart_no);

	void updateLeave(String formattedDate);

	int getDepart(String member_no);

	void updateDo(HashMap<String, String> params);

	Map<String, Object> getMemberInfo(int member_no);
	
	void updateTotalMember();

	ArrayList<MemberDTO> departTotal();

	void updateParrentDepart(int depart_no);

	ArrayList<MemberDTO> detailDepart(String depart_no);

	ArrayList<MemberDTO> getTeam(String depart_no);


	void updateDpt(HashMap<String, String> param);

	ArrayList<MemberDTO> detailTeam(String depart_name);

	ArrayList<MemberDTO> getOrgChartData();

	ArrayList<ApprovalDTO> dptInfo();

	ArrayList<ApprovalDTO> memberInfo();
	String getFileName(int member_no);

	String findFileName(String member_no);

	void createDpt(HashMap<String, String> param);

	void delDpt(String depart_no);

	void delMember(String member_no, String resign_date);

	void createTeam(HashMap<String, String> param);

	void updateTeam(HashMap<String, String> param);
}
