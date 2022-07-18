package kr.co.alto.club.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.service.ClubService;
import kr.co.alto.common.base.BaseController;

@Controller("clubController")
@RequestMapping("/club")
public class ClubControllerImpl extends BaseController implements ClubController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private ClubDTO clubDTO;

}
