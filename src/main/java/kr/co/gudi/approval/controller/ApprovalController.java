package kr.co.gudi.approval.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.approval.service.ApprovalService;
import kr.co.gudi.member.vo.MemberVO;

@Controller
public class ApprovalController {
	@Autowired
	ApprovalService apprService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	int member_no;
	
	// 기안서 작성 이동
	@GetMapping("/draftDoc")
	public ModelAndView draftDocForm(HttpSession session) {
		log.info("----------------- start draftDocForm --------------------");
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("----------------- end draftDocForm --------------------");
		return apprService.draftDoc(member_no);
	}
	
	// 휴가 신청서 작성 이동
		@GetMapping("/leaveApp")
		public ModelAndView leaveAppForm(HttpSession session) {
			log.info("----------------- start draftDocForm --------------------");
			member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
			log.info("----------------- end draftDocForm --------------------");
			return apprService.leaveApp(member_no);
		}
	
	// 결재선 지정
	@PostMapping("/setApprover.ajax")
	@ResponseBody
	public HashMap<String, Object> setApprover(@RequestBody Map<String, String[]> params){
		log.info("----------------- start setApprover --------------------");
		String[] approver = params.get("approver");
	    String[] observer = params.get("observer");
		log.info("approverNo : "+Arrays.toString(approver));
		log.info("obsersverNo : "+Arrays.toString(observer));
		log.info("----------------- end setApprover --------------------");
		return apprService.setApprover(approver, observer);
	}
	
	// 기안함 리스트 이동
	@GetMapping("/draftBox")
	public String draftBox() {
		return "approval/draftBox";
	}
	
	// 결재함 리스트 이동
	@GetMapping("/apprBox")
	public String apprBox() {
		return "approval/apprBox";
	}
	
	// 참조함 리스트 이동
	@GetMapping("/refBox")
		public String refBox() {
		return "approval/refBox";
	}
	
	// 기안서 디테일 이동
	@GetMapping("/draftDocDetail")
		public ModelAndView draftDocDetail(int approval_no, HttpSession session) {
		log.info("----------------- start draftDocDetail --------------------");
		log.info("approval_no : "+approval_no);
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("----------------- end draftDocDetail --------------------");
		return apprService.draftDocDetail(approval_no, member_no);
	}
	
	// 결재요청
	@PostMapping("/approvalWrite.do")
	public ModelAndView approvalWrite(@RequestParam HashMap<String, String> params, @RequestParam("files") MultipartFile[] files, @RequestParam(name="observer") String[] observer, HttpSession session) { 
		log.info("----------------- start approvalWrite --------------------");
		log.info("params : "+params);
		log.info("filesLength : "+files.length);
		log.info("files : "+files);
		log.info("filesEmpty : "+files[0].isEmpty());
		log.info("observer : "+Arrays.toString(observer));
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("----------------- end approvalWrite --------------------");
		return apprService.approvalWrite(params, files, member_no, observer);
	}
	
	// 결재승인
	@PostMapping("/approve.do")
	public ModelAndView approve(String approveReason, int approval_no, HttpSession session) {
		log.info("----------------- start approve --------------------");
		log.info("approval_no : "+approval_no);
		log.info("apprReason : "+approveReason);
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("----------------- start approve --------------------");
		return apprService.approve(approveReason, approval_no, member_no);
	}
	
	// 반려
	@PostMapping("/return.do")
	public ModelAndView apprReturn(String returnReason, int approval_no, HttpSession session) {
		log.info("----------------- start apprReturn --------------------");
		log.info("approval_no : "+approval_no);
		log.info("apprReason : "+returnReason);
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("----------------- start apprReturn --------------------");
		return apprService.apprReturn(returnReason, approval_no, member_no);
	}
	
	// 회수
	@PostMapping("/withdrawl.do")
	public ModelAndView withdrawl(int approval_no) {
		log.info("----------------- start withdrawl --------------------");
		log.info("approval_no : "+approval_no);
		log.info("----------------- start withdrawl --------------------");
		return apprService.withdrawl(approval_no);
	}
	
	// 기안함 리스트 출력
	@GetMapping("/draftListCall.ajax")
	@ResponseBody
	public HashMap<String, Object> draftListCall(HttpSession session, String page, String viewPageNum, String searchType, String searchInfo) {
		log.info("----------------- start draftListCall --------------------");
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("memberNo : "+member_no);
		log.info("page : "+page);
		log.info("viewPageNum : "+viewPageNum);
		log.info("searchType : "+searchType);
		log.info("searchInfo : "+searchInfo);
		log.info("----------------- end draftListCall --------------------");
		return apprService.draftListCall(member_no, page, viewPageNum, searchType, searchInfo);
	}
	
	// 결재함 리스트 출력
	@GetMapping("/apprListCall.ajax")
	@ResponseBody
	public HashMap<String, Object> apprListCall(HttpSession session, String page, String viewPageNum, String searchType, String searchInfo) {
		log.info("----------------- start apprListCall --------------------");
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("memberNo : "+member_no);
		log.info("page : "+page);
		log.info("viewPageNum : "+viewPageNum);
		log.info("searchType : "+searchType);
		log.info("searchInfo : "+searchInfo);
		log.info("----------------- end apprListCall --------------------");
		return apprService.apprListCall(member_no, page, viewPageNum, searchType, searchInfo);
	}
		
		
	// 참조함 리스트 출력
	@GetMapping("/refListCall.ajax")
	@ResponseBody
	public HashMap<String, Object> refListCall(HttpSession session, String page, String viewPageNum, String searchType, String searchInfo) {
		log.info("----------------- start refListCall --------------------");
		member_no=((MemberVO)session.getAttribute("loginMember")).getMember_no();
		log.info("memberNo : "+member_no);
		log.info("page : "+page);
		log.info("viewPageNum : "+viewPageNum);
		log.info("searchType : "+searchType);
		log.info("searchInfo : "+searchInfo);
		log.info("----------------- end refListCall --------------------");
		return apprService.refListCall(member_no, page, viewPageNum, searchType, searchInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
