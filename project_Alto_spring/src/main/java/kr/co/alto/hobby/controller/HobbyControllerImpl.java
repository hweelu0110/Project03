package kr.co.alto.hobby.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.service.HobbyService;


@Controller("hobbyController")
public class HobbyControllerImpl extends MultiActionController implements HobbyController {
	
	@Autowired
	private HobbyService hobbyService;

	@Override
	@RequestMapping(value = "/member/memHobby.do", method = RequestMethod.GET)
	public ModelAndView listHobbys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List<HobbyDTO> hobbyList = hobbyService.listHobbys();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hobbyList", hobbyList);
		
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
						
			return filename;
		}

}
