package kr.co.alto.schedule.dto;


public class PromiseDTO {
	private String promiseNo;
	private String club_code;
	private String schedule_code;
	private String mem_id;
	private String mem_name;
	private String img;
	private String manager;
	private String regdate;
	
	public PromiseDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPromiseNo() {
		return promiseNo;
	}

	public void setPromiseNo(String promiseNo) {
		this.promiseNo = promiseNo;
	}

	public String getClub_code() {
		return club_code;
	}

	public void setClub_code(String club_code) {
		this.club_code = club_code;
	}

	public String getSchedule_code() {
		return schedule_code;
	}

	public void setSchedule_code(String schedule_code) {
		this.schedule_code = schedule_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
}
