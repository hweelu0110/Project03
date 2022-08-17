package kr.co.alto.area.service;

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

@Service("areaService")
@Transactional(propagation = Propagation.REQUIRED)
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaDAO areaDAO;

	@Override
	public Map<String, Object> listAreas(String mem_id) throws DataAccessException {
		Map<String, Object> areaList = new HashMap<>();
		
		List<AreaDTO> AllareaList = areaDAO.selectAllAreaList();
		List<AreaDTO> MyareaList = areaDAO.selectMyAreaList(mem_id);
		
		areaList.put("AllareaList", AllareaList);
		areaList.put("MyareaList", MyareaList);
		
		return areaList;
	}

	@Override
	public void memAreaUpdate(String mem_id, Map<String, Object> memAreaMap) throws DataAccessException {
		areaDAO.delMemArea(mem_id);		
		areaDAO.updateMemArea(memAreaMap);
	}

}
