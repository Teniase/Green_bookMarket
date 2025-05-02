package com.bookmarket.app.dto.jb;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookJB")
public class BookJB {
	private int bookId;
	private int bscId;
	private int bookPrice;
	private String bookName;
	private String bookWriter;
	private String bookDesc;
	private String bookIndex;
	private String bookPubCmt;
	private int bookStock;
	private Date bookDate;
	private String bookImg;
	private int bookPage;
	private String bookSize;
	private int bookIsbn;
	
	// join
	private String bscName;
}
