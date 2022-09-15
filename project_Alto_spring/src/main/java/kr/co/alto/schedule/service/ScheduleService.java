package kr.co.alto.schedule.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.schedule.dto.PromiseDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;

public interface ScheduleService {
	
	public Map<String, Object> listSchedule(Map<String, Object> pagingMap) throws Exception;
	
	public int addNewSchedule(Map scheduleMap) throws Exception;
		
	public Map<String, Object> viewSchedule(Map<String, Object> viewMap) throws Exception;

	public void modSchedule(Map<String, Object> scheduleMap) throws Exception;

	public void removeSchedule(String schedule_code) throws Exception;

	public ScheduleDTO selectMainSchedule(String club_code) throws Exception;

	public void promiseIn(Map<String, Object> promiseMap) throws Exception;

	public List<PromiseDTO> selectMainPromiseList(String schedule_code) throws Exception;
	
}
