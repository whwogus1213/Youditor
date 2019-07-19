package com.good.dto;

public class VideoCategoryVO extends Search {
	private int categoryId;
	private String categoryName;
	private int editAuthority;
	private int viewAuthority;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getEditAuthority() {
		return editAuthority;
	}
	public void setEditAuthority(int editAuthority) {
		this.editAuthority = editAuthority;
	}
	public int getViewAuthority() {
		return viewAuthority;
	}
	public void setViewAuthority(int viewAuthority) {
		this.viewAuthority = viewAuthority;
	}
	
} // End - VideoCategoryVO
