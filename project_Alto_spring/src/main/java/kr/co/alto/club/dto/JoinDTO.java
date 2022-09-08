package kr.co.alto.club.dto;

import java.sql.Date;

public class JoinDTO {
	private	String join_code;
	private String mem_id;
	private String club_code;
	private String manager;
	private String bookmark;
	private Date regidate;
	private String img;
	private String name;
	
	public JoinDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getJoin_code() {
		return join_code;
	}

	public void setJoin_code(String join_code) {
		this.join_code = join_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getClub_code() {
		return club_code;
	}

	public void setClub_code(String club_code) {
		this.club_code = club_code;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
