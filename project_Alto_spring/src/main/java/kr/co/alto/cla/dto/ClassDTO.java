package kr.co.alto.cla.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*
class_code		char(8)			PRIMARY KEY,
title			varchar2(100)	NOT NULL,
hobby_code		char(8)			NOT NULL,
hobby_sub_code	char(8),
area_code		char(8)			NOT NULL,
manager			varchar2(100)	NOT NULL,
member_num		NUMBER			DEFAULT 0 NOT NULL,
member_max		NUMBER			NOT NULL,
price			NUMBER			NOT NULL,
imgName			varchar2(500),
intro			varchar2(1000)	NOT NULL,
regidate		DATE			DEFAULT sysdate NOT NULL,
startdate		DATE			NOT NULL,
enddate			DATE			NOT NULL,
curriculum		varchar2(1000)	NOT NULL,
teacherInfo		varchar2(1000)	NOT NULL
*/
@Component("classDTO")
public class ClassDTO {
	
	private String class_code;
	private String className;
	private String hobby_code;
	private String hobby_sub_code;
	private String area_code;
	private String manager;
	private int member_num;
	private int member_max;
	private int price;
	private String imgName;
	private String intro;
	private Date regidate;
	private Date startdate;
	private Date enddate;
	private String curriculum;
	private String teacherInfo;
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getMember_max() {
		return member_max;
	}
	public void setMember_max(int member_max) {
		this.member_max = member_max;
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
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getCurriculum() {
		return curriculum;
	}
	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
	}
	public String getTeacherInfo() {
		return teacherInfo;
	}
	public void setTeacherInfo(String teacherInfo) {
		this.teacherInfo = teacherInfo;
	}
	
	
}
