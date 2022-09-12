package kr.co.alto.order.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

public interface OrderService {

	List getOrderListInfo(List<GoodsDTO> orders) throws Exception;

	int addNewOrder(OrderDTO od) throws Exception;

}
