package com.good.dto;

public class EditCategoryVO {
	private int catOldId;
	private int catNewId;
	private String catName;
	private String catPic;
	private int editAuth;
	private int viewAuth;
	
	public int getCatOldId() {
		return catOldId;
	}
	public void setCatOldId(int catOldId) {
		this.catOldId = catOldId;
	}
	public int getCatNewId() {
		return catNewId;
	}
	public void setCatNewId(int catNewId) {
		this.catNewId = catNewId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatPic() {
		return catPic;
	}
	public void setCatPic(String catPic) {
		this.catPic = catPic;
	}
	public int getEditAuth() {
		return editAuth;
	}
	public void setEditAuth(int editAuth) {
		this.editAuth = editAuth;
	}
	public int getViewAuth() {
		return viewAuth;
	}
	public void setViewAuth(int viewAuth) {
		this.viewAuth = viewAuth;
	}
	
}
