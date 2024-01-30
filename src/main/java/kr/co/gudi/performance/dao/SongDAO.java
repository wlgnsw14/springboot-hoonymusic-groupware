package kr.co.gudi.performance.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.performance.dto.SongDTO;

@Mapper
public interface SongDAO {

	ArrayList<SongDTO> list(String search_info, int offset);

	SongDTO songDetail(String song_no);

	ArrayList<SongDTO> getFile(String song_no);

	void fileUpload(int song_no, String oriFileName, String newFileName, String size);

	int totalCnt(String search_info);
}
