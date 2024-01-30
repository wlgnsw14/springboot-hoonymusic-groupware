package kr.co.gudi.notification.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.notification.dto.NotiDTO;

@Mapper
public interface NotiDAO {

	ArrayList<NotiDTO> notiList(String member_no, String num);

	void stateUpdate(String noti_no, String locate);

	int notiCount(String member_no, String num);

	int notiDel(String noti_no);

	void deleteNoti();


}
