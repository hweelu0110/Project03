package kr.co.alto.cla.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*
cmt_num			number			PRIMARY KEY,
cmt_writer		varchar2(100)	NOT NULL,
cmt_star		number			NOT NULL,
cmt_content		varchar2(4000)	NOT NULL,
cmt_class		char(8)			NOT NULL,
cmt_regdate		DATE			DEFAULT sysdate NOT NULL
*/
@Component("reviewDTO")
public class ReviewDTO {

	private String cmt_num;
	private String cmt_writer;
	private String cmt_writer_name;
	private String cmt_star;
	private String cmt_content;
	private String cmt_class;
	private Date cmt_regdate;
	private String className;
	
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
	public String getCmt_class() {
		return cmt_class;
	}
	public void setCmt_class(String cmt_class) {
		this.cmt_class = cmt_class;
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
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
