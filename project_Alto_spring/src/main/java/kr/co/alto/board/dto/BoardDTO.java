package kr.co.alto.board.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*
  	club_code char(8) NOT NULL
	,notice_num NUMBER NOT NULL PRIMARY key
	,category varchar2(10) NOT NULL
	,title varchar2(200) NOT NULL
	,contents varchar2(2000) NOT NULL
	,mem_id varchar2(100) NOT NULL
	,FileName varchar2(200) 
	,comment_num NUMBER DEFAULT 0
	,like_num NUMBER DEFAULT 0
	,regidate DATE DEFAULT sysdate NOT NULL
	,score NUMBER DEFAULT 0
 */
@Component("boardDTO")
public class BoardDTO {
	private String club_code;
	private int notice_num;
	private String category;
	private String title;
	private String contents;
	private String mem_id;
	private String FileName;
	private int comment_num;
	private int like_num;
	private Date regidate;
	private int score;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(String club_code, int notice_num, String category, String title, String contents, String mem_id,
			String fileName, int comment_num, int like_num, Date regidate, int score) {
		super();
		this.club_code = club_code;
		this.notice_num = notice_num;
		this.category = category;
		this.title = title;
		this.contents = contents;
		this.mem_id = mem_id;
		FileName = fileName;
		this.comment_num = comment_num;
		this.like_num = like_num;
		this.regidate = regidate;
		this.score = score;
	}

	public String getClub_code() {
		return club_code;
	}

	public void setClub_code(String club_code) {
		this.club_code = club_code;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	
	
}
