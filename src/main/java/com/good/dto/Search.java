package com.good.dto;

public class Search extends Pagination {
	private String searchType;
	private String keyword;

	public final String getSearchType() {
		return searchType;
	}
	public final void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public final String getKeyword() {
		return keyword;
	}
	public final void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
