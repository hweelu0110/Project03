package kr.co.alto.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class URIInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginDTO") == null) {
			
			String uri = request.getRequestURI();
			String query = request.getQueryString();
			
			if(query == null || query.equals("null")) {
				query = "";
			}else {
				query = "?" + query;
			}
			
			if(request.getMethod().equals("GET")) {
				request.getSession().setAttribute("URL", uri + query);
			}
		}
		return true;
	}
}
