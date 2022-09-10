package kr.co.alto.cart.dto;

import org.springframework.stereotype.Component;

/*
cart_num		number			PRIMARY KEY,
mem_id	 varchar2(100) NOT NULL,
goods_type		varchar2(100)	NOT NULL,
goods_code		char(8)			NOT NULL,
quantity		number			NOT NULL
*/
@Component("cartDTO")
public class CartDTO {

	private String cart_num;
	private String mem_id;
	private String goods_type;
	private String goods_code;
	private String quantity;
	private String className;
	private String item_name;
	private String price;
	
	
	public String getCart_num() {
		return cart_num;
	}
	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(String goods_type) {
		this.goods_type = goods_type;
	}
	public String getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
