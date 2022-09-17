package kr.co.alto.item.dto;

import java.sql.Date;

/*
cmt_num			number			PRIMARY KEY,
cmt_writer		varchar2(100)	NOT NULL,
cmt_star		number			NOT NULL,
cmt_content		varchar2(4000)	NOT NULL,
cmt_item		char(8)			NOT NULL,
cmt_regdate		DATE			DEFAULT sysdate NOT NULL
*/
public class ReviewDTO {

	private String cmt_num;
	private String cmt_writer;
	private String cmt_writer_name;
	private String cmt_star;
	private String cmt_content;
	private String cmt_item;
	private Date cmt_regdate;
	private String item_name;
	
	public String getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(String cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_writer() {
		return cmt_writer;
	}
	public void setCmt_writer(String cmt_writer) {
		this.cmt_writer = cmt_writer;
	}
	public String getCmt_star() {
		return cmt_star;
	}
	public void setCmt_star(String cmt_star) {
		this.cmt_star = cmt_star;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_item() {
		return cmt_item;
	}
	public void setCmt_class(String cmt_item) {
		this.cmt_item = cmt_item;
	}
	public Date getCmt_regdate() {
		return cmt_regdate;
	}
	public void setCmt_regdate(Date cmt_regdate) {
		this.cmt_regdate = cmt_regdate;
	}
	public String getCmt_writer_name() {
		return cmt_writer_name;
	}
	public void setCmt_writer_name(String cmt_writer_name) {
		this.cmt_writer_name = cmt_writer_name;
	}
	public void setCmt_item(String cmt_item) {
		this.cmt_item = cmt_item;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	
	
}
