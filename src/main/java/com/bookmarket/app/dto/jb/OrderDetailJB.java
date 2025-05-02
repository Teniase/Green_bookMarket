package com.bookmarket.app.dto.jb;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("OrderDetailJB")
public class OrderDetailJB {
	private int odId;
	private int bookId;
	private int orderId;
	private int odrCnt;
	
	// join - book
	private int bookPrice;
	private String bookName;
	private String bookImg;
	private int bscId;
	private int book_stock;
	
	// join - smallCartegory
	private String bscName;
	
}
