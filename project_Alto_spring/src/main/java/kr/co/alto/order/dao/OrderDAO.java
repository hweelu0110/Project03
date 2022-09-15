package kr.co.alto.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

public interface OrderDAO {

	public GoodsDTO getOrderClassInfo(String goods_code) throws DataAccessException;
	public GoodsDTO getOrderItemInfo(String goods_code) throws DataAccessException;
	public int addNewOrder(OrderDTO od) throws DataAccessException;
	public int addNewOrderItem(List<GoodsDTO> orders) throws DataAccessException;
	public OrderDTO orderInfo(String mem_id) throws DataAccessException;
	public int quanCheck(List result) throws DataAccessException;

	public List<OrderDTO> selectOrderList(Map listMap) throws DataAccessException;
	public List<GoodsDTO> selectGoodsList(int orderId) throws DataAccessException;
	public int countList(String mem_id);
}
