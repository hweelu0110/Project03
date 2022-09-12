package kr.co.alto.order.dto;

public class GoodsDTO {

	/*뷰에서 넘길 값*/
	private String goods_type;
	private String goods_code;
	private int quantity;
	
	/*DB에서 가져올 값*/
	private String goods_name;
	private int price;
	
	/* 계산 할 값*/
	private int totalPrice;

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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public void initTotalPrice() {
		this.totalPrice = this.price * this.quantity;
	}
	
	@Override
	public String toString() {
		return "GoodsDTO [goods_type:"+goods_type+", goods_code:"+goods_code+", quantity:"+quantity+", goods_name:"+goods_name+"price:"+price ;
	}
}
