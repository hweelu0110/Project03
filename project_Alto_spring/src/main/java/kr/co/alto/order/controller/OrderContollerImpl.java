package kr.co.alto.order.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;
import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderPageDTO;
import kr.co.alto.order.service.OrderService;


@Controller("orderController")
public class OrderContollerImpl implements OrderController {

	@Autowired
	private OrderService orderService;

	@Override
	@RequestMapping(value = "/order/orderPage.do", method = RequestMethod.GET)
	public ModelAndView orderPage(OrderPageDTO opd, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map<String, Object> orderInfo = new HashMap<>();
		
		List orderList = orderService.getOrderListInfo(opd.getOrders());
		orderInfo.put("orderList", orderList);
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		orderInfo.put("memberDTO", memberDTO);
		
		mav.addObject("orderInfo", orderInfo);
		
		
		return mav;
	}

}
