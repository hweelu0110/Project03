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
import kr.co.alto.club.dto.JoinDTO;
import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;
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
		
		if (!mem_id.equals("")) {
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			clubMainMap.put("memlikeList", memlikeList);
		}
		
		List<ClubListDTO> bestClubList = clubDAO.selectBestClubList();
		List<ClubListDTO> newClubList = clubDAO.selectNewClubList();
		List<ClubListDTO> peoClubList = clubDAO.selectPeoClubList();
		
		List<HashMap<String, Object>> topHobby = clubDAO.selectTopHobby();	
		
		for (int i=0; i<topHobby.size(); i++) {
			String hobby_code = (String) topHobby.get(i).get("CATE_M");
			List<ClubListDTO> topHobbyList = clubDAO.selectTopHobbyList(hobby_code);
			clubMainMap.put("topHobbyList"+i, topHobbyList);
		}
		
		clubMainMap.put("topHobby", topHobby);
		clubMainMap.put("AllHobbyList", AllHobbyList);
		clubMainMap.put("bestClubList", bestClubList);
		clubMainMap.put("newClubList", newClubList);
		clubMainMap.put("peoClubList", peoClubList);
		
		return clubMainMap;
	}
	
	@Override
	public Map<String, Object> clubSearchList() throws DataAccessException {
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		List<HobbyDTO> allHobbyList = hobbyDAO.selectAllHobbyList();
		List<AreaDTO> allAreaList = areaDAO.selectAllAreaList();				
		
		clubSearchMap.put("allHobbyList", allHobbyList);
		clubSearchMap.put("allAreaList", allAreaList);
		
		return clubSearchMap;
		
	}
	
	@Override
	public Map<String, Object> selectHobClubList(String hobby_code) throws DataAccessException {
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		List<HobbyDTO> allHobbyList = hobbyDAO.selectAllHobbyList();
		List<AreaDTO> allAreaList = areaDAO.selectAllAreaList();
		
		List<ClubListDTO> hobClubList = clubDAO.selectHobClubList(hobby_code);
		
		
		clubSearchMap.put("allHobbyList", allHobbyList);
		clubSearchMap.put("allAreaList", allAreaList);
		clubSearchMap.put("hobClubList", hobClubList);
		
		return clubSearchMap;
	}

	@Override
	public Map<String, Object> selectClubInfo(String club_code) throws DataAccessException {
		Map<String, Object> clubInfoMap = new HashMap<>();
		
		ClubDTO clubInfo = clubDAO.selectClubInfo(club_code);
		List<JoinDTO> clubMemberList = clubDAO.selectClubMemberList(club_code);
		
		clubInfoMap.put("clubInfo", clubInfo);
		clubInfoMap.put("clubMemberList", clubMemberList);
		
		return clubInfoMap;
	}
	
	@Override
	public String clubOpen(ClubDTO clubDTO) throws DataAccessException {

		String club_code = clubDAO.selectNewClubCode();
		String join_code = clubDAO.selectNewJoinCode();
		System.out.println("new club_code: "+ club_code);		
		
		Map<String, Object> joinMap = new HashMap<>();
		
		clubDTO.setClub_code(club_code);
		
		clubDAO.clubOpen(clubDTO);
		
		joinMap.put("join_code", join_code);
		joinMap.put("club_code", club_code);
		joinMap.put("mem_id", clubDTO.getManager());
		joinMap.put("manager", 'Y');	
				
		clubDAO.clubManagerJoin(joinMap);
		clubDAO.addClubMemberNum(club_code);
		
		return club_code;
		
	}

	@Override
	public void clubJoin(Map<String, Object> joinMap) throws DataAccessException {
		String join_code = clubDAO.selectNewJoinCode();
		
		joinMap.put("join_code", join_code);
		String club_code = (String) joinMap.get("club_code");
		
		clubDAO.clubJoin(joinMap);
		clubDAO.addClubMemberNum(club_code);
	}

	@Override
	public void clubOut(Map<String, Object> joinMap) throws DataAccessException {
		String managerYN = clubDAO.chkManager(joinMap);
		String club_code = (String) joinMap.get("club_code");
				
		if (managerYN.equals("Y")) {
			//가입일이 빠른 회원 찾기
			String nextManagerId = clubDAO.nextManager(club_code);
			
			if (nextManagerId != null) {
				Map<String, Object> manager = new HashMap<>();
				manager.put("mem_id", nextManagerId);
				manager.put("club_code", club_code);
				//모임장 변경하기
				clubDAO.changeManagerJoin(manager);
				clubDAO.changeManagerClub(manager);
			}else {
				//다른 회원이 없는 경우 모임 삭제하기
				clubDAO.deleteClub(club_code);
			}
			
		}		
		clubDAO.clubOut(joinMap);
		
		clubDAO.minClubMemberNum(club_code);
		clubDAO.addOutCount(club_code);
	}

	@Override
	public String selectClubHobbyCode(String club_code) throws DataAccessException {
		return clubDAO.selectClubHobbyCode(club_code);
	}

	@Override
	public void clubInfoEdit(Map<String, Object> clubInfoMap) throws DataAccessException {
		clubDAO.clubUpdate(clubInfoMap);
	}

	@Override
	public String chkClubLikeYN(Map<String, Object> likeChk) throws DataAccessException {
		return clubDAO.chkClubLikeYN(likeChk);
	}
	
	@Override
	public List<ClubDTO> keywordClub(String keyword) throws Exception {
		return clubDAO.keywordClub(keyword);
	}
	
}
