package kr.co.gudi.notification.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.notification.dao.NotiDAO;
import kr.co.gudi.notification.dto.NotiDTO;

@Service
public class NotiService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	
	public Map<String, Object> notiList(String member_no, int depart_no) {
		
		ArrayList<NotiDTO> list = new ArrayList<NotiDTO>();
		String num = Integer.toString(depart_no);
		list = dao.notiList(member_no,num);
		
		map.put("list", list);
		// 새로운 알림 개수 
		int noti_count = dao.notiCount(member_no,num);
		map.put("noti_count", noti_count);
		logger.info("noti_count==="+noti_count);
		int size = list.size();
		map.put("size", size);
		
		return map;
	}

	public void stateUpdate(String noti_no, String locate) {
		dao.stateUpdate(noti_no, locate);
	}

	public Map<String, Object> notiCount(String member_no, int depart_no) {
		String num = Integer.toString(depart_no);
		int noti_count = dao.notiCount(member_no, num);
		map.put("noti_count", noti_count);
		return map;
	}

	public Map<String, Object> notiDel(ArrayList<String> delList, Model model) {
		// 작성자가 맞으면 삭제 
		int cnt = 0;
		for(String noti_no : delList) {
			cnt+= dao.notiDel(noti_no);
			logger.info("cnt == "+cnt);
		}
		
		map.put("del_cnt", cnt);
		return map;
	}

	public void deleteNoti() {
		dao.deleteNoti();
	}

}
