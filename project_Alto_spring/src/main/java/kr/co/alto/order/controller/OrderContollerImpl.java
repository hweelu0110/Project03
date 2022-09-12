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
	public ModelAndView orderPage(@RequestParam List<String> class_all_check_input,
								  @RequestParam List<String> item_all_check_input,
								HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		for (String c : class_all_check_input) {
            System.out.println(c);
        }
		
		for (String i : class_all_check_input) {
            System.out.println(i);
        }
		
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}

}
