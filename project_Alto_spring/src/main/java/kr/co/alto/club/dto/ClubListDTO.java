package kr.co.alto.club.dto;

import java.sql.Date;

public class ClubListDTO {
	private String club_code;
	private String title;
	private String cate_m;
	private String cate_m_name;
	private String cate_s;
	private String cate_s_name;
	private String area_name;
	private String member_num;
	private String img;
	private String schedule;
	private String place;
	private String manager;
	private String regidate;
	
	public ClubListDTO() {}

	public String getClub_code() {
		return club_code;
	}

	public void setClub_code(String club_code) {
		this.club_code = club_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCate_m() {
		return cate_m;
	}

	public void setCate_m(String cate_m) {
		this.cate_m = cate_m;
	}

	public String getCate_s() {
		return cate_s;
	}

	public void setCate_s(String cate_s) {
		this.cate_s = cate_s;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getCate_m_name() {
		return cate_m_name;
	}

	public void setCate_m_name(String cate_m_name) {
		this.cate_m_name = cate_m_name;
	}

	public String getCate_s_name() {
		return cate_s_name;
	}

	public void setCate_s_name(String cate_s_name) {
		this.cate_s_name = cate_s_name;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
}
