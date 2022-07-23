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
	private int noticeFileNO;
	private String noticeFileName;
	private Date regDate;
	private int notice_num;
	public int getNoticeFileNO() {
		return noticeFileNO;
	}
	public void setNoticeFileNO(int noticeFileNO) {
		this.noticeFileNO = noticeFileNO;
	}
	public String getNoticeFileName() {
		if (noticeFileName != null && noticeFileName.length() != 0) {
			try {
				noticeFileName = URLDecoder.decode(noticeFileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return noticeFileName;
	}
	public void setNoticeFileName(String noticeFileName) {
		if (noticeFileName != null && noticeFileName.length() != 0) {
			try {
				this.noticeFileName = URLEncoder.encode(noticeFileName, "UTF-8");
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
