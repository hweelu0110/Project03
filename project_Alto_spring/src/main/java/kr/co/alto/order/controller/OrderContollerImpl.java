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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.order.dto.Criteria;
import kr.co.alto.order.dto.OrderDTO;
import kr.co.alto.order.dto.OrderPageDTO;
import kr.co.alto.order.dto.PageMarker;
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
	
	@RequestMapping("/order/orderPagePost.do")
	public ModelAndView orderPagePost(OrderDTO od, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		int orderAdd = orderService.addNewOrder(od);
		
		Map<String, Object> orderMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = "";
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		OrderDTO orderDTO = orderService.orderInfo(mem_id);
		mav.addObject("orderDTO", orderDTO);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/order/contractList.do", method = RequestMethod.GET)
	public ModelAndView contractList(Criteria cri, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> listMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		listMap.put("mem_id", mem_id);
		
		PageMarker pageMarker = new PageMarker();
		pageMarker.setCri(cri);
		pageMarker.setTotalCount(orderService.countListTotal(mem_id));
		listMap.put("cri", cri);
		
		List<OrderDTO> orderList = orderService.selectOrderList(listMap);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderList", orderList);
		mav.addObject("pageMarker", pageMarker);
		mav.addObject("cri", cri);
		
		return mav;
	}

}
