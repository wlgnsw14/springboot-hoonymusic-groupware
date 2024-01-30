package kr.co.gudi.artist.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.artist.service.ArtistService;

@RestController
public class ArtistController {
	@Autowired ArtistService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value = "/artist")
	public ModelAndView artist() {
		
		ModelAndView mav = new ModelAndView("artist/artist");
		
		return mav;
	}
	
	@GetMapping(value = "/artistget")
	public ModelAndView artistget(@RequestParam HashMap<String, String> data) {
		logger.info("data : "+data);
		ModelAndView mav = new ModelAndView("redirect:/artist");
		logger.info("name : "+data.get("name"));
		logger.info("agency : "+data.get("agency"));
		
		service.artistget(data);
		
		return mav; 
	}
	
	@PostMapping(value = "/artistlist")
	public Map<String, Object> artistlist(@RequestParam String pagePerNum,@RequestParam String page,@RequestParam String search,@RequestParam String searchtag){
		logger.info("search"+search+"/"+"pagePerNum"+pagePerNum+"page"+page);
		
		if(search.equals("")) {
			logger.info("검색어 없음");
		}else {
			logger.info("검색어 있음");
			if(searchtag.equals("cr")) {
				logger.info("저작권번호");
			}else {
				logger.info("아티스트명");
			}
		}
		Map<String, Object> data = service.artistlist(page,pagePerNum,search,searchtag);
		logger.info("data : "+data);
		
		return data;
	}
	
	@GetMapping(value = "/artistdetail")
	public ModelAndView resourceCopyrightdetail(@RequestParam String num, @RequestParam String name, @RequestParam String agency) {
		
		logger.info("num : "+ num+" / name : "+name+" / agency : "+agency);
		
		ModelAndView mav = new ModelAndView("artist/artist_detail");
		mav.addObject("name",name);
		mav.addObject("num",num);
		mav.addObject("agency",agency);
		return mav;
	}
	
	@PostMapping(value = "/artistdetail_1")
	public Map<String, Object> artistdetail_1(@RequestParam HashMap<String, String>data) {
		
		logger.info("data : "+data);
		
		return service.artistdetail_1(data);
	}
	@PostMapping(value = "/artistdetail_2")
	public Map<String, Object> artistdetail_2(@RequestParam HashMap<String, String>data) {
		
		logger.info("data : "+data);
		
		return service.artistdetail_2(data);
	}
	
	
	
	@GetMapping(value = "/artistdelete")
	public ModelAndView artistdelete(@RequestParam String art_no) {
		
		logger.info("art_no : "+art_no);
		service.artistdelete(art_no);
		ModelAndView mav = new ModelAndView("redirect:/artist");
		
		return mav;
	}
	
	

}
