package kr.co.alto.hobby.dto;

import org.springframework.stereotype.Component;

@Component("hobbysubDTO")
public class HobbysubDTO {
	private String hobby_sub_code;
	private String hobby_code;
	private String name;
	
	public HobbysubDTO() {}

	public String getHobby_sub_code() {
		return hobby_sub_code;
	}

	public void setHobby_sub_code(String hobby_sub_code) {
		this.hobby_sub_code = hobby_sub_code;
	}

	public String getHobby_code() {
		return hobby_code;
	}

	public void setHobby_code(String hobby_code) {
		this.hobby_code = hobby_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
