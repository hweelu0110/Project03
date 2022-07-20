package kr.co.alto.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    		
    	logger.info("interceptor postHandel");
        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberDTO =  modelMap.get("member");

        if (memberDTO != null) {
            logger.info("new login success");
            httpSession.setAttribute("login", memberDTO);
            
            if(request.getParameter("useCookie") != null) {
            	logger.info("auto login check");
            	Cookie loginCookie = new Cookie("loginCookie",httpSession.getId());
            	loginCookie.setPath("/");
            	loginCookie.setMaxAge(60*60*24*7);
            	response.addCookie(loginCookie);
            }
            
            Object destination = httpSession.getAttribute("destination");
            Object URL = httpSession.getAttribute("URL");
            response.sendRedirect(destination != null ? (String) destination : (String) URL);
        }

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute("login") != null) {
            logger.info("clear login data before");
            httpSession.removeAttribute("login");
        }

        return true;
    }
}