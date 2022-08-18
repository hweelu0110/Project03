package kr.co.alto.hobby.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;
import kr.co.alto.mypage.dao.MypageDAO;


@Service("hobbyService")
@Transactional(propagation = Propagation.REQUIRED)
public class HobbyServiceImpl implements HobbyService {
	
	@Autowired
	private HobbyDAO hobbyDAO;

	@Override
	public Map<String, Object> listHobbys(String mem_id) throws DataAccessException {
		Map<String, Object> hobbyList = new HashMap<>();
				
		List<HobbyDTO> AllhobbyList = hobbyDAO.selectAllHobbyList();
		List<HobbyDTO> MyhobbyList = hobbyDAO.selectMyHobbyList(mem_id);
		
		hobbyList.put("AllhobbyList", AllhobbyList);
		hobbyList.put("MyhobbyList", MyhobbyList);
		
		return hobbyList;
	}

	@Override
	public Map<String, Object> listHobbysub(HashMap<String, String> codeList,String mem_id) throws DataAccessException {
		Map<String, Object> hobbysubList = new HashMap<>();
		
		List<HobbysubDTO> chkHobbysubList = hobbyDAO.selectHobbysubList(codeList);
		List<HobbyDTO> myHobbysubList = hobbyDAO.selectMyHobbysubList(mem_id);
		
		hobbysubList.put("chkHobbysubList", chkHobbysubList);
		hobbysubList.put("myHobbysubList", myHobbysubList);
		return hobbysubList;
	}

	@Override
	public List<HobbysubDTO> listHobbysub2(String main_code) throws DataAccessException {
		List<HobbysubDTO> hobbysubList2 = hobbyDAO.selectHobbysubList2(main_code);
		return hobbysubList2;
	}
	
	public void memHobbyUpdate(String mem_id, Map<String, Object> memHobbyMap) throws DataAccessException {
		hobbyDAO.delMemHobby(mem_id);		
		hobbyDAO.updateMemHobby(memHobbyMap);
		
	}

	@Override
	public List<HobbysubDTO> selectSubHobbyList(String hobby_code) throws DataAccessException {
		return hobbyDAO.selectSubHobbyList(hobby_code);
	}
	
	@Override
	public List<HobbyDTO> listHobbys() throws DataAccessException {
		List<HobbyDTO> hobbyList = hobbyDAO.selectAllHobbyList();
		return hobbyList;
	}

	@Override
	public List<HobbysubDTO> listHobbysub(HashMap<String, String> codeList) throws DataAccessException {
		List<HobbysubDTO> hobbysubList = hobbyDAO.selectHobbysubList(codeList);
		return hobbysubList;
	}

}
