package com.bookmarket.app.dto.jb;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("OrderJB")
public class OrderJB {
	private int orderId;
	private String userId;
	private Date orderDate;
	private String orderDel;
	private String orderConfirm;
	private String orderPay;
	private String paymentKey;
}
