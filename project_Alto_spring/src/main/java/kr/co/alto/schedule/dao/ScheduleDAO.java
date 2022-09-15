package kr.co.alto.schedule.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.schedule.dto.PromiseDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;

public interface ScheduleDAO {
	
	public List<ScheduleDTO> selectAllScheduleList(Map<String, Object> pagingMap)  throws DataAccessException;
	public int selectTotSchedule(String club_code)  throws DataAccessException;
	
	public int insertNewSchedule(Map scheduleMap) throws DataAccessException;	

	public ScheduleDTO selectSchedule(int schedule_code) throws DataAccessException;	

	public void updateSchedule(Map<String, Object> scheduleMap) throws DataAccessException;

	public void deleteSchedule(String schedule_code) throws DataAccessException;
	
	public ScheduleDTO selectMainSchedule(String club_code) throws DataAccessException;
	
	public int selectNewPromNo() throws DataAccessException;
	
	public void insertMemberIn(Map scheduleMap) throws DataAccessException;
	
	public void promiseIn(Map<String, Object> promiseMap) throws DataAccessException;
	
	public List<PromiseDTO> selectPromiseList(String schedule_code) throws DataAccessException;

}
