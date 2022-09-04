package kr.co.alto.board.dto;
 
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

/*
 * noticeFileNO number(10) PRIMARY KEY
	,noticeFileName varchar2(50)
	,regDate DATE DEFAULT sysdate 
	,notice_num number(10) 
 */
public class FileDTO {
	private int fileNO;
	private String fileName;
	private Date regDate;
	private int notice_num;
	
	public int getFileNO() {
		return fileNO;
	}
	public void setFileNO(int fileNO) {
		this.fileNO = fileNO;
	}
	public String getFileName() {
		if (fileName != null && fileName.length() != 0) {
			try {
				fileName = URLDecoder.decode(fileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fileName;
	}
	public void setFileName(String fileName) {
		if(fileName != null && fileName.length() != 0) {
			try {
				this.fileName = URLEncoder.encode(fileName, "UTF-8");
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
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	
	
	
	
}
