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
	private int FileNO;
	private String FileName;
	private Date regDate;
	private int notice_num;
	public int getFileNO() {
		return FileNO;
	}
	public void setFileNO(int fileNO) {
		FileNO = fileNO;
	}
	public String getFileName() {
		if (FileName != null && FileName.length() != 0) {
			try {
				FileName = URLDecoder.decode(FileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return FileName;
	}
	public void setFileName(String fileName) {
		if(FileName != null && FileName.length() != 0) {
			try {
				this.FileName = URLEncoder.encode(FileName, "UTF-8");
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
