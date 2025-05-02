package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CartSG")
public class CartSG {
	private int cartId;
	private String userId;
	private int bookId;
	private int bookCnt;
	private String cartDel;
	private Date cartDate;
}
