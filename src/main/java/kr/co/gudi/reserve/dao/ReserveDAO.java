package kr.co.gudi.reserve.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.reserve.dto.ReserveDTO;
import kr.co.gudi.resource.dto.CopyrightDTO;

@Mapper
public interface ReserveDAO {

	void reserveget(HashMap<String, String> data);

	ArrayList<CopyrightDTO> reservnogetlist(int offset, String myno);

	float reservnomaxpage(int pagePerNum, String myno);

	ArrayList<CopyrightDTO> reservlist(int offset, String myno);

	int reservmaxpage(int pagePerNum, String myno);

	ArrayList<ReserveDTO> reservdetail(int res_no);

	ArrayList<CopyrightDTO> reservAdmin(int offset, String myno);

	float reservAdminmaxpage(int pagePerNum, String myno);

	void reservOk(int res_no);

	void reservNo(int res_no);

	void reservNo_his(int res_no, String res_content);

	void reservOk_his(int res_no, String member_name, int member_no);

	void reservNo_his(int res_no, String res_content, String member_name, int member_no);

}
