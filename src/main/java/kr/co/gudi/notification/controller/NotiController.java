package kr.co.gudi.notification.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.notification.service.NotiService;

@Controller
public class NotiController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService service;
	
	@GetMapping(value="/noti")
	public String noti(HttpSession session, Model model) {
		return "notification/noti";
	}
	
	@GetMapping(value="/notiList")
	@ResponseBody
	public Map<String, Object> notiList(String member_no, HttpSession session){
		logger.info("member_no === " + member_no);
		int depart_no = ((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		logger.info("depart_no === "+depart_no);
		return service.notiList(member_no, depart_no);
	}
	
	@GetMapping(value="/notiCount")
	@ResponseBody
	public Map<String, Object> notiCount(String member_no, HttpSession session){
		logger.info("member_no === " + member_no);
		int depart_no = ((MemberVO)session.getAttribute("loginMember")).getDepart_p_no();
		logger.info("depart_no === "+depart_no);
		return service.notiCount(member_no, depart_no);
	}	
	
	
	@GetMapping(value="/notiStateUpdate")
	public String notiStateUpdate(String noti_no, String locate){
		logger.info("unique_no / locate === " + noti_no + " / " + locate);
		service.stateUpdate(noti_no, locate);
		return "redirect:/noti";
	}
	
	
	@GetMapping(value="/notiDel")
	@ResponseBody
	public Map<String, Object> notiDel(@RequestParam(value="delList[]") ArrayList<String> delList,
			HttpSession session, Model model){
		return service.notiDel(delList,model);
	}
	
	@Scheduled(cron = "0 0 3 * * *")
	public void deleteNoti() {
		logger.info("오래된 알림 삭제 완료!");
		try {
			service.deleteNoti();
		} catch (Exception e) {
			
		}
	}
}
