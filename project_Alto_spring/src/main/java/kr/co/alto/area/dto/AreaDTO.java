package kr.co.alto.area.dto;

import org.springframework.stereotype.Component;

@Component("areaDTO")
public class AreaDTO {
	private String area_code;
	private String name;
	
	public AreaDTO() {}
	
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
