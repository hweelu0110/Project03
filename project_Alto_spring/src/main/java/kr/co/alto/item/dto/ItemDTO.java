package kr.co.alto.item.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*
	item_code		char(8)			PRIMARY KEY,
	hobby_code		char(8)			NOT NULL,
	hobby_sub_code	char(8),
	item_name		varchar2(100)	NOT NULL,
	price			NUMBER			NOT NULL,
	regidate		DATE			DEFAULT sysdate NOT NULL,
	imgName			varchar2(500),
	intro			varchar2(1000)	NOT NULL,
	item_count		NUMBER			DEFAULT 0 NOT NULL,
	quantity		NUMBER			NOT NULL
*/
@Component("itemDTO")
public class ItemDTO {
	
	private String item_code;
	private String hobby_code;
	private String hobby_sub_code;
	private String hobby_name;
	private String hobby_sub_name;
	private String item_name;
	private int item_count;
	private int quantity;
	private int price;
	private String imgName;
	private String intro;
	private Date regidate;
	private String manager;
	
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getHobby_code() {
		return hobby_code;
	}
	public void setHobby_code(String hobby_code) {
		this.hobby_code = hobby_code;
	}
	public String getHobby_sub_code() {
		return hobby_sub_code;
	}
	public void setHobby_sub_code(String hobby_sub_code) {
		this.hobby_sub_code = hobby_sub_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getHobby_name() {
		return hobby_name;
	}
	public void setHobby_name(String hobby_name) {
		this.hobby_name = hobby_name;
	}
	public String getHobby_sub_name() {
		return hobby_sub_name;
	}
	public void setHobby_sub_name(String hobby_sub_name) {
		this.hobby_sub_name = hobby_sub_name;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	
	
}
