package com.bookmarket.app.dto.sw;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bookSW")
public class BookSW {
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
	private String bookIsbn;
	private int bookRcdCnt;
	
	//for BookSellRequest join
	private int bsrId;
	private int pubId;
	private String pubName;
	private int bsrCnt;
	private String bsrYn;
	private Date bsrDate;
	private String bsrReason;
}
