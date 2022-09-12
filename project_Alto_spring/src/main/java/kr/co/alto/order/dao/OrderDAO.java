package kr.co.alto.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.order.dto.GoodsDTO;

public interface OrderDAO {

	GoodsDTO getOrderClassInfo(String goods_code) throws DataAccessException;
	GoodsDTO getOrderItemInfo(String goods_code) throws DataAccessException;

}
