package com.good.dto;

import java.util.Date;

public class ReplyVO {
	private int commentId;
	private int accountId;
	private int boardId;
	private String object;
	private int replyCommentId;
	private Date reg_date;
	private Date mod_date;
	private String boardClass;

	private int countReply;
	private String nickname;

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

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBoardClass() {
		return boardClass;
	}

	public void setBoardClass(String boardClass) {
		this.boardClass = boardClass;
	}

	@Override
	public String toString() {
		return "ReplyVO [commentId=" + commentId + ", accountId=" + accountId + ", boardId=" + boardId + ", object="
				+ object + ", replyCommentId=" + replyCommentId + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", boardClass=" + boardClass + ", countReply=" + countReply + ", nickname=" + nickname + "]";
	}


}
