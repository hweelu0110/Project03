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
	private static final String CURR_IMAGE_PEPO_PATH = "C:\\workspace-jsp\\altoimg\\altoclass";
	
	@Override
	@RequestMapping(value = "/class/classMain.do", method = RequestMethod.GET)
	public ModelAndView classMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		Map listMapBest = new HashMap<>();
		listMapBest.put("sort", "stuU");
		List<ClassDTO> classListBest = classService.listClass(listMapBest);
		
		Map listMapNew = new HashMap<>();
		listMapBest.put("sort", "new");
		List<ClassDTO> classListNew = classService.listClass(listMapNew);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("classListBest", classListBest);
		mav.addObject("classListNew", classListNew);
		
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
	public ModelAndView listClass(@RequestParam(value = "sort", required = false) String sort, 
								  @RequestParam(value = "hobbyC", required = false) String hobbyC, 
								HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		Map listMap = new HashMap<>();
		
		if(sort!=null) {
			listMap.put("sort", sort);
		}
		
		if(hobbyC!=null) {
			listMap.put("hobbyC", hobbyC);
		}
		
		List<ClassDTO> classList = classService.listClass(listMap);
		ModelAndView mav = new ModelAndView(viewName);
		
		List<AreaDTO> areaList = areaService.listAreas();
		mav.addObject("areaList", areaList);

		List<HobbyDTO> hobbyList = hobbyService.listHobbys();
		mav.addObject("hobbyList", hobbyList);

		mav.addObject("classList", classList);
		mav.addObject("listMap", listMap);
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

	@Override
	@RequestMapping(value = "/class/editClass.do", method = RequestMethod.GET)
	public ModelAndView editClass(@RequestParam("class_code") String class_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		
		System.out.println("컨트롤러 : "+class_code);
		Map<String, Object> classMap = classService.editClass(class_code);

		ModelAndView mav = new ModelAndView();
		
		List<AreaDTO> areaList = areaService.listAreas();
		mav.addObject("areaList", areaList);

		List<HobbyDTO> hobbyList = hobbyService.listHobbys();
		mav.addObject("hobbyList", hobbyList);
		
		mav.setViewName(viewName);
		mav.addObject("classMap", classMap);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/class/modClass.do", method = RequestMethod.POST)
	public ResponseEntity modClass(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> classMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			if(name.equals("imageFileNO")) {
				String[] values = multipartRequest.getParameterValues(name);
				classMap.put(name, values);
			} else if (name.equals("oldFileName")) {
				String[] values = multipartRequest.getParameterValues(name);
				classMap.put(name, values);
			} else {
				String values = multipartRequest.getParameter(name);
				classMap.put(name, values);
			}
		}
		
		List<String> fileList = uploadModImageFile(multipartRequest);
		
		int added_img_num = Integer.parseInt((String) classMap.get("added_img_num"));
		int pre_img_num = Integer.parseInt((String) classMap.get("pre_img_num"));
		List<ImageDTO> imageFileList = new ArrayList<ImageDTO>();
		
		System.out.println("added_img_num : " + added_img_num + " / pre_img_num : "+pre_img_num);
		
		if(fileList != null && fileList.size()!=0) {
			String[] imageFileNO = (String[])classMap.get("imageFileNO");
			for(int i=0; i<added_img_num; i++) {
				String fileName = fileList.get(i);
				ImageDTO imageDTO = new ImageDTO();
				if(i<pre_img_num) { 
					imageDTO.setImageFileName(fileName);
					imageDTO.setImageFileNO(Integer.parseInt(imageFileNO[i]));
					imageFileList.add(imageDTO);
					classMap.put("imageFileList", imageFileList);
				}
			}
		}
		
		String _class_code = (String)classMap.get("class_code");
		String class_code = _class_code.trim();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders reHttpHeaders = new HttpHeaders();
		reHttpHeaders.add("content-type", "text/html; charset=utf-8");
		
		
		try {
			classService.modClass(classMap);
			
			if(fileList != null && fileList.size() != 0) {
				for(int i=0; i<fileList.size(); i++) {
					String fileName = fileList.get(i);
					if(i<pre_img_num) {
						if(fileName != null) {
							File srcFile = new File(CURR_IMAGE_PEPO_PATH+"\\"+"temp"+"\\"+fileName);
							File destDir = new File(CURR_IMAGE_PEPO_PATH+"\\"+class_code);
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							
							String[] oldName = (String[]) classMap.get("oldFileName");
							String oldFileName = oldName[i];
							
							File oldFile = new File(CURR_IMAGE_PEPO_PATH+"\\"+class_code+"\\"+oldFileName);
							oldFile.delete();
						}
					}
				}
			}
			message = "<script>";
			message += " alert('글이 수정되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/class/listClass.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, reHttpHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += " location.href='"+multipartRequest.getContextPath()+"/class/listClass.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, reHttpHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}

	private List<String> uploadModImageFile(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				
				File file = new File(CURR_IMAGE_PEPO_PATH +"\\"+ fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();		//경로에 해당하는 디렉토리들 생성
						mFile.transferTo(new File(CURR_IMAGE_PEPO_PATH +"\\"+ "temp" +"\\"+ originalFileName)); //임시로
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
	
	
}
