package kr.co.gudi.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.board.dto.BoardDTO;

@Mapper
public interface BoardDAO {

	void write(BoardDTO dto);

	BoardDTO detail(String board_no);

	void bHit(String board_no);
	
	int del(String board_no);

	int modify(HashMap<String, String> params);

	void writePhoto(int board_no, String file_oriname, String file_newname, long fileSize);

	ArrayList<BoardDTO> getPhoto(String board_no);

	void modifyImage(String file_location, String board_no, String file_oriname, String file_newname, int size);

	int totalPage(int member_no);
	
	ArrayList<BoardDTO> list(int ppn, int member_no);
	
	ArrayList<BoardDTO> boardSearch(String board_name, int offset, int member_no);
	
	ArrayList<BoardDTO> listD(int ppn, int member_no);
	
	ArrayList<BoardDTO> boardSearchD(String board_name, int offset, int member_no);

	void writeD(BoardDTO dto);

	int totalPageD();

	void modifyD(HashMap<String, String> params);

	BoardDTO detailD(String board_no);

	int delD(String board_no);
}
