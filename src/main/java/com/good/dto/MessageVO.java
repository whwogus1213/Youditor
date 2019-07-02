package com.good.dto;

import java.util.Date;

public class MessageVO {
	private int messageId;
	private int callerAccountId;
	private int receiverAccountId;
	private String subject;
	private String object;
	private Date send_date;
	private Date read_date;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public int getCallerAccountId() {
		return callerAccountId;
	}

	public void setCallerAccountId(int callerAccountId) {
		this.callerAccountId = callerAccountId;
	}

	public int getReceiverAccountId() {
		return receiverAccountId;
	}

	public void setReceiverAccountId(int receiverAccountId) {
		this.receiverAccountId = receiverAccountId;
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

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public Date getRead_date() {
		return read_date;
	}

	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}

} // End - MessageVO
