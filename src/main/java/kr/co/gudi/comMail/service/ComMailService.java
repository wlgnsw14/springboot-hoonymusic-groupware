package kr.co.gudi.comMail.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.archive.dto.ArchiveDTO;
import kr.co.gudi.comMail.dao.ComMailDAO;
import kr.co.gudi.comMail.dto.ComMailDTO;

@Service
public class ComMailService {
	@Autowired ComMailDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public int getReTotalMail(int member_no) {
		return dao.getReTotalMail(member_no);
	}

	public int getReUnreadMail(int member_no) {
		return dao.getReUnreadMail(member_no);
	}

	
	public Map<String, Object> receiveList(String search_info, String page, int loginNo, String readOption) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<ComMailDTO>();
		
		if (readOption.equals("all")) {
			if (search_info == null || search_info.trim().isEmpty()) {
	            // 검색어가 없는 경우 전체 메일 목록을 가져옴
	            list = dao.receiveList(offset, loginNo);
	        } else {
	            // 검색어가 있는 경우 검색 결과를 가져옴
	            list = dao.receiveListSearch(search_info, offset, loginNo);
	        }
		}else if(readOption.equals("read")) {
			list = dao.receiveListRead(search_info, offset, loginNo);
		}else if(readOption.equals("unread")) {
			list = dao.receiveListUnread(search_info, offset, loginNo);
		}
		
		map.put("list", list);
		
		int reTotalCnt = dao.reTotalCnt(search_info, loginNo, readOption);
		int pages = (int) Math.ceil((double) reTotalCnt / 10);
		
		// 현재 페이지가 전체 페이지 수보다 크다면 마지막 페이지로 설정
	    if (p > pages && pages > 0) {
	        p = pages;
	        offset = (p - 1) * 10; // 오프셋 값도 재계산
	        list = dao.receiveList(offset, loginNo); // 마지막 페이지 데이터로 재조회
	        map.put("list", list); // 재조회한 데이터를 다시 설정
	    }
		map.put("pages", pages);
		
		map.put("currPage", p);
		map.put("search_info", search_info);
		map.put("readOption", readOption);
		
		return map;
	}

	public void delReceive(ArrayList<String> delList) {
		for (String idx : delList) {
			dao.delReceive(idx);
		}
	}

	public ModelAndView receiveMailDetail(String note_no) {
		updateReState(note_no);
		ModelAndView mav = new ModelAndView();
		ComMailDTO dto = dao.receiveMailDetail(note_no);
		mav.addObject("reMailDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<ComMailDTO> fileList = dao.getFile(note_no);
		mav.addObject("list", fileList);
		mav.setViewName("/comMail/comMailReDetail");
		return mav;
	}

	private void updateReState(String note_no) {
		dao.updateReState(note_no);
	}

	public int getSeTotalMail(int member_no) {
		return dao.getSeTotalMail(member_no);
	}
	
	public int getSeUnreadMail(int member_no) {
		return dao.getSeUnreadMail(member_no);
	}
	
	public Map<String, Object> sendList(String search_info, String page, int loginNo, String readOption) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<ComMailDTO> list = new ArrayList<ComMailDTO>();
		
		if (readOption.equals("all")) {
			if (search_info == null || search_info.trim().isEmpty()) {
	            // 검색어가 없는 경우 전체 메일 목록을 가져옴
				list = dao.sendList(offset, loginNo);
	        } else {
	            // 검색어가 있는 경우 검색 결과를 가져옴
	            list = dao.sendListSearch(search_info, offset, loginNo);
	        }
			
		}else if(readOption.equals("read")) {
			list = dao.sendListRead(search_info, offset,loginNo);
		}else if(readOption.equals("unread")) {
			list = dao.sendListUnread(search_info, offset,loginNo);
		}
		
		map.put("list", list);
		
		int seTotalCnt = dao.seTotalCnt(search_info, loginNo, readOption);
		int pages = (int) Math.ceil((double) seTotalCnt / 10);
		
		
		// 현재 페이지가 전체 페이지 수보다 크다면 마지막 페이지로 설정
	    if (p > pages && pages > 0) {
	        p = pages;
	        offset = (p - 1) * 10; // 오프셋 값도 재계산
	        list = dao.sendList(offset, loginNo); // 마지막 페이지 데이터로 재조회
	        map.put("list", list); // 재조회한 데이터를 다시 설정
	    }
	    
	    map.put("pages", pages);
		map.put("currPage", p);
		map.put("search_info", search_info);
		map.put("readOption", readOption);
		
		return map;
	}
	
	public void delSend(ArrayList<String> delList) {
		for (String idx : delList) {
			dao.delSend(idx);
		}
	}
	
	public ModelAndView sendMailDetail(String note_no) {
		updateSeState(note_no);
		ModelAndView mav = new ModelAndView();
		ComMailDTO dto = dao.sendMailDetail(note_no);
		mav.addObject("seMailDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<ComMailDTO> fileList = dao.getFile(note_no);
		mav.addObject("list", fileList);
		mav.setViewName("/comMail/comMailSeDetail");
		return mav;
	}
	
	private void updateSeState(String note_no) {
		dao.updateSeState(note_no);
	}

	public void write(MultipartFile[] files, HashMap<String, String> param, int sender_no) throws IOException {
		ComMailDTO dto = new ComMailDTO();
		int receiver_no = Integer.parseInt(param.get("member_no"));
		dto.setReceiver_no(receiver_no);
		dto.setSender_no(sender_no);
		dto.setNote_subject(param.get("note_subject"));
		dto.setNote_content(param.get("note_content"));
		
		dao.upload(dto);
		
		int note_no = dto.getNote_no();
		logger.info("note_no === "+note_no);
		mailFileUpload(note_no, files);
		
	}

	private void mailFileUpload(int note_no, MultipartFile[] files) throws IOException {
		for (MultipartFile file : files) {
			String oriFileName = file.getOriginalFilename();
			
			if (!oriFileName.equals("")) {
				// 1. 파일이름 변경
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis()+ext;
				
				// 2. 파일을 경로에 저장
				byte[] arr = file.getBytes();
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				
				// 3. 파일 사이즈 가져오기
				long sizeInKB = Math.round(file.getSize()/1024.0);
				String size = Long.toString(sizeInKB);
				//3. 기존 파일명, 새로운 파일명, 파일 사이즈, alb_no 를 file 테이블에 추가
				dao.mailFileUpload(oriFileName, newFileName, note_no, size);
			}
		}	
	}

	// 메일 답장시 보낸 사람의 이름을 가져온다 
	public String getSender(String note_no) {
		return dao.getSender(note_no);
	}

	public void delSeMailDetail(String note_no) {
		dao.delSend(note_no);
	}

	public void delReMailDetail(String note_no) {
		dao.delReceive(note_no);
	}
}
