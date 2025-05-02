package com.bookmarket.app.dto.sg;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("OrderDetailSG")
public class OrderDetailSG {
	private int odId;
	private int bookId;
	private int orderId;
	private int odrCnt;
}
