package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookSG")
public class BookSG {
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
	private String bookOut;
	private int bookRcdCnt;
	//for BookSellRequest join
	private int bsrId;
	private int pubId;
	private int bsrCnt;
	private String bsrYn;
	private Date bsrDate;
	private Date bsrConfirm;
	//for BookSmallCategory join
	private String bscName;
	//for BookLargeCategory join
	private int blcId;
	private String blcName;
	//for Cart join
	private int cartId;
	private String userId;
	private int bookCnt;
	private String cartDel;
	private Date cartDate;
	//for Order join
	private int orderId;
	private Date orderDate;
	private String orderDel;
	private String orderConfirm;
	//for OrderDetail join
	private int odId;
	private int odrCnt;
	//for rnum (this is not Table column, and only needed for looping)
	int rnum;
}
