package com.good.dto;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class AccountsVO {
	private int accountId;
	private String email;
	private String pwd;
	private String nickname;
	private String picture;
	private String footer;
	private Date reg_date;
	private Date mod_date;
	private Date lastFollowerCheck;
	private Date newLogin_date;
	private int authority;
	private MultipartFile uploadFile;
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "AccountsVO [accountId=" + accountId + ", email=" + email + ", pwd=" + pwd + ", nickname=" + nickname
				+ ", picture=" + picture + ", footer=" + footer + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", lastFollowerCheck=" + lastFollowerCheck + ", newLogin_date=" + newLogin_date + ", authority="
				+ authority + ", uploadFile=" + uploadFile + "]";
	}
	
}
