package kr.co.alto.order.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.order.dto.GoodsDTO;

public interface OrderService {

	List getOrderListInfo(List<GoodsDTO> orders) throws Exception;

}
