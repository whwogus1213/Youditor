package com.good.dto;

public class SearchBoard extends Search {
	private int categoryId;

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "SearchBoard [categoryId=" + categoryId + "]";
	}
	
}
