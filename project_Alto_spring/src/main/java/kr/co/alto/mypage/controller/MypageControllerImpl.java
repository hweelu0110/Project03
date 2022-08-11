package kr.co.alto.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.alto.common.base.BaseController;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.member.controller.MemberController;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.service.MypageService;


@Controller("mypageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController implements MypageController {
	
	//이미지 저장위치
	private static String MEM_IMG_PATH = "C:\\workspace-spring\\alto\\member";	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private HobbyDTO hobbyDTO;

	@Override
	@RequestMapping(value = "/myMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mypageMain(HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> mypageMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		mypageMap = mypageService.selectMyList(mem_id);
		
		mav.addObject("mypageMap", mypageMap);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/modMemberInfo.do", method = RequestMethod.POST)
	public ResponseEntity modMemInfo(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		logger.info("modMemberInfo");
		System.out.println(memberDTO.getMem_id());
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			
			mypageService.modMemInfo(memberDTO);			
			
			message = "<script>";
			message += " alert('회원 정보 수정 완료');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberDTO memberDTO) throws Exception {
		String mem_pwd = mypageService.pwCheck(memberDTO.getMem_id());
		if (memberDTO == null || !BCrypt.checkpw(memberDTO.getMem_pwd(), mem_pwd)) {
			return 0;
		}
		return 1;
	}

	@Override
	@RequestMapping(value = "/pwUpdate.do", method = RequestMethod.POST)
	public ResponseEntity pwUpdate(String mem_id, String mem_pwd1, HttpServletRequest request, HttpSession session)
			throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		String hashedPw = BCrypt.hashpw(mem_pwd1, BCrypt.gensalt());
		
		try {
			
			mypageService.pwUpdate(mem_id, hashedPw);
			session.invalidate();
			
			message = "<script>";
			message += " alert('비밀번호 변경 완료. 다시 로그인 해주세요.');";
			message += " location.href='"+request.getContextPath()+"/member/loginFrm.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/delMember.do", method = RequestMethod.POST)
	public ResponseEntity delMember(String mem_id, HttpServletRequest request, HttpSession session) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;		
		try {
			
			mypageService.delMember(mem_id);
			session.invalidate();
			
			message = "<script>";
			message += " alert('회원 탈퇴 완료');";
			message += " location.href='"+request.getContextPath()+"/main.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/delMemFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/updateImg.do", method = RequestMethod.POST)
	public String updateImg(MultipartHttpServletRequest mpRequest, HttpSession session, String mem_id)
			throws Exception {
		String mem_img = upload(mpRequest);
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		
		mypageService.updateImg(mem_img, mem_id);
		
		memberDTO.setImg(mem_img);
		session.setAttribute("login", memberDTO);
		
		return "redirect:/mypage/myMain.do";
	}
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
			String mem_img = "";
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName = mFile.getOriginalFilename();
				
				if (originalFileName != "" && originalFileName != null) {
					mem_img = originalFileName;
					File file = new File(MEM_IMG_PATH+"\\"+fileName);
					if (mFile.getSize() != 0) {
						if(!file.exists()) {
							file.getParentFile().mkdirs();		//경로에 해당하는 디렉토리 생성
							mFile.transferTo(new File(MEM_IMG_PATH +"\\"+originalFileName ));
									//저장된 MultipartFile을 실제 파일로 전송
						}
					}
				}
			}
			
			return mem_img;
		}

	@Override
	@RequestMapping(value = "/likeAdd.do", method = RequestMethod.GET)
	@ResponseBody
	public void insertLike(String codeNum, String codeType, String mem_id, HttpServletRequest request)
			throws Exception {		
		mypageService.insertLike(codeNum, codeType, mem_id);
	}

	@Override
	@RequestMapping(value = "/likeDel.do", method = RequestMethod.GET)
	@ResponseBody
	public void deletLike(String codeNum, String codeType, String mem_id, HttpServletRequest request) 
			throws Exception {
		mypageService.deletLike(codeNum, codeType, mem_id);		
	}
		
}
