package kr.co.gudi.archive.service;

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
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.archive.dao.ArchiveDAO;
import kr.co.gudi.archive.dto.ArchiveDTO;

@Service
public class ArchiveService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ArchiveDAO dao;
	Map<String, Object> map = new HashMap<String, Object>();
	@Value("${spring.servlet.multipart.location}") private String root;

	// 전사, 부서 리스트 출력 (검색 리스트)
	public Map<String, Object> archAllList(String page, String member_no, String state, String a_name) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 20;
		String departName = dao.getDepartName(member_no);
		int pages = dao.totalPage();
		
		ArrayList<ArchiveDTO> list = new ArrayList<ArchiveDTO>();
		// 전사 리스트 출력 (초기값)
		list = dao.archAllList(offset,a_name);
		// 부서 리스트 출력 
		if(state.equals("부서")) {
			list = dao.archDepartList(offset, departName, a_name);
			pages = dao.totalDepartPage(departName);
		}
		
		map.put("list", list);
		map.put("pages", pages);
		// 전체 페이지가 p 값보다 작을 때 
		if (p > pages) {
			p = pages;
		}
		
		map.put("currPage", p);

		return map;
	}

	// 부서 파일 업로드 
	public void departFileUpload(MultipartFile[] files, String member_no) 
				throws Exception {
		// archive 테이블 저장 (dto에 저장하지 않으면 keyColumn, keyProperty를 못 찾음)
		ArchiveDTO dto = new ArchiveDTO();
		String departName = dao.getDepartName(member_no);
		int memberNo = Integer.parseInt(member_no);
		dto.setMember_no(memberNo);
		dto.setArch_depart(departName);
		dao.saveDepartArchive(dto);
		
		// 방금 저장된 arch_no 가져오기
		int arch_no = dto.getArch_no();
		// file 테이블 저장 메서드 실행
		if(arch_no>0) {
			saveDepartFile(files, arch_no);
		}
	}
	
	// 전사 파일 업로드 
	public void allFileUpload(MultipartFile[] files, String member_no) throws Exception {
		// archive 테이블 저장 (dto에 저장하지 않으면 keyColumn, keyProperty를 못 찾음)
		ArchiveDTO dto = new ArchiveDTO();
		int memberNo = Integer.parseInt(member_no);
		dto.setMember_no(memberNo);
		dto.setArch_depart("전사");
		dao.saveDepartArchive(dto);
		
		// 방금 저장된 arch_no 가져오기
		int arch_no = dto.getArch_no();
		// file 테이블 저장 메서드 실행
		if(arch_no>0) {
			saveDepartFile(files, arch_no);
		}
	}	
	
	// file 테이블 저장 메서드
	private void saveDepartFile(MultipartFile[] files, int arch_no) 
				throws Exception {
		for (MultipartFile file : files) {
			String oriFileName = file.getOriginalFilename();
			
			if (!oriFileName.equals("")) {
				// 1. 파일이름 변경
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis()+ext;
				
				// 2. 파일을 경로에 저장
				byte[] arr = file.getBytes();
				Path path = Paths.get(root+newFileName);
				Files.write(path, arr);
				
				// 3. 파일 사이즈 가져오기
				long sizeInKB = Math.round(file.getSize()/1024.0);
				String size = Long.toString(sizeInKB);
				//3. 기존 파일명, 새로운 파일명, 파일 사이즈, alb_no 를 file 테이블에 추가
				dao.departFileUpload(oriFileName, newFileName, arch_no, size);
			}
		}	
	}

	public Map<String, Object> archiveDel(ArrayList<String> delList, 
			ArrayList<String> names, String member_name, Model model) {
		// 체크한 파일을 클릭한 사람이 작성자인지 확인
		int count = 0;
		for(String name : names) {
			if(!name.equals(member_name)) {
				count++;
				logger.info("count=="+count);
				break;
			}
		}
		map.put("msg", "작성자만 삭제 가능합니다.");
		
		// 작성자가 맞으면 삭제 
		int cnt = 0;
		if(count==0) {
			for(String arch_no : delList) {
				cnt+= dao.archiveDel(arch_no);
				logger.info("cnt == "+cnt);
			}
		}
		
		map.put("del_cnt", cnt);
		return map;
	}




	
}
