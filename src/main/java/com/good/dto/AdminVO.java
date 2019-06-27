package com.good.dto;

public class AdminVO {
	private String adminId;
	private String adminPwd;

	public final String getAdminId() {
		return adminId;
	}

	public final void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public final String getAdminPwd() {
		return adminPwd;
	}

	public final void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPwd=" + adminPwd + "]";
	}

}
