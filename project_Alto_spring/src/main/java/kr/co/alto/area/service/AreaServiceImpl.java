package kr.co.alto.area.service;

import java.util.List;

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
	public List<AreaDTO> listAreas() throws DataAccessException {
		List<AreaDTO> areaList = areaDAO.selectAllAreaList();
		return areaList;
	}

}
