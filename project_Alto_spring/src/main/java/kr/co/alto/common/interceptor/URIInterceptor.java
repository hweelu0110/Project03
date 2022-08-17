package kr.co.alto.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class URIInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
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
				logger.info("URIIntercepter URL : " + (uri+query));
				request.getSession().setAttribute("URL", uri + query);
			}
		}
		return true;
	}
}
