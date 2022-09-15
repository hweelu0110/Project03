package kr.co.alto.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;
import kr.co.alto.order.dto.OrderPageDTO;

public interface OrderController {

	public ModelAndView orderPage(OrderPageDTO opd, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	public ModelAndView orderPagePost(OrderDTO od, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;

	public ModelAndView contractList (HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
}
