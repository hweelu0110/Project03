package kr.co.alto.cla;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("classController")
public class ClassController implements ClassControllerImpl {

	//파일 저장 위치 지정
	private static final String CURR_IMAGE_PEPO_PATH = "C:\\workspace-jsp\\altoimg";
		
	@Override
	@RequestMapping(value = "/class/classform.do", method = RequestMethod.GET)
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
		return mav;
	}
	
	// request 객체의 URL 요청명에서 .do를 제외한 뷰이름 가져오기
	private String getViewName(HttpServletRequest request) {
		
		String contextPath = request.getContextPath();
		//주소창의 현재 uri 받아오기
		String uri = (String) request.getAttribute("javax.servlet.include.reqest_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		
		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String filename = uri.substring(begin, end);
		if (filename.indexOf(".") != -1) {
			filename = filename.substring(0, filename.lastIndexOf("."));
		}		

//		if (filename.indexOf("/") != -1) {
//			filename = filename.substring(filename.lastIndexOf("/"), filename.length());
//		}
		
		return filename;
	}

	
	@Override
	@RequestMapping(value = "/class/upload.do", method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
	
		multipartRequest.setCharacterEncoding("utf-8");
		
		//매개변수 정보와 파일 정보를 저장할 Map을 생성함
		Map map = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		
		//전송된 매개변수 값을 key/value로 map에 저장
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		//파일을 업로드한 후 반환된 파일이름이 저장된 fileList를 다시 map 저장함
		List<String> fileList = fileProcess(multipartRequest);
		map.put("fileList", fileList);
		
		//map을 결과창으로 포워딩
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/class/classSearch");
		
		return mav;
	}


	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		
		//첨부된 파일 이름 가져옴
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			//파일 이름에 대한 MultipartFile 객체를 가져옴 
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename(); 	// 실제 파일 이름 가져옴
			
			fileList.add(originalFilename);			// 파일 이름을 하나씩 fileList에 저장
			
			File file = new File(CURR_IMAGE_PEPO_PATH+"\\"+fileName);
			if(mFile.getSize()!=0) {						// 첨부된 파일이 있는지 체크
				if(! file.exists()) {						// 경로에 파일이 없으면 그 경로에 해당하는 
					if(file.getParentFile().mkdirs()) {		// 디렉토리를 생성후 파일 생성
						file.createNewFile();
					}
				}
				//임시로 저장된 실제파일로 전송
				mFile.transferTo(new File(CURR_IMAGE_PEPO_PATH+"\\"+originalFilename));
			}
		}
		return fileList;	//첨부한 파일 이름이 저장된 fileList 반환
	}



	@Override
	@RequestMapping("/download")
	public void download(String imageFileName, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		
		String downFile = CURR_IMAGE_PEPO_PATH+"\\"+imageFileName;
		
		//다운로드 될 파일 객체 생성
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		//헤더에 파일 이름 설정
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];	//버퍼를 이용해 한꺼번에 8kb씩 브라우저에 전송됨
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
