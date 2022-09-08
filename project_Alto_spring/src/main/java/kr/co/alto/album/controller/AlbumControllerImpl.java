package kr.co.alto.album.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.album.dto.AlbumDTO;
import kr.co.alto.album.dto.ImageDTO;
import kr.co.alto.album.service.AlbumService;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.member.dto.MemberDTO;

@Controller
public class AlbumControllerImpl implements AlbumController {
	//이미지 저장위치
	private static String ALBUM_IMAGE_REPO = "C:\\workspace-spring\\imageRepo";
	@Autowired
	private AlbumService albumService;
	@Autowired
	private AlbumDTO albumDTO;
	
	@Override
	@RequestMapping(value = "/club_album/albumList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView albumList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//section값과 pageNum값을 구함
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String club_code = request.getParameter("club_code");
				
		//최초 요청시 section값과 pageNum값이 없으면 각각 1로 초기화함
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
				
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("club_code", club_code);
		
		Map<String, Object> albumsMap = albumService.albumList(pagingMap);
		
		albumsMap.put("section", section);
		albumsMap.put("pageNum", pageNum);
		albumsMap.put("club_code", club_code);		
		
		mav.addObject("albumsMap", albumsMap);		
		
		return mav;
	}
	
	@RequestMapping(value = "/club_album/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registration(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/club_album/addNewAlbum.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewAlbum(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("UTF-8");
		
		String cate = multipartRequest.getParameter("cate");
		String tit = multipartRequest.getParameter("tit");
		String imageFileName = null;
		
		Map albumMap = new HashMap<>();
		Enumeration enun = multipartRequest.getParameterNames();
		
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			albumMap.put(name, value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		albumMap.put("mem_id", mem_id);
		
		List<String> fileList = upload(multipartRequest);
		albumMap.put("imageFileName", fileList.get(0));
		
		List<ImageDTO> imageFileList = new ArrayList<>();
		if(fileList != null && fileList.size() != 0) {
			for(String fileName: fileList) {
				ImageDTO imageDTO = new ImageDTO();
				imageDTO.setImageFileName(fileName);
				imageFileList.add(imageDTO);
			}
			albumMap.put("imageFileList", imageFileList);
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt =null;
		
		try {
			int album_num = albumService.addNewAlbum(albumMap);
			
			if (imageFileList != null && imageFileList.size() != 0) {
				for(ImageDTO imageDTO : imageFileList) {
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(ALBUM_IMAGE_REPO +"\\temp\\"+ imageFileName);
					File destFile = new File(ALBUM_IMAGE_REPO +"\\"+  album_num);
					FileUtils.moveFileToDirectory(srcFile, destFile, true);
				}
				
			}
		message = "<script>";
		message += " alert('새글을 추가했습니다.');";
		message += " location.href='"+multipartRequest.getContextPath()+"/club_album/albumList.do?club_code="+albumMap.get("club_code")+"&cate="+cate+"&tit="+tit+"';";
		message += "</script>";
		
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		
	} catch (Exception e) {
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageDTO imageDTO : imageFileList) {
				imageFileName = imageDTO.getImageFileName();
				File srcFile = new File(ALBUM_IMAGE_REPO +"\\temp\\"+ imageFileName);
				srcFile.delete();
			}
		}
		
		message = "<script>";
		message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
		message += " location.href='"+multipartRequest.getContextPath()+"/club_album/albumForm.do?club_code="+albumMap.get("club_code")+"&cate="+cate+"&tit="+tit+"';";
		message += "</script>";			
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		
		e.printStackTrace();
	}
		return resEnt;

	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename();
			
			if(originalFilename != "" && originalFilename != null) {
				fileList.add(originalFilename);
				File file = new File(ALBUM_IMAGE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if(!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(ALBUM_IMAGE_REPO +"\\temp\\"+ originalFilename));
					}
				}
			}
			
		}
		return fileList;
	}
	
	// 첨부파일 다운로드
	@Override
	@RequestMapping(value = "/club_album/albumImage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void albumImage(@RequestParam("album_num") int album_num,
			    	       @RequestParam("imageFileName") String imageFileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		
		String downFile = ALBUM_IMAGE_REPO + "\\"+album_num+"\\"+ imageFileName;
		//다운로드될 파일 객체 생성
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		//헤더에 파일이름 설정
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
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
	@RequestMapping(value = "/club_album/albumDetail.do", method = RequestMethod.GET)
	public ModelAndView albumDetail(@RequestParam("album_num") int album_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		String mem_id= null;
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("album_num", album_num);
		viewMap.put("mem_id", mem_id);
				
		Map<String, Object> albumMap = albumService.albumDetail(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("albumMap", albumMap);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/club_album/editAlbum.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editAlbum(@RequestParam("album_num") int album_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		String mem_id= null;
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("album_num", album_num);
		viewMap.put("mem_id", mem_id);
				
		Map<String, Object> albumMap = albumService.albumDetail(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("albumMap", albumMap);
		return mav;
	}
	
	//(다중 이미지)수정 기능
	@Override
	@RequestMapping(value = "club_album/modAlbum.do", method = RequestMethod.POST)
	public ResponseEntity modAlbum(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		
		String cate = multipartRequest.getParameter("cate");
		String tit = multipartRequest.getParameter("tit");
		
		Map<String, Object> albumMap = new HashMap<>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if(name.equals("imageFileNo")) {
				String[] values = multipartRequest.getParameterValues(name);
				albumMap.put(name, values);
			}
			else if (name.equals("oldFileName")) {
				String[] values = multipartRequest.getParameterValues(name);
				albumMap.put(name, values);
			}
			else {
				String value = multipartRequest.getParameter(name);
				albumMap.put(name, value);
			}
		}
		
		String[] oldName = (String[]) albumMap.get("oldFileName");
		
		//수정한 이미지 파일을 업로드함
		List<String> fileList = uploadModImageFile(multipartRequest);
		String imageFileName = "";
		if (fileList.get(0) != null) {
			imageFileName = fileList.get(0);
		} else {
			imageFileName = oldName[0];
		}
		albumMap.put("imageFileName", imageFileName);		
		
		//수정시 새로 추가된 이미지 수
		int add_img_num = fileList.size();
		
		
		//기존 이미지 수
		int pre_img_num = oldName.length;
		
		albumMap.put("add_file_num", add_img_num);
		albumMap.put("pre_file_num", pre_img_num);
		
		System.out.println("새로추가 ? "+ add_img_num + "기존 ? " + pre_img_num);
		
		List<ImageDTO> imageFileList = new ArrayList<>();
		List<ImageDTO> modAddImageFileList = new ArrayList<>();
		
		if (fileList != null && fileList.size() != 0) {
			String[] imageFileNo = (String[]) albumMap.get("imageFileNo");
			
			for (int i=0; i < add_img_num; i++) {
				String fileName = fileList.get(i);
				ImageDTO imageDTO = new ImageDTO();
				
				if (i < pre_img_num && fileName != null) {				//기존의 이미지를 수정해서 첨부한 이미지들
					imageDTO.setImageFileName(fileName);
					imageDTO.setImageFileNo(Integer.parseInt(imageFileNo[i]));
					imageFileList.add(imageDTO);
					albumMap.put("imageFileList", imageFileList);
				}
				else if (fileName != null) {								//새로 추가한 이미지들
					imageDTO.setImageFileName(fileName);
					modAddImageFileList.add(imageDTO);				// ??
					albumMap.put("modAddImageFileList", modAddImageFileList);
				}
			}
			
		}
		
		String album_num = (String) albumMap.get("album_num");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		
		try {
			albumService.modAlbum(albumMap);
			
			if (fileList != null && fileList.size() != 0) {
				for (int i=0; i<fileList.size(); i++) {
					String fileName = fileList.get(i);
					
					if (i < pre_img_num && fileName != null) {
						File srcFile = new File(ALBUM_IMAGE_REPO +"\\temp\\"+ fileName);
						File destFile = new File(ALBUM_IMAGE_REPO +"\\"+ album_num);
						FileUtils.moveFileToDirectory(srcFile, destFile, true);							
						
						String oldFileName = oldName[i];
						
						File oldFile = new File(ALBUM_IMAGE_REPO +"\\"+ album_num +"\\"+ oldFileName);
						oldFile.delete();
					}
					else if (fileName != null) {
						File srcFile = new File(ALBUM_IMAGE_REPO +"\\temp\\"+ fileName);
						File destFile = new File(ALBUM_IMAGE_REPO +"\\"+ album_num);
						FileUtils.moveFileToDirectory(srcFile, destFile, true);	
					}
					
				}
			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_album/albumDetail.do?album_num="+album_num+"&cate="+cate+"&tit="+tit+"';";
					
			message += "</script>";
			
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);		
		} catch (Exception e) {
			if (fileList != null && fileList.size() != 0) {
				//오류 발생시 temp폴더의 이미지들 모두 삭제
				for (int i=0; i<fileList.size(); i++) {
					File srcFile = new File(ALBUM_IMAGE_REPO +"\\temp\\"+ fileList.get(i));
					srcFile.delete();
				}
			}
			
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club_album/albumDetail.do?album_num="+album_num+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		
		}
		return resEnt;
	}
	
	//수정시 다중 이미지 업로드하기
	private List<String> uploadModImageFile(MultipartHttpServletRequest multipartRequest) throws Exception, IOException {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				
				File file = new File(ALBUM_IMAGE_REPO +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		
						mFile.transferTo(new File(ALBUM_IMAGE_REPO +"\\temp\\"+ originalFileName)); 
					}
				}
				
			}
			else {													
				fileList.add(null);
			}
		}
		
		return fileList;
	}

	@Override
	@RequestMapping(value = "/club_album/removeAlbum.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeAlbum(@RequestParam("album_num") int album_num, HttpServletRequest request, HttpServletResponse response)
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
			albumService.removeAlbum(album_num);
			
			File destDir = new File(ALBUM_IMAGE_REPO +"\\"+ album_num);
			FileUtils.deleteDirectory(destDir);				//첨부된 이미지 파일이 저장된 폴더도 삭제함
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_album/albumList.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
			// 글 삭제 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);					
		} catch (Exception e) {
			message = "<script>";
			message += " alert('글을 삭제하는 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_album/Albumlist.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// 게시글 수정하기에서 각 이미지 삭제 기능
	@Override
	@RequestMapping(value = "/club_album/removeModImage.do", method = RequestMethod.POST)
	public void removeModImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String imageFileNo = request.getParameter("imageFileNo");
		String imageFileName = request.getParameter("imageFileName");
		String album_num = request.getParameter("album_num");
		
		System.out.println("imageFileNo= " + imageFileNo);
		System.out.println("album_num= " + album_num);
		
		ImageDTO imageDTO = new ImageDTO();
		imageDTO.setAlbum_num(Integer.parseInt(album_num));
		imageDTO.setImageFileNo(Integer.parseInt(imageFileNo));
		
		albumService.removeModImage(imageDTO);
		
		File oldFile = new File(ALBUM_IMAGE_REPO +"\\"+ album_num +"\\"+ imageFileName);
		oldFile.delete();
		
		writer.print("success");
		
	}
}
