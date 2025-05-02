package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("OrderSG")
public class OrderSG {
	private int orderId;
	private String userId;
	private Date orderDate;
	private String orderDel;
	private String orderConfirm;
}
