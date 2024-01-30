package kr.co.gudi.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.approval.dao.ApprovalDAO;
import kr.co.gudi.approval.dto.ApprovalDTO;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDAO apprDao;
	@Value
	("${spring.servlet.multipart.location}") private String root; // C:/upload
	
	Logger log = LoggerFactory.getLogger(getClass());

	ModelAndView mav = new ModelAndView();
	HashMap<String, Object> map = new HashMap<String, Object>();
	ArrayList<ApprovalDTO> dto = new ArrayList<ApprovalDTO>();

	// 기안서 작성 이동
	public ModelAndView draftDoc(int member_no) {
		
		// 공통 조직도 내용
		commApprOrganization();
		
		// 기안자 정보
		ApprovalDTO info = apprDao.draftsmanInfo(member_no);
		
		mav.addObject("info",info);
		mav.setViewName("approval/draftDoc");
		return mav;
	}
	
	// 휴가신청서 작성 이동
	public ModelAndView leaveApp(int member_no) {
		mav.setViewName("approval/leaveApp");
		return mav;
	}
	
	// 결재선 지정
	public HashMap<String, Object> setApprover(String[] approver, String[] observer) {
		List<ApprovalDTO> approverArr = new ArrayList<ApprovalDTO>();
		List<ApprovalDTO> observerArr = new ArrayList<ApprovalDTO>();
		
		for (String appr : approver) {
			approverArr.add(apprDao.setApprover(Integer.parseInt(appr)));
		}
		
		if(observer != null) {
			for (String obser : observer) {
				observerArr.add(apprDao.setApprover(Integer.parseInt(obser)));
			}
			map.put("observer", observerArr);
		}
		
		map.put("approver", approverArr);
		return map;
	}
	
	// 공통 조직도 내용
	public void commApprOrganization() {
		ArrayList<ApprovalDTO> departments =  apprDao.departmentsInfo();
		ArrayList<ApprovalDTO> teams = apprDao.departmentsInfo();
		ArrayList<ApprovalDTO> members = apprDao.membersInfo();
		
		mav.addObject("departments", departments);
		mav.addObject("teams", teams);
		mav.addObject("members", members);
	}
	
	// 메일함 조직도 
	public ModelAndView mailOrganization() {
		ArrayList<ApprovalDTO> departments =  apprDao.departmentsInfo();
		ArrayList<ApprovalDTO> teams = apprDao.departmentsInfo();
		ArrayList<ApprovalDTO> members = apprDao.membersInfo();
		
		mav.addObject("departments", departments);
		mav.addObject("teams", teams);
		mav.addObject("members", members);
		
		return mav;
	}
	
	
	// 결재요청
	public ModelAndView approvalWrite(HashMap<String, String> params, MultipartFile[] files, int member_no, String[] observer) {
		ApprovalDTO dto = new ApprovalDTO();
		
		// 사진 테이블에 저장할 고유키 값 가져오기 위한 셋팅
		dto.setDraftmember_no(member_no);
		int first_approver=Integer.parseInt(params.get("approver1"));
		dto.setFirst_approver(first_approver);
		dto.setApproval_title(params.get("title"));
		dto.setApproval_content(params.get("content"));
		int form_no=Integer.parseInt(params.get("form_no"));
		dto.setForm_no(form_no);
		
		// 공통 내용 추가
		apprDao.commWrite(dto);
		int approval_no = dto.getApproval_no();
		String str_no=String.valueOf(approval_no);
		params.put("approval_no", str_no);
		log.info("apprNo : "+approval_no);
		
		// 사용자가 파일을 선택하였지만 파일 크기가 0인 경우
		if (files != null && files.length > 0 && !files[0].isEmpty()) {
			for (MultipartFile file : files) {
				upload(file, approval_no);
			}
		}
		
		// 폼별 내용 추가
		log.info("formNo : "+params.get("form_no"));
		if(params.get("form_no").equals("1")) { // 기안서일 경우
			apprDao.draftWrite(params);
		}else if(params.get("form_no").equals("3")) { // 휴가신청서일 경우
			
		}
		
		// 결재자 or 참조자 추가
		if(params.get("approver1") != null) {
			apprDao.firstApprover(params);
			if(params.get("approver2") != null) {
				apprDao.secondApprover(params);
				if(params.get("approver3") != null) {
					apprDao.thirdApprover(params);
				}
			}
		}
		
		if(observer != null) {
			for (String obs : observer) {
				apprDao.observer(obs, approval_no);
			}
		}
		
		// 작성 후 이동 위치
		if(form_no == 1) {
			mav.setViewName("approval/draftBox");
		} else if(form_no == 2) {
			mav.setViewName("approval/expenseReqDetail?approval_no="+approval_no);
		} else if(form_no == 3) {
			mav.setViewName("approval/leaveAppDetail?approval_no="+approval_no);
		}
		return mav;
	}

	// 단일 파일 업로드
	private void upload(MultipartFile file, int approval_no) {
		String oriFileName = file.getOriginalFilename(); // 파일명 추출
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); // 확장자 추출
		String newFileName = System.currentTimeMillis()+ext; // 새파일명생성 + 확장자
		String file_location = "a";
		try {
			byte[] bytes = file.getBytes();
			double fileSizeInKB = bytes.length / 1024.0;
			int size=(int) fileSizeInKB;
			Path path = Paths.get(root+"/"+newFileName);
			Files.write(path, bytes);
			// 파일위치(a),해당테이블pk(member_no),오리네임,뉴네임,사이즈
			apprDao.saveFile(file_location, approval_no, oriFileName, newFileName, size);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 기안함 리스트 출력
	public HashMap<String, Object> draftListCall(int member_no, String page, String viewPageNum, String searchType, String searchInfo) {
		int vpn = Integer.parseInt(viewPageNum);
		int p = Integer.parseInt(page);
		int offset = (p-1)*vpn;
		int pages = apprDao.draftTotalPage(member_no, vpn, searchType, searchInfo);
		
		dto = apprDao.draftList(member_no, vpn, offset, searchType, searchInfo);
		
		// 만약 현재 보고 있는 페이지가, 총 페이지 수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>pages) {
			p = pages;
		}
		
		map.put("currPage", p);
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", dto);
		return map;
	}

	// 결재함 리스트 출력
	public HashMap<String, Object> apprListCall(int member_no, String page, String viewPageNum, String searchType, String searchInfo) {
		int vpn = Integer.parseInt(viewPageNum);
		int p = Integer.parseInt(page);
		int offset = (p-1)*vpn;
		int pages = apprDao.apprTotalPage(member_no, vpn, searchType, searchInfo);
		
		dto = apprDao.apprList(member_no, vpn, offset, searchType, searchInfo);
		
		// 만약 현재 보고 있는 페이지가, 총 페이지 수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>pages) {
			p = pages;
		}
		
		map.put("currPage", p);
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", dto);
		return map;
	}

	// 참조함 리스트 출력
	public HashMap<String, Object> refListCall(int member_no, String page, String viewPageNum, String searchType, String searchInfo) {
		int vpn = Integer.parseInt(viewPageNum);
		int p = Integer.parseInt(page);
		int offset = (p-1)*vpn;
		int pages = apprDao.refTotalPage(member_no, vpn, searchType, searchInfo);
		
		dto = apprDao.refList(member_no, vpn, offset, searchType, searchInfo);
		
		// 만약 현재 보고 있는 페이지가, 총 페이지 수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>pages) {
			p = pages;
		}
		
		map.put("currPage", p);
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", dto);
		return map;
	}

	// 기안서 디테일 이동
	public ModelAndView draftDocDetail(int approval_no, int member_no) {
		int docAuth;
		
		ApprovalDTO info = apprDao.draftDocDetailInfo(approval_no);
		ArrayList<ApprovalDTO> fileInfo = apprDao.fileInfo(approval_no);
		ArrayList<ApprovalDTO> apprInfo = apprDao.apprInfo(approval_no);
		ArrayList<ApprovalDTO> refInfo = apprDao.refInfo(approval_no);
		
		// 결재문서의 내 권한
		if (apprDao.dratfVarification(approval_no, member_no) == 0) {
			if (apprDao.apprVarification(approval_no, member_no) == 0) {
				// 결재자 and 몇번째인지
				docAuth = apprDao.apprOrder(approval_no, member_no);
			}else {
				// 참조자
				docAuth = 4;
			}
		} else {
			// 기안자
			docAuth = 0;
		}
		log.info("docAuth : "+docAuth);
		
		mav.addObject("info",info);
		mav.addObject("fileInfo",fileInfo);
		mav.addObject("apprInfo",apprInfo);
		mav.addObject("refInfo",refInfo);
		mav.addObject("docAuth",docAuth);
		mav.setViewName("approval/draftDocDetail");
		return mav;
	}

	// 결재 승인
	public ModelAndView approve(String approveReason, int approval_no, int member_no) {
		
		// 결재자 번호 구하기
		int approverNo = apprDao.getapproverNo(member_no, approval_no);
		
		// 결재 히스토리 추가
		apprDao.commApprove(approverNo, approveReason);
		
		// 해당 결재자가 몇명인지?
		int apprCnt = apprDao.getApprCnt(approval_no);
		log.info("결재자가 몇 명? "+apprCnt);
		
		// 나는 몇번째 결재자인지?
		int myApprNum = apprDao.getMyApprNum(member_no, approval_no);
		log.info("나는 몇번째 결재자? "+myApprNum);
		
		// 해당 결재의 결재자 수보다 내 결재순서가 낮으면
		if(apprCnt > myApprNum) {
			log.info(apprCnt+">"+myApprNum);
			apprDao.apprToss(approval_no);
			
			// 해당 결재의 결재자 수랑 내 결재순서가 같으면
		} else if(apprCnt == myApprNum) {
			log.info(apprCnt+"=="+myApprNum);
			apprDao.apprFinish(approval_no);
		}
		
		mav.setViewName("approval/apprBox");
		return mav;
	}

	// 반려
	public ModelAndView apprReturn(String returnReason, int approval_no, int member_no) {

		// 결재자 번호 구하기
		int approverNo = apprDao.getapproverNo(member_no, approval_no);
		
		// 결재 히스토리 추가
		apprDao.apprReturn(approverNo, returnReason);
		apprDao.ReturnFinish(approval_no);
		
		mav.setViewName("approval/apprBox");
		return mav;
	}
	
	// 회수
	public ModelAndView withdrawl(int approval_no) {

		// 결재문서 상태 업데이트
		apprDao.withdrawl(approval_no);
		
		mav.setViewName("approval/draftBox");
		return mav;
	}

	


}
