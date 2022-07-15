package kr.co.alto.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberDTO")
public class MemberDTO {
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String gender;
	private Date birth;
	private String phone;
	private String img;
	private String mem_open;
	private Date joinDate;
	private int authkey;
	private String memberId_yn;
	
	public MemberDTO() {}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMem_open() {
		return mem_open;
	}

	public void setMem_open(String mem_open) {
		this.mem_open = mem_open;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getAuthkey() {
		return authkey;
	}

	public void setAuthkey(int authkey) {
		this.authkey = authkey;
	}

	public String getMemberId_yn() {
		return memberId_yn;
	}

	public void setMemberId_yn(String memberId_yn) {
		this.memberId_yn = memberId_yn;
	}
	
}
