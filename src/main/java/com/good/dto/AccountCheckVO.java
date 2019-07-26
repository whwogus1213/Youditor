package com.good.dto;

public class AccountCheckVO {
	private int accountId;
	private int check;
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	@Override
	public String toString() {
		return "AccountCheck [accountId=" + accountId + ", check=" + check + "]";
	}
	
}
