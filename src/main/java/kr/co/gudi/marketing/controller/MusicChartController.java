package kr.co.gudi.marketing.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.marketing.service.MusicChartService;

@Controller
public class MusicChartController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MusicChartService service;
	
	@GetMapping(value="/musicChart")
	public String musicChart(Model model) throws Exception {
		service.getDatetime(model);
		return "musicChart/musicChart";
	}
	
	@GetMapping(value="/musicChartCall")
	@ResponseBody
	public List<HashMap<String, Object>> musicChartCall() throws IOException {
		return service.getChart();
	}
	
	@PostMapping(value="/musicArtistCall")
	@ResponseBody
	public List<String> musicArtistCall(@RequestBody Map<String, List<String>> jsonData){
		List<String> artNameArray = jsonData.get("artNameArray");
		logger.info("Received artist names: {}", artNameArray);
		
		return service.musicArtistCall(artNameArray);
	}
	
}
