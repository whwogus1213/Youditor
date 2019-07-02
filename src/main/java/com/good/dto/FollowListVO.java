package com.good.dto;

import java.util.Date;

public class FollowListVO {
	private int followAccountId;
	private int followerAccountId;
	private Date reg_date;

	public int getFollowAccountId() {
		return followAccountId;
	}

	public void setFollowAccountId(int followAccountId) {
		this.followAccountId = followAccountId;
	}

	public int getFollowerAccountId() {
		return followerAccountId;
	}

	public void setFollowerAccountId(int followerAccountId) {
		this.followerAccountId = followerAccountId;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

} // End - FollowListVO
