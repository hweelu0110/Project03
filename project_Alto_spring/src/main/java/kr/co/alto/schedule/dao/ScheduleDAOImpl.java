package kr.co.alto.schedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.schedule.dto.PromiseDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;

@Repository("scheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO {
	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public int insertNewSchedule(Map scheduleMap) throws DataAccessException {
		int schedule_code  = selectNewScheduleNo();
		int promiseNo = selectNewPromNo();
				
		scheduleMap.put("schedule_code", schedule_code);
		scheduleMap.put("promiseNo", promiseNo);
		sqlSession.insert("mapper.schedule.insertNewSchedule", scheduleMap);
		sqlSession.insert("mapper.schedule.insertManagerIn", scheduleMap);
		
		return schedule_code;		
	}

	private int selectNewScheduleNo() {
		return sqlSession.selectOne("mapper.schedule.selectNewScheduleNo");
	}	

	@Override
	public ScheduleDTO selectSchedule(int schedule_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.schedule.selectSchedule", schedule_code);
	}
		
	@Override
	public void updateSchedule(Map<String, Object> scheduleMap) throws DataAccessException {
		sqlSession.update("mapper.schedule.updateSchedule", scheduleMap);
		
	}
	
	@Override
	public void deleteSchedule(String schedule_code) throws DataAccessException {
		sqlSession.delete("mapper.schedule.deleteSchedule", schedule_code);
		sqlSession.delete("mapper.schedule.deletePromise", schedule_code);
	}
	
	@Override
	public List<ScheduleDTO> selectAllScheduleList(Map<String, Object> pagingMap) throws DataAccessException {
		List<ScheduleDTO> SchedulesList = sqlSession.selectList("mapper.schedule.selectAllScheduleList", pagingMap);
		return SchedulesList;
	}

	@Override
	public int selectTotSchedule(String club_code) throws DataAccessException {		
		int totSchedules = sqlSession.selectOne("mapper.schedule.selectTotSchedule", club_code);
		return totSchedules;
	}

	@Override
	public ScheduleDTO selectMainSchedule(String club_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.schedule.selectMainSchedule", club_code);
	}

	@Override
	public int selectNewPromNo() throws DataAccessException {
		return sqlSession.selectOne("mapper.schedule.selectNewPromNo");
	}
	
	@Override
	public void insertMemberIn(Map scheduleMap) throws DataAccessException {
		sqlSession.insert("mapper.schedule.insertMemberIn", scheduleMap);
	}

	@Override
	public void promiseIn(Map<String, Object> promiseMap) throws DataAccessException {
		int promiseNo = selectNewPromNo();
		String schedule_code = (String) promiseMap.get("schedule_code");
		
		System.out.println("schedule_code?? "+schedule_code );
		
		promiseMap.put("promiseNo", promiseNo);
		sqlSession.insert("mapper.schedule.insertMemberIn", promiseMap);
		sqlSession.update("mapper.schedule.addMemCount", schedule_code);
	}

	@Override
	public List<PromiseDTO> selectPromiseList(String schedule_code) throws DataAccessException {
		return sqlSession.selectList("mapper.schedule.selectPromiseList", schedule_code);
	}
	
}
