package kr.co.alto.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
import org.springframework.util.FileCopyUtils;
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
	//첨부파일 저장위치
	private static String ARTICLE_FILE_REPO = "C:\\workspace-spring\\fileRepo";
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
		
		String cate = multipartRequest.getParameter("cate");
		String tit = multipartRequest.getParameter("tit");
		String fileName = null;
		
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
		List<String> fileNameList = upload(multipartRequest);
				
		List<FileDTO> fileList = new ArrayList<>();
		if (fileNameList != null && fileNameList.size() != 0) {
			for (String name : fileNameList) {				
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFileName(name);
				fileList.add(fileDTO);
			}
			articleMap.put("fileList", fileList);
		}
				
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			int notice_num = boardService.addNewArticle(articleMap);		//articleMap을 서비스 클래스로 전달함
			
			if (fileList != null && fileList.size() != 0) {
				//첨부한 이미지들을 for문을 이용해 업로드함
				for (FileDTO fileDTO : fileList) {
					fileName = fileDTO.getFileName();
					File srcFile = new File(ARTICLE_FILE_REPO +"\\temp\\"+ fileName);
					File destFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num);
					FileUtils.moveFileToDirectory(srcFile, destFile, true);
				}
			}
				
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_board/listArticles.do?club_code="+articleMap.get("club_code")+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
				
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				//오류 발생시 temp폴더의 이미지들 모두 삭제
				for (FileDTO fileDTO : fileList) {
					fileName = fileDTO.getFileName();
					File srcFile = new File(ARTICLE_FILE_REPO +"\\"+ "temp" +"\\"+ fileName);
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
	
	// 글쓰기 업로드 파일 이름 반환
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
		
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename();
			
			if (originalFilename != "" && originalFilename != null) {
				fileList.add(originalFilename);		
				File file = new File(ARTICLE_FILE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		
						mFile.transferTo(new File(ARTICLE_FILE_REPO +"\\"+ "temp" +"\\"+ originalFilename));
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
				
		Map<String, Object> articleMap = boardService.viewArticle(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articleMap", articleMap);
		
		return mav;
	}
	
	// 첨부파일 다운로드
	@Override
	@RequestMapping(value = "/club_board/filedownload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void downloadFile(@RequestParam("fileNo") int fileNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		FileDTO fileInfo = boardService.selectFile(fileNo);
		
		int notice_num = (int) fileInfo.getNotice_num();
		String fileName = (String) fileInfo.getFileName();
		
		System.out.println("Controller ? "+ notice_num + fileName);
		
		File downloadFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num +"\\"+ fileName);
		
		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
				
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		
		response.setHeader("Cache-Control", "no-cache;");
		response.addHeader("Content-Disposition", "attachment; fileName=" + fileName);
		response.addHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		FileInputStream in = new FileInputStream(downloadFile);
		byte[] buffer = new byte[1024*8]; 	//버퍼 이용, 8kbyte씩 전송
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@Override
	@RequestMapping(value = "/club_board/editArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editArticle(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response)
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
		
		String cate = multipartRequest.getParameter("cate");
		String tit = multipartRequest.getParameter("tit");
		
		Map<String, Object> articleMap = new HashMap<>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if (name.equals("fileNo")) {
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
		List<String> fileNameList = uploadModFile(multipartRequest);
		
		//수정시 새로 추가된 파일 수
		int add_file_num = fileNameList.size();
		
		String[] oldName = (String[]) articleMap.get("oldFileName");
		//기존 파일 수
		int pre_file_num = oldName.length;
		
		articleMap.put("add_file_num", add_file_num);
		articleMap.put("pre_file_num", pre_file_num);
		
		List<FileDTO> fileList = new ArrayList<>();
		List<FileDTO> modAddFileList = new ArrayList<>();
		
		if (fileNameList != null && fileNameList.size() != 0) {
			String[] fileNo = (String[]) articleMap.get("fileNo");
			
			for (int i=0; i < add_file_num; i++) {
				String fileName = fileNameList.get(i);
				FileDTO fileDTO = new FileDTO();
				
				if (i < pre_file_num && fileName != null) {				//기존의 이미지를 수정해서 첨부한 이미지들
					fileDTO.setFileName(fileName);
					fileDTO.setFileNo(Integer.parseInt(fileNo[i]));
					fileList.add(fileDTO);
					articleMap.put("fileList", fileList);
				}
				else if (fileName != null) {								//새로 추가한 이미지들
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
			
			if (fileNameList != null && fileNameList.size() != 0) {
				for (int i=0; i<fileNameList.size(); i++) {
					String fileName = fileNameList.get(i);
					System.out.println("fileName ["+i+"] "+fileName);
					
					if (i < pre_file_num && fileName != null) {
						File srcFile = new File(ARTICLE_FILE_REPO +"\\temp\\"+ fileName);
						File destFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num);
						FileUtils.moveFileToDirectory(srcFile, destFile, true);							
						
						String oldFileName = oldName[i];
						
						File oldFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num +"\\"+ oldFileName);
						oldFile.delete();	
					}
					else if (fileName != null) {
						File srcFile = new File(ARTICLE_FILE_REPO +"\\temp\\"+ fileName);
						File destFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num);
						FileUtils.moveFileToDirectory(srcFile, destFile, true);			
					}					
				}
			}
			
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_board/viewArticle.do?notice_num="+notice_num+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
			
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);		
			
		} catch (Exception e) {
			if (fileNameList != null && fileNameList.size() != 0) {
				//오류 발생시 temp폴더의 이미지들 모두 삭제
				for (int i=0; i<fileNameList.size(); i++) {
					File srcFile = new File(ARTICLE_FILE_REPO +"\\temp\\"+ fileNameList.get(i));
					srcFile.delete();
				}
			}
			
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_board/viewArticle.do?notice_num="+notice_num+"&cate="+cate+"&tit="+tit+"';";
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
				
				File file = new File(ARTICLE_FILE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		
						mFile.transferTo(new File(ARTICLE_FILE_REPO +"\\temp\\"+ originalFileName)); 
					}
				}
				
			}
			else {													//첨부한 파일이 없었을 경우
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
		
		String club_code = request.getParameter("club_code");
		String cate = request.getParameter("cate");
		String tit = request.getParameter("tit");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");	
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			boardService.removeArticle(notice_num);			//글번호 전달해서 글 삭제함
			
			File destDir = new File(ARTICLE_FILE_REPO +"\\"+ notice_num);
			FileUtils.deleteDirectory(destDir);				//첨부된 이미지 파일이 저장된 폴더도 삭제함
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_board/listArticles.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
			
			// 글 삭제 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);					
		} catch (Exception e) {
			message = "<script>";
			message += " alert('글을 삭제하는 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_board/listArticles.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		}
				
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/club_board/removeModFile.do", method = RequestMethod.POST)
	public void removeModFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String fileNo = request.getParameter("fileNo");
		String fileName = request.getParameter("fileName");
		String notice_num = request.getParameter("notice_num");
		
		System.out.println("fileNo= " + fileNo);
		System.out.println("notice_num= " + notice_num);
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setNotice_num(Integer.parseInt(notice_num));
		fileDTO.setFileNo(Integer.parseInt(fileNo));
		
		boardService.removeModFile(fileDTO);
		
		File oldFile = new File(ARTICLE_FILE_REPO +"\\"+ notice_num +"\\"+ fileName);
		oldFile.delete();
		
		writer.print("success");
		
	}

	
}