package kr.co.gudi.marketing.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.gudi.marketing.dao.MusicChartDAO;

@Service
public class MusicChartService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MusicChartDAO dao;

	
	// url 에 page 라는 parameter 추가해서 document 객체에 저장
	String url = "https://www.melon.com/chart/index.htm";	
	//Document 에는 페이지의 전체 소스가 저장된다
	Document doc = null;
			
	// 날짜/시간 크롤링 
	public void getDatetime(Model model) throws IOException{
		doc = Jsoup.connect(url).get();
		Elements timeDate = doc.select("div.multi_row"); 
		model.addAttribute("time", timeDate.select("span.hour").html());
		model.addAttribute("date", timeDate.select("span.year").html());
	}
	
	// 음원 차트 크롤링 
	public List<HashMap<String, Object>> getChart() throws IOException{
		doc = Jsoup.connect(url).get();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();		
		HashMap<String, Object> map = null;
		
		// table 에서 원하는 데이터 가져오기
		//Elements el = doc.select("table"); 
		//Element elem = el.get(0);
		//Elements elem2 = elem.select("tbody tr.lst50, tbody tr.lst100");
		Elements elem = doc.select("tbody tr.lst50, tbody tr.lst100");		
		
        for(Element chartList : elem) {
			// 반복할 때마다 새로운 hashmap 이 생성됨  
			map = new HashMap<String, Object>();
			
			// 순위 출력 
	        map.put("rank", chartList.select("span.rank").html());
	        
	        // 앨범 이미지 src 출력 
	        map.put("imgSrc", chartList.select("a.image_typeAll img").attr("src"));
	        
	        // 이미지 a 태그 href 에서 숫자만 출력 (앨범 번호) 
	        Elements albHref = chartList.select("a.image_typeAll");
	        String[] albNumber = albHref.attr("href").split("\\D+");
	        String albNo = "";
	        for (String no : albNumber) {
                if (!no.isEmpty()) {
                	albNo += no;
                }
            }
	        map.put("albNo", albNo); 
	        
	        // 곡명 가져오기 ellipsis rank01
	        map.put("songName", chartList.select("div.ellipsis.rank01 a").html());
	        
	        // 아티스트 가져오기 ellipsis rank02
	        map.put("artName", chartList.select("div.ellipsis.rank02 span").html());
	        
	        // 앨범명 가져오기 ellipsis rank03
	        map.put("albName", chartList.select("div.ellipsis.rank03 a").html());
	        
	        list.add(map);
	   
        }
        
		return list;
	}

		
	// 소속 아티스트 이름 확인 List<String> artNameArray
	public List<String> musicArtistCall() throws IOException {
		doc =  Jsoup.connect(url).get();
		// 아티스트명을 배열로 담아서 소속 아티스트 검색하기 
		Elements artArray = doc.select("div.ellipsis.rank02 span a");
		List<String> stringArray = new ArrayList<String>();
		for(Element array : artArray) {
			stringArray.add(array.html());
		}
		logger.info("array ===" + stringArray);
			
		return dao.musicArtistCall(stringArray);
	}
	
}
