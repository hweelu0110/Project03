package kr.co.alto.club.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.club.dao.ClubDAO;

@Service("clubService")
@Transactional(propagation = Propagation.REQUIRED)
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;
}
