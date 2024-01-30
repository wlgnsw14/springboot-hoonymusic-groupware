package kr.co.gudi.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.main.service.MainService;

@Controller
public class MainController {
	@Autowired MainService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/")
	public ModelAndView login() {
		
		ModelAndView mav = new ModelAndView("member/login");
		return mav;
	}
	

	@GetMapping(value="/main")
	public ModelAndView main() {
		return new ModelAndView("member/main");
	}


}
