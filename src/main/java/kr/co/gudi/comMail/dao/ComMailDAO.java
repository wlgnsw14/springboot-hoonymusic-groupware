package kr.co.gudi.comMail.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.comMail.dto.ComMailDTO;

@Mapper
public interface ComMailDAO {

	int getReTotalMail(int member_no);

	int getReUnreadMail(int member_no);
	
	ArrayList<ComMailDTO> receiveList(int offset, int loginNo);
	
	ArrayList<ComMailDTO> receiveListSearch(String search_info, int offset, int loginNo);

	ArrayList<ComMailDTO> receiveListRead(String search_info, int offset, int loginNo);
	
	ArrayList<ComMailDTO> receiveListUnread(String search_info, int offset, int loginNo);
	
	int reTotalCnt(String search_info, int loginNo, String readOption);
	
	int seTotalCnt(String search_info, int loginNo, String readOption);

	void delReceive(String idx);

	ComMailDTO receiveMailDetail(String note_no);

	ArrayList<ComMailDTO> getFile(String note_no);
	
	int getSeTotalMail(int member_no);
	
	int getSeUnreadMail(int member_no);

	ArrayList<ComMailDTO> sendList(int offset, int loginNo);
	
	ArrayList<ComMailDTO> sendListRead(String search_info, int offset, int loginNo);
	
	ArrayList<ComMailDTO> sendListUnread(String search_info, int offset, int loginNo);
	
	ArrayList<ComMailDTO> sendListSearch(String search_info, int offset, int loginNo);
	
	void delSend(String idx);
	
	ComMailDTO sendMailDetail(String note_no);
	
	ComMailDTO write(HashMap<String, String> param);

	int getReceiverNo(String receiver_name);

	void upload(ComMailDTO dto);

	void updateSeState(String note_no);

	void updateReState(String note_no);

	// 메일 답장시 보낸 사람의 이름을 가져온다 
	String getSender(String note_no);

	void mailFileUpload(String oriFileName, String newFileName, int note_no, String size);
	
}
