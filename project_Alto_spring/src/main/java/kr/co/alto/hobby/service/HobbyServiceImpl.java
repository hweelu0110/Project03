package kr.co.alto.hobby.service;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


@Service("hobbyService")
@Transactional(propagation = Propagation.REQUIRED)
public class HobbyServiceImpl implements HobbyService {
	
	@Autowired
	private HobbyDAO hobbyDAO;

	@Override
	public List<HobbyDTO> listHobbys() throws DataAccessException {
		List<HobbyDTO> hobbyList = hobbyDAO.selectAllHobbyList();
		return hobbyList;
	}

	@Override
	public List<HobbysubDTO> listHobbysub(HashMap<String, String> codeList) throws DataAccessException {
		List<HobbysubDTO> hobbysubList = hobbyDAO.selectHobbysubList(codeList);
		return hobbysubList;
=======
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;


@Service("hobbyService")
@Transactional(propagation = Propagation.REQUIRED)
public class HobbyServiceImpl implements HobbyService {
	
	@Autowired
	private HobbyDAO hobbyDAO;

	@Override
	public List<HobbyDTO> listHobbys() throws DataAccessException {
		List<HobbyDTO> hobbyList = hobbyDAO.selectAllHobbyList();
		return hobbyList;
>>>>>>> refs/remotes/origin/woosb
	}

}
