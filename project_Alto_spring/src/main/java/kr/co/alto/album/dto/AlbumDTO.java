package kr.co.alto.album.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*
 	club_code CHAR(8) NOT NULL
	,album_num NUMBER NOT NULL
	,title VARCHAR2(200) NOT NULL
	,contents VARCHAR2(2000) NOT NULL
	,mem_id VARCHAR2(100) NOT NULL
	,imageFileName VARCHAR2(200) NOT NULL
	,comment_num NUMBER DEFAULT 0
	,like_num NUMBER DEFAULT 0
	,regidate DATE DEFAULT sysdate NOT NULL
	,score NUMBER DEFAULT 0
 */
@Component("albumDTO")
public class AlbumDTO {
	private int club_code;
	private int album_num;
	private String title;
	private String contents;
	private String mem_id;
	private String imageFileName;
	private int comment_num;
	private int like_num;
	private Date regidate;
	private int score;
	
	public AlbumDTO() {
		// TODO Auto-generated constructor stub
	}

	public AlbumDTO(int club_code, int album_num, String title, String contents, String mem_id, String imageFileName,
			int comment_num, int like_num, Date regidate, int score) {
		//super();
		this.club_code = club_code;
		this.album_num = album_num;
		this.title = title;
		this.contents = contents;
		this.mem_id = mem_id;
		this.imageFileName = imageFileName;
		this.comment_num = comment_num;
		this.like_num = like_num;
		this.regidate = regidate;
		this.score = score;
	}

	public int getClub_code() {
		return club_code;
	}

	public void setClub_code(int club_code) {
		this.club_code = club_code;
	}

	public int getAlbum_num() {
		return album_num;
	}

	public void setAlbum_num(int album_num) {
		this.album_num = album_num;
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

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
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
