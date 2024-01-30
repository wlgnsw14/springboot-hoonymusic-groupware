package kr.co.gudi.artist.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.artist.dao.ArtistDAO;
import kr.co.gudi.member.dto.MemberDTO;
import kr.co.gudi.resource.dto.CopyrightDTO;

@Service
public class ArtistService {
	@Autowired ArtistDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public Map<String, Object> artistlist(String page,String pagePerNum, String search, String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.artistlist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.artmaxpage(Integer.parseInt(pagePerNum),search,searchtag);
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max+1) {
			
			p = max;
		}
		
		map.put("currPage", p);
		
		map.put("pages", max+1);
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
		}

	public void artistget(HashMap<String, String> data) {
		
		dao.artistget(data);
		
	}

	public void artistdelete(String art_no) {
		
		dao.artistdelete(art_no);
		
	}

	public Map<String, Object> artistdetail_1(HashMap<String, String>data) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자


		
		int offset = 0;
		int p =Integer.parseInt(data.get("page"));
		offset = (int) (Integer.parseInt(data.get("pagePerNum"))*(p-1));
		ArrayList<CopyrightDTO> list = dao.artistdetail_1(offset,Integer.parseInt(data.get("num")));
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(data.get("pagePerNum")));
		float max = dao.artistmaxpage_1(Integer.parseInt(data.get("pagePerNum")),Integer.parseInt(data.get("num")));
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max+1) {
			
			p = (int) max;
		}
		
		map.put("currPage", p);
		int rm;
		if(max>(int)max) {
			rm = (int) (max+1);
			logger.info("1보다 크면 : "+rm);
			map.put("pages", rm);
		}else {
			rm = (int) (max);
			logger.info("1보다 작으면 : "+rm);
			map.put("pages", rm);
		}
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
		}
	
	public Map<String, Object> artistdetail_2(HashMap<String, String>data) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자


		
		int offset = 0;
		int p =Integer.parseInt(data.get("page"));
		offset = (int) (Integer.parseInt(data.get("pagePerNum"))*(p-1));
		ArrayList<CopyrightDTO> list = dao.artistdetail_2(offset,Integer.parseInt(data.get("num")));
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		
		
		
		logger.info("filter : "+Integer.parseInt(data.get("pagePerNum")));
		float max = dao.artistmaxpage_2(Integer.parseInt(data.get("pagePerNum")),Integer.parseInt(data.get("num")));
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max+1) {
			
			p = (int) max;
		}
		
		map.put("currPage", p);
		int rm;
		if(max>(int)max) {
			rm = (int) (max+1);
			logger.info("1보다 크면 : "+rm);
			map.put("pages", rm);
		}else {
			rm = (int) (max);
			logger.info("1보다 작으면 : "+rm);
			map.put("pages", rm);
		}
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
		}

}
