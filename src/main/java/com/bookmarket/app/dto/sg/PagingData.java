package com.bookmarket.app.dto.sg;

import lombok.Data;

@Data
public class PagingData {
	private int totalNum;
	private int limitColNum;
	private int limitRowNum;

	private int page;
	private int startPage;
	private int endPage;
	private int nextPage;
	private int prevPage;
	private int maxPage;
	
	private int startIdx;
	private int endIdx;
	
	public PagingData() {
		
	}
	
	public PagingData(int totalNum, int limitColNum, int limitRowNum, int page) {
		this.totalNum = totalNum;
		this.limitColNum = limitColNum;
		this.limitRowNum = limitRowNum;
		
		if (this.totalNum <= 0) {
			this.maxPage = 1;
		} else if (totalNum % limitColNum == 0) {
			this.maxPage = totalNum / limitColNum;
		} else {
			this.maxPage = totalNum / limitColNum + 1;
		}
		
		if (page < 1) {
			this.page = 1;
		} else if (page > this.maxPage) {
			this.page = this.maxPage;
		} else {
			this.page = page;
		}
		
		this.startPage = limitRowNum * ((this.page - 1) / limitRowNum) + 1;
		this.endPage = this.startPage + limitRowNum - 1;
		if (this.maxPage <= this.endPage) {
			this.endPage = this.maxPage;
		}
		
		this.nextPage = this.endPage + 1;
		this.prevPage = this.startPage - 1;
		
		this.startIdx = this.limitColNum * (this.page - 1);
		this.endIdx = this.limitColNum * this.page - 1;
	}
}
