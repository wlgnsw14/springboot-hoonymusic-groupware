package kr.co.gudi.comMail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.approval.dto.ApprovalDTO;
import kr.co.gudi.approval.service.ApprovalService;
import kr.co.gudi.comMail.service.ComMailService;
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class ComMailController {
	@Autowired ComMailService service;
	@Autowired ApprovalService apprService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/receiveMail")
	public String receiveMailHome() {
		return "/comMail/comMailReceive";
	}
	
	// 전체 메일 수 / 읽지 않은 메일 수
	@GetMapping("/receiveMail/counts.ajax")
	@ResponseBody
	public ResponseEntity<Map<String, Integer>> getReMailCounts(HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		
		// 세션에 로그인된 사용자가 없다면 에러 응답
	    if (loginMember == null) {
	        return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	    }
		
		Map<String, Integer> mailCounts = new HashMap<>();
		
		int totalMail = service.getReTotalMail(loginMember.getMember_no());
		int unreadMail = service.getReUnreadMail(loginMember.getMember_no());
		
		mailCounts.put("totalMail", totalMail);
		mailCounts.put("unreadMail", unreadMail);
		
		return new ResponseEntity<>(mailCounts, HttpStatus.OK);
	}
	
	// 받은 메일함 리스트 출력
	@GetMapping("/receiveMail/list.ajax")
	@ResponseBody
	public Map<String, Object> receiveList(String search_info, String page, int loginNo, String readOption){
		return service.receiveList(search_info, page, loginNo, readOption);
	}
	
	// 받은 메일함 검색
	@GetMapping("/receiveMail/search.ajax")
	@ResponseBody
	public Map<String, Object> reMailSearch(String search_info, String page, int loginNo, String readOption){
		return service.receiveList(search_info, page, loginNo, readOption);
	}
	
	// 받은 메일함 삭제
	@GetMapping("/receiveMail/delMail.ajax")
	@ResponseBody
	public String delReceive(@RequestParam(value = "delList[]") ArrayList<String> delList){
		service.delReceive(delList);
		
		return "redirect:/receiveMail";
	}
	
	// 받은 메일함 상세보기
	@GetMapping("/receiveMail/list/detail")
	public ModelAndView receiveMailDetail(String note_no) {
		return service.receiveMailDetail(note_no);
	}
	
	@GetMapping("/sendMail")
	public String sentMailHome() {
		return "/comMail/comMailSend";
	}
	
	// 전체 메일 수 / 읽지 않은 메일 수
	@GetMapping("/sendMail/counts.ajax")
	@ResponseBody
	public ResponseEntity<Map<String, Integer>> getSeMailCounts(HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
			
		// 세션에 로그인된 사용자가 없다면 에러 응답
		if (loginMember == null) {
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}
			
		Map<String, Integer> mailCounts = new HashMap<>();
			
		int totalMail = service.getSeTotalMail(loginMember.getMember_no());
		int unreadMail = service.getSeUnreadMail(loginMember.getMember_no());
			
		mailCounts.put("totalMail", totalMail);
		mailCounts.put("unreadMail", unreadMail);
			
		return new ResponseEntity<>(mailCounts, HttpStatus.OK);
	}
	
	// 받은 메일함 리스트 출력
	@GetMapping("/sendMail/list.ajax")
	@ResponseBody
	public Map<String, Object> sendList(String search_info, String page, int loginNo, String readOption){
		return service.sendList(search_info, page, loginNo, readOption);
	}
	
	// 보낸 메일함 검색
	@GetMapping("/sendMail/search.ajax")
	@ResponseBody
	public Map<String, Object> seMailSearch(String search_info, String page, int loginNo, String readOption){
		return service.sendList(search_info, page, loginNo, readOption);
	}
	
	// 보낸 메일함 삭제
	@GetMapping("/sendMail/delMail.ajax")
	@ResponseBody
	public String delSend(@RequestParam(value = "delList[]") ArrayList<String> delList){
		service.delSend(delList);
		return "redirect:/sendMail";
	}
	
	// 보낸 메일함 상세보기
	@GetMapping("/sendMail/list/detail")
	public ModelAndView sendMailDetail(String note_no) {
		return service.sendMailDetail(note_no);
	}
	
	@GetMapping("/writeMail")
	public ModelAndView writeMail(String note_no) {
		logger.info("note_no === "+note_no);
		// ApprovalService 의 mailOrganization() 메서드 
		ModelAndView mav = apprService.mailOrganization();
		mav.setViewName("comMail/comMailWrite");
		String sender = "";
		if(note_no!=null) {
			// 메일 답장시 보낸 사람의 이름을 가져온다 
			sender = service.getSender(note_no);
		}
		mav.addObject("sender", sender);
		return mav;
	}
	
	// 메일 쓰기
	@PostMapping("/writeMail.do")
	public String write(@RequestParam("files") MultipartFile[] files, @RequestParam HashMap<String, String>param,  
			Model model, HttpSession session) throws IOException {
		int sender_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		service.write(files, param, sender_no);
		model.addAttribute("msg","전송이 완료되었습니다.");
		model.addAttribute("url","/sendMail");
		return "common/msg";
	}
	
	@GetMapping("/delSeMailDetail")
	public String delSeMailDetail(String note_no) {
		service.delSeMailDetail(note_no);
		return "redirect:/sendMail";
	}
	
	@GetMapping("/delReMailDetail")
	public String delReMailDetail(String note_no) {
		service.delReMailDetail(note_no);
		return "redirect:/receiveMail";
	}
	
}
