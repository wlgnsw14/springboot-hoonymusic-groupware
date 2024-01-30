package kr.co.gudi.schedule.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.schedule.dto.ScheduleDTO;
import kr.co.gudi.schedule.service.ScheduleService;

@Controller
public class ScheduleController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ScheduleService service;
	
	@GetMapping(value="/schedule")
	public ModelAndView index() {
		logger.info("index 캘린더 출력 test");
		return new ModelAndView("schedule/scheduleList");
	}
	
	@GetMapping(value="/schedule/list")
	@ResponseBody
	public HashMap<String, Object> list(HttpSession session,@RequestParam String sch_state) {
		logger.info("일정 리스트 호출");
		logger.info("일정 분류 상태 : "+sch_state);
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		int sch_depart=((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		List<ScheduleDTO> eventList = service.list(member_no,sch_state,sch_depart);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("eventList", eventList);
		return result;
	}


	@GetMapping(value = "/save")
	@ResponseBody
	public ModelAndView scheduleAdd(@RequestParam HashMap<String, Object> param,
			HttpSession session) {
		//logger.info("현재 일정작성 위치 : "+sch_state);
		int member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		int sch_depart=((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		logger.info("직원번호 : "+member_no+"/ 부서명 : "+sch_depart);
		param.put("member_no", member_no);
		param.put("sch_depart", sch_depart);
		int depart_no=((MemberVO)session.getAttribute("loginMember")).getDepart_no();
		param.put("depart_no", depart_no);
		logger.info("일정:"+param);
	
		service.write(param);
		return new ModelAndView("schedule/scheduleList");
	}
	

	@GetMapping(value = "/schedule/getEventDetails")
	public String detail(@RequestParam String sch_no, Model model) {
		logger.info("Controller detail 함수");
		ScheduleDTO sch = service.detail(sch_no);
		model.addAttribute("sch", sch);
		
		return "scheduleDetail";
	}
			

	@GetMapping(value="/detailSchedule")
	@ResponseBody
	public HashMap<String, Object> detailSchedule(@RequestParam String sch_no) {
		logger.info("디테일정보 : "+sch_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ScheduleDTO> dto = service.schDetail(sch_no);
		map.put("dto", dto);
		return map;
	}
	
	@GetMapping(value="/delSch")
	public ModelAndView delSch(@RequestParam String sch_no){
		logger.info("일정 pk 번호 : "+sch_no);
		service.delSch(sch_no);
		return new ModelAndView("schedule/scheduleList");
	}	

}