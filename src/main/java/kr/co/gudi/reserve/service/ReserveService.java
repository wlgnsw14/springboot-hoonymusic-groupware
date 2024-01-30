package kr.co.gudi.reserve.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.member.vo.MemberVO;
import kr.co.gudi.reserve.dao.ReserveDAO;
import kr.co.gudi.reserve.dto.ReserveDTO;
import kr.co.gudi.resource.dto.CopyrightDTO;

@Service
public class ReserveService {
	@Autowired ReserveDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public void reserveget(HashMap<String, String> data) {
		
		if(data.get("rv").equals("공연장")) {
		data.put("title", "공연장");
		}else {
			data.put("title", "회의장");
		}
		
		dao.reserveget(data);
		
	}

	public Map<String, Object> reservnogetlist(String page,String pagePerNum, HttpSession session) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		String myno = String.valueOf(member_no);
		
		logger.info("세션값 : "+myno);
		int offset = 0;
		int p =Integer.parseInt(page);
		logger.info("page : "+p);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.reservnogetlist(offset,myno);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		float max = dao.reservnomaxpage(Integer.parseInt(pagePerNum),myno);
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
	
	
	public Map<String, Object> reservlist(String page,String pagePerNum, HttpSession session) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		String myno = String.valueOf(member_no);
		logger.info("세션값 : "+member_no);
		int offset = 0;
		int p =Integer.parseInt(page);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.reservlist(offset,myno);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		int max = dao.reservmaxpage(Integer.parseInt(pagePerNum),myno);
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

	public ArrayList<ReserveDTO> reservdetail(String res_no) {
		return dao.reservdetail(Integer.parseInt(res_no));
	}

	public Map<String, Object> reservAdmin(String page,String pagePerNum, HttpSession session) {
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

		logger.info("pagePerNum"+pagePerNum);
		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		String myno = String.valueOf(member_no);
		logger.info("세션값 : "+member_no);
		int offset = 0;
		int p =Integer.parseInt(page);
		logger.info("page : "+p);
		offset = (int) (Integer.parseInt(pagePerNum)*(p-1));
		ArrayList<CopyrightDTO> list = dao.reservAdmin(offset,myno);
		logger.info("list : "+list);
		//만들수 있는 총 페이지수
		logger.info("filter : "+Integer.parseInt(pagePerNum));
		
		float max = dao.reservAdminmaxpage(Integer.parseInt(pagePerNum),myno);
		
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

	public void reservOk(String res_no, HttpSession session) {
		
		String member_name = ((MemberVO)session.getAttribute("loginMember")).getName();
		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		
		dao.reservOk(Integer.parseInt(res_no));
		dao.reservOk_his(Integer.parseInt(res_no),member_name,member_no);
	}

	public void reservNo(String res_no, String res_content, HttpSession session) {
		
		String member_name = ((MemberVO)session.getAttribute("loginMember")).getName();
		int member_no = ((MemberVO)session.getAttribute("loginMember")).getMember_no();
		
		dao.reservNo(Integer.parseInt(res_no));
		dao.reservNo_his(Integer.parseInt(res_no),res_content,member_name,member_no);
		
	}

}
