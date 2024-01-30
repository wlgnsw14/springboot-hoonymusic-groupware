package kr.co.gudi.performance.service;

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

import kr.co.gudi.performance.dao.SongDAO;
import kr.co.gudi.performance.dto.SongDTO;

@Service
public class SongService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired SongDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public Map<String, Object> songList(String search_info, String page) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		
		ArrayList<SongDTO> list = dao.list(search_info, offset);
		
		map.put("list", list);
		
		int totalCnt = dao.totalCnt(search_info);
		int pages = (int) Math.ceil((double) totalCnt / 10);
		
		map.put("pages", pages);
		
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		
		return map;
	}
	

	public ModelAndView songDetail(String song_no) {
		ModelAndView mav = new ModelAndView();
		logger.info("song_no : "+ song_no);
		SongDTO dto = dao.songDetail(song_no);
		mav.addObject("songDetail", dto);
		// root 경로에 있는 파일 정보 가져오기
		ArrayList<SongDTO> fileList = dao.getFile(song_no);
		mav.addObject("list", fileList);
		mav.setViewName("/song/songDetail");
		return mav;
	}
	
	public void fileUpload(MultipartFile[] files, int song_no) throws IOException {
		for (MultipartFile file : files) {
			String oriFileName = file.getOriginalFilename();
			
			if (!oriFileName.equals("")) {
				// 1.파일이름 변경
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis()+ext;
				
				// 2.파일을 경로에 저장
				byte[] arr = file.getBytes();
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				
				// 3. 파일 사이즈 가져오기
				long sizeInKB = Math.round(file.getSize() / 1024.0);
				String size = Long.toString(sizeInKB);
				// 4. 기존 파일명, 새로운 파일명, 파일 사이즈, song_no 를 file 테이블에 추가
				dao.fileUpload(song_no, oriFileName, newFileName, size);
			}
		}
	}
}
