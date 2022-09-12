package kr.co.alto.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.order.dto.OrderPageDTO;

public interface OrderController {

	public ModelAndView orderPage(List<String> class_all_check_input, List<String> item_all_check_input, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	
}
