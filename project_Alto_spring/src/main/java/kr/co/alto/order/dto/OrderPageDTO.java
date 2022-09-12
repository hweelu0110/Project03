package kr.co.alto.order.dto;

import java.util.List;

public class OrderPageDTO {
	
	private List<GoodsDTO> orders;

	public List<GoodsDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<GoodsDTO> orders) {
		this.orders = orders;
	}
	
}
