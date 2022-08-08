package kr.co.alto.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")	//해당 클래스를 Controller 빈으로 자동 변환
public class MainController {
	@RequestMapping("/main.do")
<<<<<<< HEAD
	public ModelAndView altoMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
=======
	public ModelAndView ezen1(HttpServletRequest request, HttpServletResponse response) throws Exception {
>>>>>>> refs/remotes/origin/woosb
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
	}
}
