package kr.co.alto.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import kr.co.alto.member.dto.MemberDTO;

public interface MypageController {

	public ResponseEntity modMemInfo(MemberDTO memberDTO, HttpServletRequest request) throws Exception;
}
