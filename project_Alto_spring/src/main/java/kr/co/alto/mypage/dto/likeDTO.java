package kr.co.alto.mypage.dto;

public class likeDTO {
	private String Like_code;
	private String club_code;
	private String class_code;
	private String item_code;
	
	public likeDTO() {}

	public String getLike_code() {
		return Like_code;
	}

	public void setLike_code(String like_code) {
		Like_code = like_code;
	}

	public String getClub_code() {
		return club_code;
	}

	public void setClub_code(String club_code) {
		this.club_code = club_code;
	}

	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	
	

}
