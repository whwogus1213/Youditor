package com.good.dto;

public class MessageSearch extends Search {
	private int accountId;

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	@Override
	public String toString() {
		return "MessageSearch [accountId=" + accountId + "]";
	}
	
}
