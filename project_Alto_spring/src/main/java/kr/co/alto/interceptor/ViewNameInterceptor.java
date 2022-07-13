package kr.co.alto.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//브라우저 요청명에서 뷰이름 가져오기
		String viewName = getViewName(request);
		//뷰이름을 request에 바인딩
		request.setAttribute("viewName", viewName);
		
		return true;
	}
	
	private String getViewName(HttpServletRequest request) {
		
		String contextPath = request.getContextPath();
		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();		//전체 요청명 길이
		}
		
		int end;
		
		//주소창의 현재 uri 받아오기
		String uri = (String) request.getAttribute("javax.servlet.include.reqest_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
				
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
