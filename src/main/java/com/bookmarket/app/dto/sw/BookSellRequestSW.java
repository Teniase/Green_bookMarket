package com.bookmarket.app.dto.sw;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookSellRequestSW")
public class BookSellRequestSW {
	private int bsrId;
	private int bookId;
	private int pubId;
	private int bsrCnt;
	private String bsrYn;
	private Date bsrDate;
	private String bsrReason;
	
}
