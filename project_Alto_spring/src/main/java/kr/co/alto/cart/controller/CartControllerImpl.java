package kr.co.alto.cart.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.area.service.AreaService;
import kr.co.alto.cart.service.CartService;
import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.member.dto.MemberDTO;

@Controller("cartController")
public class CartControllerImpl implements CartController {

	@Autowired
	private CartService cartService;
	
	@Override
	@RequestMapping(value = "/mypage/cartClass.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cartMain(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> cartMainMap = new HashMap<>();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = "";
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		cartMainMap = cartService.listCart(mem_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("cartMainMap", cartMainMap);
		
		return mav;
	}

}
