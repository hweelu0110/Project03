package kr.co.alto.album.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

/*
 	imageFileNO number(10) PRIMARY KEY
	,imageFileName varchar2(50)
	,regDate DATE DEFAULT sysdate 
	,album_num  number(10) 
 */
public class ImageDTO {
	private int imageFileNo;
	private String imageFileName;
	private Date regDate;
	private int album_num;
	
	public int getImageFileNo() {
		return imageFileNo;
	}
	
	public void setImageFileNo(int imageFileNo) {
		this.imageFileNo = imageFileNo;
	}
	
	public String getImageFileName() {
		if (imageFileName != null && imageFileName.length() != 0) {
			try {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return imageFileName;
	}
	
	public void setImageFileName(String imageFileName) {
		if(imageFileName != null && imageFileName.length() != 0) {
			try {
				this.imageFileName = URLEncoder.encode(imageFileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getAlbum_num() {
		return album_num;
	}
	
	public void setAlbum_num(int album_num) {
		this.album_num = album_num;
	}
	
	
}
