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
	public void memHobbyUpdate(String mem_id, HashMap<String, Object> memHobbyList) throws DataAccessException {
		hobbyDAO.delMemHobby(mem_id);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("memHobbyList",memHobbyList);
		hobbyDAO.updateMemHobby(map);
		
	}

}
