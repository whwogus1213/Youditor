package com.good.dto;

public class CategoryCount {
	private int catId;
	private int catCount;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public int getCatCount() {
		return catCount;
	}
	public void setCatCount(int catCount) {
		this.catCount = catCount;
	}
	
	@Override
	public String toString() {
		return "CategoryCount [catId=" + catId + ", catCount=" + catCount + "]";
	}
	
}
