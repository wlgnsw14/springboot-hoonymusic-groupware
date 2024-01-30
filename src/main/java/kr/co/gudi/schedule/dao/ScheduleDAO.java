package kr.co.gudi.schedule.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gudi.schedule.dto.ScheduleDTO;

@Mapper
public interface ScheduleDAO {

	void write(HashMap<String, Object> param);

	String addForm(HashMap<String, Object> params);

	ScheduleDTO detail(String sch_no);

	ArrayList<ScheduleDTO> schDetail(String sch_no);

	void delSch(String sch_no);

	void nWrite(HashMap<String, Object> param);

	List<ScheduleDTO> list(int member_no, String sch_state, int sch_depart);

	List<ScheduleDTO> allList(String sch_state);

	List<ScheduleDTO> dptList(String sch_state, int sch_depart);

	void dWrite(HashMap<String, Object> param);


}
