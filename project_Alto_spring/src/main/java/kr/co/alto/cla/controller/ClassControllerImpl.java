package kr.co.alto.cla.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.area.service.AreaService;
import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ImageDTO;
import kr.co.alto.cla.service.ClassService;
import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.service.HobbyService;

@Controller("classController")
public class ClassControllerImpl implements ClassController {
	
	@Autowired
	private AreaService areaService;
	
	@Autowired
	private HobbyService hobbyService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private ClassDTO classDTO;

	//파일 저장 위치 지정
	private static final String CURR_IMAGE_PEPO_PATH = "C:\\workspace-jsp\\altoimg";
	
	@Override
	@RequestMapping(value = "/class/classMain.do", method = RequestMethod.GET)
	public ModelAndView classMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/class/*form.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);

		List<AreaDTO> areaList = areaService.listAreas();
		mav.addObject("areaList", areaList);

		List<HobbyDTO> hobbyList = hobbyService.listHobbys();
		mav.addObject("hobbyList", hobbyList);

		return mav;
	}

	@Override
	@RequestMapping(value = "/class/listClass.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listClass(@RequestParam(value = "sort", required = false) String sort, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ClassDTO> classList = classService.listClass(sort);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("classList", classList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/class/addNewClass.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewClass(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName=null;
		
		Map classMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			classMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
//		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
//		String id = memberDTO.getId();
//		classMap.put("id", id);
		
		List<String> fileList = upload(multipartRequest);
		
		List<ImageDTO> imageFileList = new ArrayList<ImageDTO>();
		if(fileList!= null && fileList.size()!=0) {
			for(String fileName : fileList) {
				ImageDTO imageDTO = new ImageDTO();
				imageDTO.setImageFileName(fileName);
				imageFileList.add(imageDTO);
			}
			classMap.put("imageFileList", imageFileList);
		}
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
		try {
			String class_code = classService.addNewArticle(classMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageDTO  imageDTO:imageFileList) {
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(CURR_IMAGE_PEPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_PEPO_PATH+"\\"+class_code);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/class/listClass.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
			  for(ImageDTO  imageDTO:imageFileList) {
			  	imageFileName = imageDTO.getImageFileName();
				File srcFile = new File(CURR_IMAGE_PEPO_PATH+"\\"+"temp"+"\\"+imageFileName);
			 	srcFile.delete();
			  }
			}
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/classform.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {

		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			
			fileList.add(originalFileName);
			
			File file = new File(CURR_IMAGE_PEPO_PATH +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){
				if(!file.exists()){
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(CURR_IMAGE_PEPO_PATH +"\\"+"temp"+ "\\"+originalFileName));
				}
			}
		}
		return fileList;
	}
	
	
}
