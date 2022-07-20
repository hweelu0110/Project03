package kr.co.alto.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AutoLoginInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("auto login check...");
		HttpSession httpSession = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) {
			MemberDTO memberDTO = memberService.checkLoginBefore(loginCookie.getValue());
			if(memberDTO != null) {
				httpSession.setAttribute("login", memberDTO);
			}
		}

		return true;
	}
	

}
