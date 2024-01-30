package kr.co.gudi.resource.service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.resource.dao.CopyrightDAO;
import kr.co.gudi.resource.dto.CopyrightDTO;
import reactor.core.publisher.Mono;

@Service 
public class CopyrightService {
	@Autowired CopyrightDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private String root = "C:/upload/";
	
	public HashMap<String, Object> getList(String page, String perPage, String search) {
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniList";
		// encoding 된 키를 사용
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		
		// 특수문자가 있는 키가 url 에 포함되어 갈 떄는 특별한 처리를 해 줘야 한다.
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url);
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
				
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		
		HashMap<String, Object> resp = mono.block();
		logger.info("response="+resp);
		
		return resp;
	}
	
	

	public HashMap<String, Object> getListdetail(String page, String perPage, String search) {
		logger.info("search"+search);
		String url = "https://api.odcloud.kr/api/CpyrRegInforService/v1/getCpyrRegInforUniDetail";
		// encoding 된 키를 사용
		String serviceKey = "yoPQ5U1JaR0FD5Si6lrl319%2BD33lM1%2By71R%2Bffw4Tlcf21nIYMY0kUd48%2BADR37sfqec6JwElM3f3F5A%2BILBrw%3D%3D";
		
		// 특수문자가 있는 키가 url 에 포함되어 갈 떄는 특별한 처리를 해 줘야 한다.
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(url);
		factory.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(factory).baseUrl(url).build();
		
		Mono<HashMap> mono=client.get()
			.uri("?page="+page+"&perPage="+perPage+"&cond%5BREG_ID%3A%3AEQ%5D="+search+"&serviceKey="+serviceKey)
			.retrieve().bodyToMono(HashMap.class);
		
		HashMap<String, Object> resp = mono.block();
		logger.info("response="+resp);
		
		return resp;
	}
	

	//--------------------------등록중 저작권 목록 뿌리기 및 검색---------------------------
	public Map<String, Object> copyrightlist(String page,String pagePerNum, String search, String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightlist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.maxpage(Integer.parseInt(pagePerNum),search,searchtag);
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

	
	//--------------------------만료 및 취소중 저작권 목록 뿌리기 및 검색---------------------------
	public Map<String, Object> copyrightnolist(String page,String pagePerNum, String search, String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.copyrightnolist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.nomaxpage(Integer.parseInt(pagePerNum),search,searchtag);
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



	public Map<String, Object> detaildata(String num) {
		
		return dao.detaildata(num);
		
		
	}


	
	
	
	
	//-----------------------------------실적------------------------------------
	//실적등록
	public void resourceCopyrightregister(String no, String date, String price, String namae, HttpSession session) {
		
		String per_member = ((MemberVO)session.getAttribute("loginMember")).getName();
		
		dao.resourceCopyrightregister(no,date,Integer.parseInt(price),namae,per_member);
		
	}



	public void copyrightregister(HashMap<String, String> data, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub

		logger.info("등록 들어옴");
		//copyrightnoti(data);
		
		CopyrightDTO dto = new CopyrightDTO();
		logger.info("여기까지 0");
		dto.setCr_no(data.get("cr_no"));
		logger.info("여기까지 1");
		dto.setCr_namae(data.get("namae"));
		logger.info("여기까지 2");
		dto.setCr_name(data.get("name"));
		logger.info("여기까지 3");
		dto.setCr_price(Integer.parseInt(data.get("price")));
		logger.info("여기까지 4");
		
		//String str = data.get("cont");
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/mm/dd");
		//LocalDate localTime =LocalDate.parse(str, formatter);
		//dto.setCr_contdate(Date.valueOf(localTime));
		logger.info("cr_no"+dto.getCr_contdate());
		logger.info("여기까지 5");
		//dto.setCr_expdate(java.sql.Date.valueOf(str));
		logger.info("여기까지 6");
		dto.setCr_member(data.get("member"));
		logger.info("여기까지 7");
		dto.setMember_no(((MemberVO)session.getAttribute("loginMember")).getMember_no());
		logger.info("여기까지 end");
		logger.info("cr_no"+dto.getCr_no());
		logger.info("cr_no"+dto.getCr_namae());
		logger.info("cr_no"+dto.getCr_name());
		logger.info("cr_no"+dto.getCr_price());
		//logger.info("cr_no"+dto.getCr_expdate());
		logger.info("cr_no"+dto.getCr_member());
		logger.info("cr_no"+dto.getMember_no());
		
		
		logger.info("date : "+dto.getCr_member());
		
		
		dto.setApproval_title(data.get("title"));
		dto.setApproval_content(data.get("content"));
		
		dao.copyrightregister(dto);
		dao.apprcr(dto);
		
		logger.info("idddd : "+dto.getApproval_no());
		dao.appcon(dto);
		
		logger.info("dto : "+dto.getCr_no());
		
		
		String idx = dto.getCr_no();
		
		
		saveFile(idx, files);
		
	}
	
	
	
	private void saveFile(String idx, MultipartFile[] files) throws Exception {
		
		
		for (MultipartFile photo : files) {
			String oriFileName = photo.getOriginalFilename();
			logger.info("oriFileName : "+oriFileName);
			logger.info("oriFileName : "+idx+oriFileName);
			logger.info("idx : "+idx);

			
			if (!oriFileName.equals("")) {
				
				// 1. 파일이름 변경
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis()+ext;
				
				// 2. 파일 저장
				byte[] arr = photo.getBytes();
				logger.info("크기 : "+arr.length/1000);
				String kb = String.valueOf(arr.length/1000);
				logger.info("크기 : "+kb);
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				
				//3. 파일명, 변경된파일명, idx를 photo 테이블에 추가

				dao.writeFile(idx,oriFileName,newFileName,kb);
					

			}
		}
		
		
		
		

		
	}
	
	
	
	
	public void copyrightnoti(HashMap<String, String> data) {
		//dao.copyrightnoti(data);
	}



	public Map<String, Object> resourcecopyrightgetlist(String page, String pagePerNum, String search,
			String searchtag) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("searchtag : "+searchtag);
		
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.resourcecopyrightgetlist(search,searchtag,offset);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		logger.info("search : "+search);
		int max = dao.rclmaxpage(Integer.parseInt(pagePerNum),search,searchtag);
		logger.info("만들 수 있는 총 페이지수 : "+max);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>max+1) {
			
			p = max;
		}
		
		map.put("currPage", p);
		if(max<1) {
		map.put("pages", max+1);
		}else {
			map.put("pages", max);
		}
		logger.info("list : "+list);
		map.put("list", list);
		
		
		
		return map;
	}



	public void resourceCopyrightdelete(String cr_no, String per_price) {
		
		dao.resourceCopyrightdelete(cr_no,per_price);
		
	}


	//등록폼의 리스트뿌리기
	public Map<String, Object> depttlist() {
		
		return dao.depttlist();
	}



	public ModelAndView crd2(String approval_no, ModelAndView mav) {
		
		int appr_no = Integer.parseInt(approval_no);
		Map<String, String> map = dao.crd2(appr_no);
		map.put("approval_no", approval_no);
		logger.info(" approval_no : "+map.get("approval_no"));
		mav.addObject("data",map);
		return mav;
	}



	public void okcr(String no, String app) {
		
		dao.okcr(no);
		dao.uprp(Integer.parseInt(app));
		
	}



	public void nocr(String no, String app) {
		
		dao.nocr(no);
		dao.uprp(Integer.parseInt(app));
		
	}

	//--------------------------------------------------------------------------
}
