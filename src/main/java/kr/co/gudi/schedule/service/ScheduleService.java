package kr.co.gudi.schedule.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.schedule.dao.ScheduleDAO;
import kr.co.gudi.schedule.dto.ScheduleDTO;

@Service
public class ScheduleService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ScheduleDAO dao;
	
	public void write(HashMap<String, Object> param) {
		 dao.write(param);
		 String sch_state=(String) param.get("sch_state");
		 if(sch_state.equals("2")) {
			 dao.nWrite(param);			 
		 }else if(sch_state.equals("3")){
			 dao.dWrite(param);
		 }
		 
		
	}

	public List<ScheduleDTO> list(int member_no, String sch_state, int sch_depart) {
		logger.info("sch_state 가 안왔어?: "+sch_state);
		List<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
		if(sch_state.equals("0")) {
			logger.info("0번실행");
			list= dao.list(member_no,sch_state,sch_depart);
		}else if(sch_state.equals("2")) {
			logger.info("2번실행");
			list = dao.allList(sch_state);
		}else if(sch_state.equals("3")) {
			logger.info("3번실행");
			list = dao.dptList(sch_state,sch_depart);
		}
		
		return list;
	}
	
	
	public String addForm(HashMap<String, Object> params) {
		
		return dao.addForm(params);
	}
	public ScheduleDTO detail(String sch_no) {
		return dao.detail(sch_no);
	}
	public ArrayList<ScheduleDTO> schDetail(String sch_no) {
		
		return dao.schDetail(sch_no);
	}
	public void delSch(String sch_no) {
		dao.delSch(sch_no);
		
	}
}
