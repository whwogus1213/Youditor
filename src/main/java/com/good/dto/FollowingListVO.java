package com.good.dto;

import java.util.Date;


public class FollowingListVO {
	private int followAccountId;
	private int followerAccountId;
	private Date reg_date;

	private boolean check;
	
	private String nickname;
	private String picture;
	private String footer;
	private Date lastFollowerCheck;
	private Date newLogin_date;
	

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

	
	public final String getNickname() {
		return nickname;
	}

	public final void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public boolean getCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	public Date getLastFollowerCheck() {
		return lastFollowerCheck;
	}

	public void setLastFollowerCheck(Date lastFollowerCheck) {
		this.lastFollowerCheck = lastFollowerCheck;
	}

	public Date getNewLogin_date() {
		return newLogin_date;
	}

	public void setNewLogin_date(Date newLogin_date) {
		this.newLogin_date = newLogin_date;
	}

	@Override
	public String toString() {
		return "FollowingListVO [followAccountId=" + followAccountId + ", followerAccountId=" + followerAccountId
				+ ", reg_date=" + reg_date + ", check=" + check + ", nickname=" + nickname + ", picture=" + picture
				+ ", footer=" + footer + ", lastFollowerCheck=" + lastFollowerCheck + ", newLogin_date=" + newLogin_date
				+ "]";
	}



} // End - FollowListVO
