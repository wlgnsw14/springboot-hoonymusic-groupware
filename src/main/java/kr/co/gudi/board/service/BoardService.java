package kr.co.gudi.board.service;

import java.io.File;
import java.io.IOException;
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

import kr.co.gudi.board.dao.BoardDAO;
import kr.co.gudi.board.dto.BoardDTO;

@Service
public class BoardService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${spring.servlet.multipart.location}") private String root;
	@Autowired BoardDAO dao;
	/*
	public ArrayList<BoardDTO> list() {
		logger.info("service list 함수");
		return dao.list();
	}
	*/
	
	public Map<String, Object> list(String page,String board_name, int member_no) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		int pages = dao.totalPage(member_no); 
		if(board_name!=null) {
			list = dao.boardSearch(board_name,offset,member_no);			
			logger.info("board_name != null");
		}else {
			list = dao.list(offset,member_no);	
			logger.info("board_name == null");
		}
	
		
		logger.info("만들 수 있는 총 페이지 갯수 : "+pages);
		 
		if(p>=pages) { 
			 p = pages; 
		} 
		  
		map.put("currPage", p);
		
		map.put("pages", pages); //만들 수 있는 총 페이지 수
		map.put("list", list);	
		return map;
	}


	public Map<String, Object> listD(String page, String board_name, int member_no) {
		int p = Integer.parseInt(page);
		int offset = (p - 1) * 10;
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDTO> listD = new ArrayList<BoardDTO>();

		if(board_name!=null) {
			listD = dao.boardSearchD(board_name,offset,member_no);			
			logger.info("Dboard_name != null");
		}else {
			listD = dao.listD(offset,member_no);	
			logger.info("Dboard_name == null");
		}
		
		int pages = dao.totalPageD(); 
		logger.info("만들 수 있는 총 페이지 갯수 : "+pages);
		
		if(p>=pages) { 
			 p = pages; 
		} 
		  
		map.put("currPage", p);
		
		map.put("pages", pages); //만들 수 있는 총 페이지 수
		map.put("listD", listD);	
		return map;
	}


	public String write(BoardDTO dto, MultipartFile[] photos) throws Exception {
		logger.info("service write 함수");
		
		dao.write(dto);
		
		logger.info("board_no>0인지 체크중");
		int board_no = dto.getBoard_no();
		logger.info("board_no : " + dto.getBoard_no());
		if (board_no > 0) {
			logger.info("saveFile 함수 실행");
			
	        saveFile(board_no, photos);
	        
	        return "success";
	    } else {
	        return "failure"; // 작업이 실패했을 경우 failure 반환 또는 예외를 던짐
	    }
	}


	public String writeD(BoardDTO dto, MultipartFile[] photos) throws Exception {
		logger.info("service writeD 함수");
		
		dao.writeD(dto);
		
		logger.info("Dboard_no>0인지 체크중");
		int board_no = dto.getBoard_no();
		logger.info("Dboard_no : " + dto.getBoard_no());
		if (board_no > 0) {
			logger.info("saveFileD 함수 실행");
			
	        saveFile(board_no, photos);
	        
	        return "success";
	    } else {
	        return "failure"; // 작업이 실패했을 경우 failure 반환 또는 예외를 던짐
	    }
	}
	
	private void saveFile(int board_no, MultipartFile[] photos) {
	    for(MultipartFile file : photos) {
	        try {
	            if(!file.isEmpty()) {
	                String file_oriname = file.getOriginalFilename();
	                
	                // 파일 확장자
	                String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
	                String file_newname = System.currentTimeMillis()+ext;
	                
	                // 파일 사이즈
	                long fileSize = file.getSize()/1024; 
	                
	                if(fileSize > 0) {
	                	// 파일 저장
	                	byte[] arr = file.getBytes();
	                	Path path = Paths.get(root+file_newname);
	                	Files.write(path, arr);
	                	
	                	// 파일 저장이 성공한 경우에만 데이터베이스에 추가
	                	dao.writePhoto(board_no, file_oriname, file_newname, fileSize);
	                	
	                }else {
	                	logger.info("파일 저장 실패");
	                }
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	

	public void detail(String board_no, Model model) {
		logger.info("Detail Method");
		dao.bHit(board_no); 
		
		BoardDTO board = dao.detail(board_no); // 상세 글보기
		ArrayList<BoardDTO> photos = dao.getPhoto(board_no); // 사진
		model.addAttribute("board", board);
		model.addAttribute("photos", photos);
		
	}

	public void del(String board_no) {
		logger.info("board_no : " + board_no);
		// board_no에 해당하는 이미지 가져옴
		ArrayList<BoardDTO> photos = dao.getPhoto(board_no);
		logger.info("지워야 할 파일 : "+photos);
		// board_no에 해당하는 글 삭제 -> ON DELETE CASCADE로 photo삭제
		
		int row = dao.del(board_no);
		
		if(row>0){
			// 가져온 이미지의 이름으로 이미지 삭제
			for(BoardDTO dto : photos) {
				File file = new File(root+dto.getFile_newname());
				if(file.exists()) {
					logger.info(dto.getFile_newname()+" 삭제 결과 : "+file.delete());
				}
			}
		}
	}

	public BoardDTO boardModify(String board_no) {
		return dao.detail(board_no);
	}
	
	public void modify(String board_no, HashMap<String, String> params, MultipartFile file) {
		params.put("board_no", board_no);
		dao.modify(params);
		
		
		
		if(!file.isEmpty()) {
			
			logger.info("modify 이미지 : "+file);
			
			String file_oriname = file.getOriginalFilename();
			String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
			String file_newname = System.currentTimeMillis()+ext;
			String file_location = "b";
			
			try {
				byte[] bytes = file.getBytes();
				double fileSize = bytes.length/1024;
				int size = (int) fileSize;
				logger.info("이미지 크기 : "+fileSize+"KB");
				Path path = Paths.get(root+"/"+file_newname);
				Files.write(path, bytes);
				
				dao.modifyImage(file_location,board_no, file_oriname, file_newname, size);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public BoardDTO boardModifyD(String board_no) {
		return dao.detail(board_no);
	}

	public void modifyD(String board_no, HashMap<String, String> params, MultipartFile file) {
		params.put("board_no", board_no);
		dao.modifyD(params);
		
		if(!file.isEmpty()) {
			
			logger.info("modifyD 이미지 : "+file);
			
			String file_oriname = file.getOriginalFilename();
			String ext = file_oriname.substring(file_oriname.lastIndexOf("."));
			String file_newname = System.currentTimeMillis()+ext;
			String file_location = "b";
			
			try {
				byte[] bytes = file.getBytes();
				double fileSize = bytes.length/1024;
				int size = (int) fileSize;
				logger.info("이미지 크기 : "+fileSize+"KB");
				Path path = Paths.get(root+"/"+file_newname);
				Files.write(path, bytes);
				
				dao.modifyImage(file_location,board_no, file_oriname, file_newname, size);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


	public void detailD(String board_no, Model model) {
		logger.info("D Detail Method");
		dao.bHit(board_no); 
		
		BoardDTO board = dao.detailD(board_no); // 상세 글보기
		ArrayList<BoardDTO> photos = dao.getPhoto(board_no); // 사진
		model.addAttribute("board", board);
		model.addAttribute("photos", photos);
		
	}


	public void delD(String board_no) {
		logger.info("board_no : " + board_no);
		// board_no에 해당하는 이미지 가져옴
		ArrayList<BoardDTO> photos = dao.getPhoto(board_no);
		logger.info("지워야 할 파일 : "+photos);
		// board_no에 해당하는 글 삭제 -> ON DELETE CASCADE로 photo삭제
		
		int row = dao.delD(board_no);
		
		if(row>0){
			// 가져온 이미지의 이름으로 이미지 삭제
			for(BoardDTO dto : photos) {
				File file = new File(root+dto.getFile_newname());
				if(file.exists()) {
					logger.info(dto.getFile_newname()+" 삭제 결과 : "+file.delete());
				}
			}
		}
	}
}
