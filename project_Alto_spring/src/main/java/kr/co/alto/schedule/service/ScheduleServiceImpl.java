package kr.co.alto.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.schedule.dao.ScheduleDAO;
import kr.co.alto.schedule.dto.PromiseDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;

@Service("scheduleService")
@Transactional(propagation = Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public Map<String, Object> listSchedule(Map<String, Object> pagingMap) throws Exception {
		Map<String, Object> scheduleMap = new HashMap<>();
		
		List<ScheduleDTO> scheduleList = scheduleDAO.selectAllScheduleList(pagingMap);
		
		String club_code = (String) pagingMap.get("club_code");
		int totSchedule = scheduleDAO.selectTotSchedule(club_code);
		
		scheduleMap.put("scheduleList", scheduleList);
		scheduleMap.put("totSchedule", totSchedule);
			
		return scheduleMap;
	}

	@Override
	public int addNewSchedule(Map scheduleMap) throws Exception {
		int schedule_code = scheduleDAO.insertNewSchedule(scheduleMap);		
		
		return schedule_code;
	}	

	@Override
	public Map<String, Object> viewSchedule(Map<String, Object> viewMap) throws Exception {
		int schedule_code = (int) viewMap.get("schedule_code");
		String mem_id = (String) viewMap.get("mem_id");		

		ScheduleDTO scheduleDTO = scheduleDAO.selectSchedule(schedule_code);
				
		Map<String, Object> scheduleMap = new HashMap<>();
		scheduleMap.put("schedule", scheduleDTO);
		
		return scheduleMap;
	}
	
	@Override
	public void modSchedule(Map<String, Object> scheduleMap) throws Exception {
		scheduleDAO.updateSchedule(scheduleMap);		
	}	

	@Override
	public void removeSchedule(String schedule_code) throws Exception {
		scheduleDAO.deleteSchedule(schedule_code);		
	}

	@Override
	public ScheduleDTO selectMainSchedule(String club_code) throws Exception {
		return scheduleDAO.selectMainSchedule(club_code);
	}

	@Override
	public void promiseIn(Map<String, Object> promiseMap) throws Exception {
		scheduleDAO.promiseIn(promiseMap);
	}

	@Override
	public List<PromiseDTO> selectMainPromiseList(String schedule_code) throws Exception {
		return scheduleDAO.selectPromiseList(schedule_code);
	}

}
