package kr.co.gudi.resource.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.resource.dto.CopyrightDTO;

@Mapper 
public interface CopyrightDAO {

	ArrayList<CopyrightDTO> copyrightnolist();

	ArrayList<CopyrightDTO> copyrightlist(String search,String searchtag, int offset);

	int maxpage(int pagePerNum, String search, String searchtag);

	ArrayList<CopyrightDTO> copyrightnolist(String search, String searchtag, int offset);
	
	int nomaxpage(int pagePerNum, String search, String searchtag);
	
	Map<String, Object> detaildata(String num);

	void resourceCopyrightregister(String no, String date, int price, String namae, String per_member);

	

	ArrayList<CopyrightDTO> resourcecopyrightgetlist(String search, String searchtag, int offset);

	int rclmaxpage(int pagePerNum, String search, String searchtag);

	void copyrightnoti(HashMap<String,String> data);

	void copyrightregister(CopyrightDTO dto);

	void writeFile(String idx, String oriFileName, String newFileName, String kb);

	void resourceCopyrightdelete(String cr_no, String per_price);

	Map<String, Object> depttlist();

	void apprcr(CopyrightDTO dto);

	void appcon(CopyrightDTO dto);

	Map<String, String> crd2(int appr_no);

	void okcr(String no);

	void uprp(int app);

	void nocr(String no);



}
