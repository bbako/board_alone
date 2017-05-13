package org.zerock.domain;

import org.springframework.stereotype.Repository;

@Repository
public class Criteria {
	
	private int page, pageNum;
	private String type, keyword;

	public Criteria() {
		
		this.page = 1;
		this.pageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if (page<=0) {
			
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getSkip() {
		return (this.page-1)*pageNum;
		
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageNum=" + pageNum + ", type=" + type + ", keyword=" + keyword + "]";
	}

	
	
	
	
	

}
