package com.good.dto;

import java.util.Date;

public class TipBoardVO {
	private int boardId;
	private int accountId;
	private int categoryId;
	private String subject;
	private String object;
	private Date reg_date;
	private String mod_date;
	private int viewCount;
	private float starCount;
	
	private String nickname;
	private String categoryName;
	private String picture;
	
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

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getMod_date() {
		return mod_date;
	}

	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public final String getNickname() {
		return nickname;
	}

	public final void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	public final String getCategoryName() {
		return categoryName;
	}

	public final void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
	public float getStarCount() {
		return starCount;
	}

	public void setStarCount(float starCount) {
		this.starCount = starCount;
	}

	
	public final String getPicture() {
		return picture;
	}

	public final void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "TipBoardVO [boardId=" + boardId + ", accountId=" + accountId + ", categoryId=" + categoryId
				+ ", subject=" + subject + ", object=" + object + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", viewCount=" + viewCount + ", starCount=" + starCount + ", nickname=" + nickname + ", categoryName="
				+ categoryName + "]";
	}

	
	
} // End - public class TipBoardVO
