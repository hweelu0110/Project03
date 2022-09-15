package kr.co.alto.order.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

public interface OrderService {

	public List getOrderListInfo(List<GoodsDTO> orders) throws Exception;

	public int addNewOrder(OrderDTO od) throws Exception;

	public OrderDTO orderInfo(String mem_id) throws Exception;

	public List<OrderDTO> selectOrderList(Map listMap) throws Exception;
	public int countListTotal(String mem_id);
}
