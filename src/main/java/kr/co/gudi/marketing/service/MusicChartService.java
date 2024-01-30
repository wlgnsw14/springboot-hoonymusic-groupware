package kr.co.gudi.marketing.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gudi.marketing.dao.MusicChartDAO;

@Service
public class MusicChartService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MusicChartDAO dao;
	
	// url 에 page 라는 parameter 추가해서 document 객체에 저장
	String url = "https://www.melon.com/chart/index.htm";	

	// 날짜/시간 크롤링 
	public void getDatetime(Model model) throws Exception {
		Document doc = Jsoup.connect(url).get();
		
		Elements timeDate = doc.select("div.multi_row"); 
		Element timeDate2 = timeDate.get(0);
		model.addAttribute("time", timeDate2.select("span.hour").html());
		model.addAttribute("date", timeDate2.select("span.year").html());
	}
	
	// 음원 차트 크롤링 
	public List<HashMap<String, Object>> getChart() throws IOException {
		Document doc = Jsoup.connect(url).get();
		//ModelAndView mav = new ModelAndView("musicChart/musicChart");
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();		
		HashMap<String, Object> map = null;
		
		// table 데이터 가져오기
		Elements el = doc.select("table"); 
		Element elem = el.get(0);
		Elements elem2 = elem.select("tbody tr.lst50, tbody tr.lst100");
		
        for(Element chartList : elem2) {
			// 반복할 때마다 새로운 hashmap 이 생성됨  
			map = new HashMap<String, Object>();
			
			// 순위 출력 
	        map.put("rank", chartList.select("span.rank").html());
	        
	        // 앨범 이미지 src 출력 
	        map.put("imgSrc", chartList.select("a.image_typeAll img").attr("src"));
	        
	        // 이미지 a 태그 href 에서 숫자만 출력 (앨범 번호) 
	        Elements albHref = chartList.select("a.image_typeAll");
	        String albNo="";
	        for(Element href : albHref) {
	        	String[] numList = href.attr("href").split("\\D+");
	            // 분할된 문자열에서 숫자 부분을 연결
	            for (String num : numList) {
	                if (!num.isEmpty()) {
	                	albNo += num;
	                }
	            }
	        }
	        map.put("albNo", albNo); 
	        
	        // 곡명 가져오기 ellipsis rank01
	        map.put("songName", chartList.select("div.ellipsis.rank01 a").html());
	        
	        // 아티스트 가져오기 ellipsis rank02
	        map.put("artName", chartList.select("div.ellipsis.rank02 span a").html());
	        
	        // 앨범명 가져오기 ellipsis rank03
	        map.put("albName", chartList.select("div.ellipsis.rank03 a").html());
	        
	        //map.put("albNo", albNo);
	        list.add(map);
	        
        }
        //logger.info("list === "+list);
        //mav.addObject("list", list);
        
		return list;
	}

		
	// 소속 아티스트 이름 확인 
	public List<String> musicArtistCall(List<String> artNameArray) {
		return dao.musicArtistCall(artNameArray);
	}
	
}
