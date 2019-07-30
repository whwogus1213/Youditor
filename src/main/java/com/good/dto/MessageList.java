package com.good.dto;

public class MessageList extends MessageVO {
	private String nickname;
	private String picture;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	public final String getPicture() {
		return picture;
	}

	public final void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "MessageList [nickname=" + nickname + ", getNickname()=" + getNickname() + ", getMessageId()="
				+ getMessageId() + ", getSenderAccountId()=" + getSenderAccountId() + ", getReceiverAccountId()="
				+ getReceiverAccountId() + ", getSubject()=" + getSubject() + ", getObject()=" + getObject()
				+ ", getSend_date()=" + getSend_date() + ", getRead_date()=" + getRead_date() + ", getSenderView()="
				+ getSenderView() + ", getReceiverView()=" + getReceiverView() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
