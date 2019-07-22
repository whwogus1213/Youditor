package com.good.dto;

import java.util.Date;

public class VideoStarVO {
	private int starId;
	private int boardId;
	private int accountId;
	private int star;
	private String reg_date;
	private String subject;
	private float starCount;
	
	private int viewCount;
	
	public int getStarId() {
		return starId;
	}

	public void setStarId(int starId) {
		this.starId = starId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	
	public float getStarCount() {
		return starCount;
	}

	public void setStarCount(float starCount) {
		this.starCount = starCount;
	}
	
	

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
		return "VideoStarVO [starId=" + starId + ", boardId=" + boardId + ", accountId=" + accountId + ", star=" + star
				+ ", reg_date=" + reg_date + ", subject=" + subject + ", starCount=" + starCount + ", viewCount="
				+ viewCount + "]";
	}

	

	
	
	
} // End - VideoStarVO
