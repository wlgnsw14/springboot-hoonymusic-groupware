package kr.co.gudi.performance.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.performance.service.SongService;

@Controller
public class SongController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@Autowired SongService service;
	
	@GetMapping("/song")
	public String song() {
		return "/song/song";
	}
	
	@GetMapping("/song/list")
	@ResponseBody
	public Map<String, Object> songList(String search_info, String page){
		return service.songList(search_info, page);
	}
	
	@GetMapping("/song/list/detail")
	public ModelAndView songDetail(String song_no) {
		return service.songDetail(song_no);
	}
	
	@GetMapping("/songSearch")
	@ResponseBody
	public Map<String, Object> songSearch(String search_info, String page){
		return service.songList(search_info, page);
	}
	
	@GetMapping("/songPerform")
	public String songPerform() {
		return "/song/songPerform";
	}
	
	@GetMapping("/songPerform/list")
	@ResponseBody
	public Map<String, Object> songPerform(String search_info, String page){
		return service.songList(search_info, page);
	}
	
	// 파일 업로드(return 값은 결재 페이지로 수정시 변경하기)
	@PostMapping("/songFile.do")
	public String songFile(MultipartFile[] files, int song_no) throws Exception {
		service.fileUpload(files, song_no);
		return "redirect:/songDetail";
	}
}
