package com.good.dto;

import java.util.Date;

public class NoticeBoardVO {
	private int boardId;
	private int accountId;
	private int categoryId;
	private String subject;
	private String object;
	private Date reg_date;
	private Date mod_date;
	private int viewCount;

	private String nickname;

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

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	public final int getViewCount() {
		return viewCount;
	}

	public final void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	
	public final String getNickname() {
		return nickname;
	}

	public final void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [boardId=" + boardId + ", accountId=" + accountId + ", categoryId=" + categoryId
				+ ", subject=" + subject + ", object=" + object + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", viewCount=" + viewCount + "]";
	}
} // End - public class NoticeBoardVO
