package com.good.dto;

import java.util.Date;

public class RecruitCommentVO {
	private int commentId;
	private int accountId;
	private int boardId;
	private String object;
	private int replyCommentId;
	private Date reg_date;
	private Date mod_date;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public int getReplyCommentId() {
		return replyCommentId;
	}

	public void setReplyCommentId(int replyCommentId) {
		this.replyCommentId = replyCommentId;
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

} // End - RecruitCommentVO
