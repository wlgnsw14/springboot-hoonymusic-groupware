package kr.co.gudi.resource.service;

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

import kr.co.gudi.resource.dao.AlbumDAO;
import kr.co.gudi.resource.dto.AlbumDTO;

@Service
public class AlbumService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlbumDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	@Value("${spring.servlet.multipart.location}") private String root;
	
	public Map<String, Object> list(String page, String a_name) {
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		
		int p = Integer.parseInt(page);
		int offset= (p - 1) * 20;
		int pages = dao.totalPage();
		
		logger.info("검색 값이 있던지 말던지 리스트 그리기!");
		list = dao.list(offset);
		
		// 검색 값이 있을 때 
		if(!a_name.isEmpty()) {
			logger.info("검색중!");
			list = dao.searchList(a_name,offset);
			pages = dao.totalSearchPage(a_name);
		} 
		
		if (p > pages) {
			p = pages;
			logger.info("검색 p=="+p);
		}
		
		map.put("pages", pages);
		map.put("list", list);
		// 전체 페이지가 p 값보다 작을 때 
		map.put("currPage", p);
		
		return map;
	}

	public ModelAndView detail(String alb_no) {
		ModelAndView mav = new ModelAndView();
		logger.info("alb_no === " + alb_no); 
		AlbumDTO dto = dao.detail(alb_no);
		mav.addObject("albumDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<AlbumDTO> fileList = dao.getFile(alb_no);
		mav.addObject("list", fileList);
		mav.setViewName("/album/albumDetail");
		
		return mav;
	}

	public Map<String, Object> chartData(String num, String optionVal) {
		ArrayList<AlbumDTO> list = dao.chartData(num, optionVal);
		map.put("list", list);
		return map;
	}

	
	// 파일 업로드 (결재 페이지로 수정시 변경하기, root 경로 확인하기)  
	public void fileUpload(MultipartFile[] files, int alb_no) throws Exception {
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
				dao.fileUpload(oriFileName, newFileName, alb_no, size);
			}
		}
	}
	
}
