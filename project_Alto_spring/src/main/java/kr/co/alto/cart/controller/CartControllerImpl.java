package kr.co.alto.cart.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Override
	@RequestMapping(value = "/mypage/addCart.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity addCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		  
		 Map cartMap = new HashMap();
		  
		 Enumeration enu = request.getParameterNames(); 
		 
		 while(enu.hasMoreElements()){
			 String name=(String)enu.nextElement(); 
			 String value=request.getParameter(name); 
			 cartMap.put(name,value); 
			}
		  
		 MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = "";
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
			
		 cartMap.put("mem_id", mem_id); 
		 
		 String message; 
		 ResponseEntity resEnt=null; 
		 HttpHeaders responseHeaders = new HttpHeaders(); 
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 
		 int cart_goods = cartService.cartGoods(cartMap);
		 
		 try {
			 if(cart_goods == 0) {
				 int addCart = cartService.addCart(cartMap);
			 } else {
				 int editCart = cartService.editCart(cartMap);
			 }
			 
			 message = "<script>"; message += " var con_test = confirm('장바구니로 이동하시겠습니까?');"; 
			 message += " if(con_test == true){ location.href='"+request.getContextPath() +"/mypage/cartClass.do'; }"; 
			 message += " else { history.back(); }";
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	  
			
		 } 
		 
		 catch(Exception e) {
			 message = " <script>"; message +=" alert('오류가 발생했습니다. 다시 시도해주세요');"; 
			 message +=" location.href='"+request.getContextPath()+"/class/listClass.do'; ";
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			 e.printStackTrace(); 
		} 
		 return resEnt; 
	}

	@Override
	@RequestMapping(value = "/mypage/deleteCart.do", method = {RequestMethod.GET})
	public ResponseEntity deleteCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		  
		 Map cartMap = new HashMap();
		  
		 Enumeration enu = request.getParameterNames(); 
		 
		 while(enu.hasMoreElements()){
			 String name=(String)enu.nextElement(); 
			 String value=request.getParameter(name); 
			 cartMap.put(name,value); 
			}
		 
		 String message; 
		 ResponseEntity resEnt=null; 
		 HttpHeaders responseHeaders = new HttpHeaders(); 
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 
		 try {
			 int deleteCart = cartService.deleteCart(cartMap);
			 
			 message = " <script>"; 
			 message +=" alert('장바구니에서 삭제했습니다.');";
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; "; 
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	  
			
		 } 
		 
		 catch(Exception e) {
			 message = " <script>"; 
			 message +=" alert('오류가 발생했습니다. 다시 시도해주세요');"; 
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; ";
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			 e.printStackTrace(); 
		} 
		 return resEnt; 
	}

	@Override
	@RequestMapping(value = "/mypage/quanEditCart.do", method = {RequestMethod.GET})
	public ResponseEntity quanEditCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		  
		 Map cartMap = new HashMap();
		  
		 Enumeration enu = request.getParameterNames(); 
		 
		 while(enu.hasMoreElements()){
			 String name=(String)enu.nextElement(); 
			 String value=request.getParameter(name); 
			 cartMap.put(name,value); 
			}
		 
		 String message; 
		 ResponseEntity resEnt=null; 
		 HttpHeaders responseHeaders = new HttpHeaders(); 
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 
		 try {
			 int deleteCart = cartService.quanEditCart(cartMap);
			 
			 message = " <script>"; 
			 message +=" alert('수량을 변경했습니다.');";
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; "; 
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	  
			
		 } 
		 
		 catch(Exception e) {
			 message = " <script>"; 
			 message +=" alert('오류가 발생했습니다. 다시 시도해주세요');"; 
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; ";
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			 e.printStackTrace(); 
		} 
		 return resEnt; 
	}

	@Override
	@RequestMapping(value = "/mypage/deleteAll.do", method = RequestMethod.GET)
	public ResponseEntity deleteAll(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {

		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = "";
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		String message; 
		 ResponseEntity resEnt=null; 
		 HttpHeaders responseHeaders = new HttpHeaders(); 
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 
		 try {
			 int deleteAll = cartService.deleteAll(mem_id);
			 
			 message = " <script>"; 
			 message +=" alert('장바구니를 비웠습니다.');";
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; "; 
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	  
			
		 } 
		 
		 catch(Exception e) {
			 message = " <script>"; 
			 message +=" alert('오류가 발생했습니다. 다시 시도해주세요');"; 
			 message +=" location.href='"+request.getContextPath() +"/mypage/cartClass.do'; ";
			 message +=" </script>"; 
			 
			 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			 e.printStackTrace(); 
		} 
		 return resEnt; 
	}

}
