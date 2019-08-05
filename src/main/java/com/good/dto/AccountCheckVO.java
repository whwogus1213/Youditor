package com.good.dto;

public class AccountCheckVO {
	private int accountId;
	private int checkNum;
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(int checkNum) {
		this.checkNum = checkNum;
	}
	@Override
	public String toString() {
		return "AccountCheck [accountId=" + accountId + ", checkNum=" + checkNum + "]";
	}
	
}
