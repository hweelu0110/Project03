package kr.co.alto.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

public interface OrderDAO {

	GoodsDTO getOrderClassInfo(String goods_code) throws DataAccessException;
	GoodsDTO getOrderItemInfo(String goods_code) throws DataAccessException;
	int addNewOrder(OrderDTO od) throws DataAccessException;
	int addNewOrderItem(List<GoodsDTO> orders) throws DataAccessException;
	OrderDTO orderInfo(String mem_id) throws DataAccessException;
	int quanCheck(List result) throws DataAccessException;

}
