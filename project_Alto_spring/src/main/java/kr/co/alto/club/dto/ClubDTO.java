package kr.co.alto.club.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("clubDTO")
public class ClubDTO {
	private	String club_code;
	private String title;
	private String cate_m;
	private String cate_s;
	private String area_code;
	private String manager;
	private String member_num;
	private String member_max;
	private String img;
	private String intro;
	private Date regidate;
	private String member_out;
	
	public ClubDTO() {}

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

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getMember_max() {
		return member_max;
	}

	public void setMember_max(String member_max) {
		this.member_max = member_max;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getMember_out() {
		return member_out;
	}

	public void setMember_out(String member_out) {
		this.member_out = member_out;
	}
	
	
}
