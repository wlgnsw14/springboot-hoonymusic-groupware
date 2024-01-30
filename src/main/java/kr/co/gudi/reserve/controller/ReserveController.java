package kr.co.gudi.reserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.reserve.dto.ReserveDTO;
import kr.co.gudi.reserve.service.ReserveService;

@RestController
public class ReserveController {
	@Autowired ReserveService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value = "/reserve")
	public ModelAndView reserve(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("reserv/reserv");
		int Depart_no = ((MemberVO)session.getAttribute("loginMember")).getDepart_no();
		
		mav.addObject("depart_no",Depart_no);
		
		return mav;
	}
	
	@GetMapping(value = "/reserveget")
	public ModelAndView reserveget(@RequestParam HashMap<String, String> data,HttpSession session) {
		
		logger.info("data : "+data);
		
		logger.info("리저브 컨트롤러 들어옴");
		
		ModelAndView mav = new ModelAndView("redirect:/reserve");
		String member_name = ((MemberVO)session.getAttribute("loginMember")).getName();
		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		data.put("member_name", member_name);
		String.valueOf(member_no);
		data.put("member_no", String.valueOf(member_no));
		service.reserveget(data);
		
		return mav;
	}
	
	@PostMapping(value = "/reservnogetlist")
	public Map<String, Object> copyrightnolist(@RequestParam String pagePerNum,@RequestParam String page, HttpSession session){
		logger.info("/"+"pagePerNum"+pagePerNum+"page"+page);
		
		Map<String, Object> data = service.reservnogetlist(page,pagePerNum,session);
		logger.info("data : "+data);
		
		return data;
	}
	
	@PostMapping(value = "/reservlist")
	public Map<String, Object> reservlist(@RequestParam String pagePerNum,@RequestParam String page, HttpSession session){
		logger.info("/"+"pagePerNum"+pagePerNum+"page"+page);
		
		Map<String, Object> data = service.reservlist(page,pagePerNum,session);
		logger.info("data : "+data);
		
		return data;
	}
	
	@PostMapping(value = "/reservdetail")
	public ArrayList<ReserveDTO> reservdetail(@RequestParam String res_no) {
		
		
		
		
		return service.reservdetail(res_no);
	}
	
	@PostMapping(value = "/reservAdmin")
	public Map<String, Object> reservAdmin(@RequestParam String pagePerNum,@RequestParam String page, HttpSession session){
		logger.info("/"+"pagePerNum"+pagePerNum+"page"+page);
		
		Map<String, Object> data = service.reservAdmin(page,pagePerNum,session);
		logger.info("data : "+data);
		
		return data;
	}
	
	@GetMapping(value = "/reservOk")
	public ModelAndView reservOk(@RequestParam String res_no, HttpSession session) {
		
		logger.info("res_no"+res_no);
		service.reservOk(res_no,session);
		ModelAndView mav = new ModelAndView("redirect:/reserve");
		
		return mav;
	}
	
	@PostMapping(value = "/reservNo")
	public String reservNo(@RequestParam String res_no, @RequestParam String res_content, HttpSession session) {
		
		service.reservNo(res_no,res_content,session);
		String data="성공";
		
		
		return data ;
	}

}
