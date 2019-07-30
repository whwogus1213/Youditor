package com.good.dto;

public class MessageList extends MessageVO {
	private String nickname;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
