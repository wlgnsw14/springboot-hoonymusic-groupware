package kr.co.gudi.artist.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.resource.dto.CopyrightDTO;

@Mapper
public interface ArtistDAO {

	ArrayList<CopyrightDTO> artistlist(String search, String searchtag, int offset);

	int artmaxpage(int pagePerNum, String search, String searchtag);

	void artistget(HashMap<String, String> data);

	void artistdelete(String art_no);

	ArrayList<CopyrightDTO> artistdetail_1(int offset, int num);

	float artistmaxpage_1(int pagePerNum, int num);
	
	ArrayList<CopyrightDTO> artistdetail_2(int offset, int num);

	float artistmaxpage_2(int pagePerNum, int num);
	
	ArrayList<CopyrightDTO> artistdetail_3(int offset, int num);

	int artistmaxpage_3(int pagePerNum, int num);

}
