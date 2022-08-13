package kr.co.alto.club.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.area.dao.AreaDAO;
import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.club.dao.ClubDAO;
import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.mypage.dao.MypageDAO;
import kr.co.alto.mypage.dto.likeDTO;

@Service("clubService")
@Transactional(propagation = Propagation.REQUIRED)
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;
	@Autowired
	private HobbyDAO hobbyDAO;
	@Autowired
	private AreaDAO areaDAO;
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public Map<String, Object> clubMainList(String mem_id) throws DataAccessException {
		Map<String, Object> clubMainMap = new HashMap<>();
		
		List<HobbyDTO> AllHobbyList = hobbyDAO.selectAllHobbyList();
		
		List<ClubListDTO> bestClubList = clubDAO.selectBestClubList();
		List<ClubListDTO> newClubList = clubDAO.selectNewClubList();
		List<ClubListDTO> peoClubList = clubDAO.selectPeoClubList();
		
		System.out.println(mem_id);
		
		if (!mem_id.equals("")) {
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			clubMainMap.put("memlikeList", memlikeList);
		}		
		
		clubMainMap.put("peoClubList", peoClubList);
		clubMainMap.put("newClubList", newClubList);
		clubMainMap.put("bestClubList", bestClubList);
		clubMainMap.put("AllHobbyList", AllHobbyList);
		
		return clubMainMap;
	}
	
	@Override
	public Map<String, Object> clubSearchList(String mem_id) throws DataAccessException {
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		List<HobbyDTO> allHobbyList = hobbyDAO.selectAllHobbyList();
		List<AreaDTO> allAreaList = areaDAO.selectAllAreaList();
		
		List<HobbyDTO> myHobbyList = mypageDAO.selectHobbyList(mem_id);
		List<AreaDTO> myAreaList = mypageDAO.selectMyAreaList(mem_id);
		
		
		clubSearchMap.put("allHobbyList", allHobbyList);
		clubSearchMap.put("allAreaList", allAreaList);
		clubSearchMap.put("myHobbyList", myHobbyList);
		clubSearchMap.put("myAreaList", myAreaList);
		
		return clubSearchMap;
		
	}

	@Override
	public void clubOpen(ClubDTO clubDTO) throws DataAccessException {

		String club_code = clubDAO.selectNewClubCode();
		
		clubDTO.setClub_code(club_code);
		
		clubDAO.clubOpen(clubDTO);
	}
}
