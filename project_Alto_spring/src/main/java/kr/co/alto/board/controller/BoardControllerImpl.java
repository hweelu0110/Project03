package kr.co.alto.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.service.BoardService;
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
	@RequestMapping(value = "/club_board/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//section값과 pageNum값을 구함
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String club_code = request.getParameter("club_code");
		
		//최초 요청시 section값과 pageNum값이 없으면 각각 1로 초기화함
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		
		Map<String , Object> pagingMap = new HashMap<>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("club_code", club_code);
				
		Map<String, Object> articlesMap = boardService.listArticles(pagingMap);
		
		articlesMap.put("section", section);
		articlesMap.put("pageNum", pageNum);
		articlesMap.put("club_code", club_code);		
		
		mav.addObject("articlesMap", articlesMap);
		
		return mav;
	}
	
	@RequestMapping(value = "/club_board/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 글추가
	@Override
	@RequestMapping(value = "/club_board/addNewArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String FileName = null;
		
		//글정보 저장하기 위한 Map 생성
		Map articleMap = new HashMap();
		Enumeration enun = multipartRequest.getParameterNames();
		
		//새글쓰기창에서 전송된 글 정보를 Map에 key/value로 저장함
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		articleMap.put("mem_id", mem_id);
				
		//업로드한 이미지 파일 이름을 가져옴
		List<String> fileList = upload(multipartRequest);
				
		List<FileDTO> FileList = new ArrayList<>();
		if (fileList != null && fileList.size() != 0) {
			// 전송되는 이미지 정보를 ImageDTO 객체의 속성에 차례대로 저장한 후 imageFileList에 다시 저장함
			for (String fileName : fileList) {				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFileName(fileName);
				FileList.add(fileDTO);
				}
				// imageFileList를 다시 articleMap에 저장함
				articleMap.put("FileList", FileList);
			}
				
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				
			String message;
			ResponseEntity resEnt = null;
				
			try {
					
				int notice_num = boardService.addNewArticle(articleMap);		//articleMap을 서비스 클래스로 전달함
				
				if (FileList != null && FileList.size() != 0) {
					//첨부한 이미지들을 for문을 이용해 업로드함
					for (FileDTO fileDTO : FileList) {
						// temp => articleNO 이미지 이동.
						FileName = fileDTO.getFileName();
						File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ FileName);
						File destFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num);
						FileUtils.moveFileToDirectory(srcFile, destFile, true);
					}
				}
					
				message = "<script>";
				message += " alert('새글을 추가했습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/club_board/listArticles.do?club_code="+articleMap.get("club_code")+"';";
				message += "</script>";
					
				// 새 글을 추가한 후 메시지를 전달함
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					
			} catch (Exception e) {
				if (FileList != null && FileList.size() != 0) {
					//오류 발생시 temp폴더의 이미지들 모두 삭제
					for (FileDTO fileDTO : FileList) {
						FileName = fileDTO.getFileName();
						File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ FileName);
						srcFile.delete();
					}
				}
					
				message = "<script>";
				message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/club_board/articleForm.do';";
				message += "</script>";			
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					
				e.printStackTrace();
			}		
					
			return resEnt;
		}	

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename();
			
			if (originalFilename != "" && originalFilename != null) {
				fileList.add(originalFilename);		//첨부한 이미지 파일의 이름들을 차례대로 저장함
				File file = new File(ARTICLE_IMAGE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		//경로에 해당하는 디렉토리들 생성
						mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ originalFilename)); //임시로
								//저장된 MultipartFile을 실제 파일로 전송
					}
				}
			}
		}
				
		return fileList;
	}

	@Override
	@RequestMapping(value = "/club_board/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		String mem_id= null;
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("notice_num", notice_num);
		viewMap.put("mem_id", mem_id);
				
		
		//Map<String, Object> articleMap = boardService.viewArticle(notice_num);		//조회할 글 정보,이미지파일 정보를 articleMap에 설정
		Map<String, Object> articleMap = boardService.viewArticle(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/club_board/modArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map<String, Object> articleMap = new HashMap<>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if (name.equals("FileNO")) {
				String[] values = multipartRequest.getParameterValues(name);
				articleMap.put(name, values);
			}
			else if (name.equals("oldFileName")) {
				String[] values = multipartRequest.getParameterValues(name);
				articleMap.put(name, values);
			}
			else {
				String value = multipartRequest.getParameter(name);
				articleMap.put(name, value);
			}
		}
		
		//수정한 이미지 파일을 업로드함
		List<String> fileList = uploadModFile(multipartRequest);
		
		//수정시 새로 추가된 이미지 수
		int added_img_num = Integer.parseInt((String)articleMap.get("added_img_num"));
		
		//기존 이미지 수
		int pre_img_num = Integer.parseInt((String)articleMap.get("pre_img_num"));
		
		List<FileDTO> FileList = new ArrayList<>();
		List<FileDTO> modAddFileList = new ArrayList<>();
		
		if (fileList != null && fileList.size() != 0) {
			String[] FileNO = (String[]) articleMap.get("FileNO");
			
			for (int i=0; i < added_img_num; i++) {
				String fileName = fileList.get(i);
				FileDTO fileDTO = new FileDTO();
				if (i < pre_img_num) {				//기존의 이미지를 수정해서 첨부한 이미지들
					fileDTO.setFileName(fileName);
					fileDTO.setFileNO(Integer.parseInt(FileNO[i]));
					FileList.add(fileDTO);
					articleMap.put("FileList", FileList);
				}
				else {								//새로 추가한 이미지들
					fileDTO.setFileName(fileName);
					modAddFileList.add(fileDTO);				
					articleMap.put("modAddFileList",modAddFileList);
				}
			}
			
		}
		
		String notice_num = (String) articleMap.get("notice_num");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		
		
		try {
			boardService.modArticle(articleMap);
			
			if (fileList != null && fileList.size() != 0) {
				for (int i=0; i<fileList.size(); i++) {
					String fileName = fileList.get(i);
					
					if (i < pre_img_num) {
						if (fileName != null) {
							File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ fileName);
							File destFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num);
							FileUtils.moveFileToDirectory(srcFile, destFile, true);
							
							String[] oldName = (String[]) articleMap.get("oldFileName");
							String oldFileName = oldName[i];
							
							File oldFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num +"\\"+ oldFileName);
							oldFile.delete();		
						}
					}
					else {
						if (fileName != null) {
							File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ fileName);
							File destFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num);
							FileUtils.moveFileToDirectory(srcFile, destFile, true);						
						}
					}
					
				}
			}
			
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_board/viewArticle.do?notice_num="+notice_num+"';";
			message += "</script>";
			
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);		
			
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				//오류 발생시 temp폴더의 이미지들 모두 삭제
				for (int i=0; i<fileList.size(); i++) {
					File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ fileList.get(i));
					srcFile.delete();
				}
			}
			
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_board/viewArticle.do?notice_num="+notice_num+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		}
		
	
		return resEnt;
	}

	private List<String> uploadModFile(MultipartHttpServletRequest multipartRequest) throws Exception, IOException {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				
				File file = new File(ARTICLE_IMAGE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		//경로에 해당하는 디렉토리들 생성
						mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+ "temp" +"\\"+ originalFileName)); //임시로
								//저장된 MultipartFile을 실제 파일로 전송
					}
				}
				
			}
			else {													//첨부한 이미지가 없었을 경우
				fileList.add(null);
			}
		}
		
		return fileList;
	}

	@Override
	@RequestMapping(value = "/club_board/removeArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(int notice_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");	
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			boardService.removeArticle(notice_num);			//글번호 전달해서 글 삭제함
			
			File destDir = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num);
			FileUtils.deleteDirectory(destDir);				//첨부된 이미지 파일이 저장된 폴더도 삭제함
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_board/listArticles.do';";
			message += "</script>";
			
			// 글 삭제 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);					
		} catch (Exception e) {
			message = "<script>";
			message += " alert('글을 삭제하는 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_board/listArticles.do';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		}
				
		return resEnt;
	}
	@Override
	@RequestMapping(value = "/club_board/removeModImage.do", method = RequestMethod.POST)
	public void removeModFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String FileNO = request.getParameter("FileNO");
		String FileName = request.getParameter("FileName");
		String notice_num = request.getParameter("notice_num");
		
		System.out.println("FileNO= " + FileNO);
		System.out.println("notice_num= " + notice_num);
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setNotice_num(Integer.parseInt(notice_num));
		fileDTO.setFileNO(Integer.parseInt(FileNO));
		
		boardService.removeModFile(fileDTO);
		
		File oldFile = new File(ARTICLE_IMAGE_REPO +"\\"+ notice_num +"\\"+ FileName);
		oldFile.delete();
		
		writer.print("success");
		
	}
	
}