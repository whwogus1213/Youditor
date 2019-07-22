package com.good.dto;

public class NoticeCategoryVO {
	private int categoryId;
	private String categoryName;
	private String categoryPicture;
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
	public String getCategoryPicture() {
		return categoryPicture;
	}
	public void setCategoryPicture(String categoryPicture) {
		this.categoryPicture = categoryPicture;
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
	

} // End - public class NoticeCategoryVO
