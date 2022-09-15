package kr.co.alto.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.order.dao.OrderDAO;
import kr.co.alto.order.dto.GoodsDTO;
import kr.co.alto.order.dto.OrderDTO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List getOrderListInfo(List<GoodsDTO> orders) throws Exception {
		List result = new ArrayList<>();
		
		for(GoodsDTO goods : orders) {
			if(goods.getGoods_type().equals("class")){
				GoodsDTO goodsInfo = orderDAO.getOrderClassInfo(goods.getGoods_code());
				goodsInfo.setGoods_type(goods.getGoods_type());
				goodsInfo.setQuantity(goods.getQuantity());
				goodsInfo.initTotalPrice();
				
				result.add(goodsInfo);
			} else if(goods.getGoods_type().equals("item")) {
				GoodsDTO goodsInfo = orderDAO.getOrderItemInfo(goods.getGoods_code());
				goodsInfo.setGoods_type(goods.getGoods_type());
				goodsInfo.setQuantity(goods.getQuantity());
				goodsInfo.initTotalPrice();
				
				result.add(goodsInfo);
			}
		}
		return result;
	}

	@Override
	public int addNewOrder(OrderDTO od) throws Exception {
		
		int NewOrderInfo = orderDAO.addNewOrder(od);
		
		List result = new ArrayList<>();
		
		for(GoodsDTO goods : od.getOrders()) {
			if(goods.getGoods_type().equals("class")){
				GoodsDTO goodsInfo = orderDAO.getOrderClassInfo(goods.getGoods_code());
				goodsInfo.setGoods_type(goods.getGoods_type());
				goodsInfo.setQuantity(goods.getQuantity());
				goodsInfo.setOrderId(NewOrderInfo);
				goodsInfo.initTotalPrice();
				
				result.add(goodsInfo);
			} else if(goods.getGoods_type().equals("item")) {
				GoodsDTO goodsInfo = orderDAO.getOrderItemInfo(goods.getGoods_code());
				goodsInfo.setGoods_type(goods.getGoods_type());
				goodsInfo.setQuantity(goods.getQuantity());
				goodsInfo.setOrderId(NewOrderInfo);
				goodsInfo.initTotalPrice();
				
				result.add(goodsInfo);
			}
		}
		
		int NewOrderItem = orderDAO.addNewOrderItem(result);
		int quanCheck = orderDAO.quanCheck(result);
		
		return NewOrderItem;
	}

	@Override
	public OrderDTO orderInfo(String mem_id) throws Exception {
		return orderDAO.orderInfo(mem_id);
	}

	@Override
	public List<OrderDTO> selectOrderList(Map listMap) throws Exception {

		List<OrderDTO> orderList = orderDAO.selectOrderList(listMap);
		
		for(OrderDTO order : orderList) {
			List<GoodsDTO> goodsList = orderDAO.selectGoodsList(order.getOrderId());
			order.setOrders(goodsList);
		}
		
		return orderList;
	}
	
	public int countListTotal(String mem_id) {
		return orderDAO.countList(mem_id);
	}
}
