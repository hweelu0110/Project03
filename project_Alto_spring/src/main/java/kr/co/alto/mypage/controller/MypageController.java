package kr.co.alto.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.member.dto.MemberDTO;

public interface MypageController {
	
	public ModelAndView mypageMain(HttpServletRequest request, HttpSession httpSession) throws Exception;
	
	public ModelAndView infoEditFrm(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ResponseEntity modMemInfo(MemberDTO memberDTO, HttpServletRequest request) throws Exception;
	
	public int pwCheck(MemberDTO memberDTO) throws Exception;
	public ResponseEntity pwUpdate(String mem_id, String mem_pwd1, HttpServletRequest request, HttpSession session) throws Exception;
	
	public ResponseEntity delMember(String mem_id, HttpServletRequest request, HttpSession session) throws Exception;
	
	public String updateImg(MultipartHttpServletRequest mpRequest, HttpSession session, String mem_id) throws Exception;
	
	public ModelAndView myActivList(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView mylikeList(HttpServletRequest request, HttpSession httpSession) throws Exception;
	
	public void insertLike(String codeNum, String codeType, HttpServletRequest request, HttpSession httpSession) throws Exception; 
	public void deletLike(String codeNum, String codeType, HttpServletRequest request, HttpSession httpSession) throws Exception;

	public ModelAndView myAddItem(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView myReviewList(HttpServletRequest request, HttpSession httpSession) throws Exception;
}
