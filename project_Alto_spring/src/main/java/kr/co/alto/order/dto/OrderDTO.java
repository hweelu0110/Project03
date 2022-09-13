package kr.co.alto.order.dto;

import java.sql.Date;
import java.util.List;

public class OrderDTO {

	private int orderId;
	private String memberId;
	private String zipcode;
	private String address;
	private String dis_address;
	private String orderState;
	private List<GoodsDTO> orders;
	private Date orderDate;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int newOrderInfo) {
		this.orderId = newOrderInfo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDis_address() {
		return dis_address;
	}
	public void setDis_address(String dis_address) {
		this.dis_address = dis_address;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public List<GoodsDTO> getOrders() {
		return orders;
	}
	public void setOrders(List<GoodsDTO> orders) {
		this.orders = orders;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [orderId:"+orderId+", memberId"+memberId+", zipcode"+zipcode+", address"+address+", dis_address"+dis_address+", orderState"+orderState+", orders"+orders+", orderDate"+orderDate ;
		
	}
}
