package kr.co.alto.board.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.board.dao.BoardDAO;
import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.service.BoardService;
import kr.co.alto.board.service.BoardServiceImpl;
import kr.co.alto.member.dto.MemberDTO;

@Controller
public class BoardControllerImpl implements BoardController {
	
	//이미지 저장위치
	private static String ARTICLE_IMAGE_REPO = "C:\\workspace-spring\\imageRepo";
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardDTO boardDTO;
	
	@Override
	@RequestMapping(value = "/club_notice/Noticelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Noticelist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		List<BoardDTO> boardList = boardService.Noticelist();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("boardList", boardList);
		return mav;
	}
	
	@RequestMapping(value = "/club_notice/*registration.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registration(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/club_notice/addNewNotice.do", method = RequestMethod.POST)
	public ResponseEntity addNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		String noticeFileName = null;
		
		Map noticeMap = new HashMap();
		Enumeration enun = multipartRequest.getParameterNames();
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			noticeMap.put(name, value);
		}
		
		//업로드한 이미지 파일 이름을 가져옴
		List<String> file2List = upload(multipartRequest);
		
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		if (file2List != null && file2List.size() != 0) {
			for(String fileName : file2List) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNoticeFileName(noticeFileName);
				fileList.add(fileDTO);
			}
			noticeMap.put("fileList", fileList);
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		
		try {
			int notice_num = boardService.addNewNotice(noticeMap);
			if (fileList != null && fileList.size() != 0) {
				for (FileDTO fileDTO : fileList) {
					noticeFileName = fileDTO.getNoticeFileName();
					File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ noticeFileName);
					File destFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num);
					FileUtils.moveFileToDirectory(srcFile, destFile, true);
				}
			}
			
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_notice/Noticelist.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				for (FileDTO fileDTO : fileList) {
					noticeFileName = fileDTO.getNoticeFileName();
					File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ noticeFileName);
					srcFile.delete();
				}
			}
			
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_notice/Noticeregistration.do';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
		List<String> file2List = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename();
			
			if(originalFilename != "" && originalFilename != null) {
				file2List.add(originalFilename);
				File file = new File(ARTICLE_IMAGE_REPO + "\\" +fileName);
				if (mFile.getSize() != 0) {
					if(!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ originalFilename));
					}
				}
			}
		}
		return file2List;
	}
	
}