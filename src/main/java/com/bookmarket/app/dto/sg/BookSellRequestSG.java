package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookSellRequestSG")
public class BookSellRequestSG {
	private int bsrId;
	private int bookId;
	private int pubId;
	private int bsrCnt;
	private String bsrYn;
	private Date bsrDate;
	private Date bsrConfirm;
	private String bsrReason;
}
