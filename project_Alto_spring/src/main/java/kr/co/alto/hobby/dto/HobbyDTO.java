package kr.co.alto.hobby.dto;

import org.springframework.stereotype.Component;

@Component("hobbyDTO")
public class HobbyDTO {
	private String hobby_code;
	private String name;
	
	public HobbyDTO() {}
	
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
