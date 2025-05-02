package com.bookmarket.app.mapper.jb;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.jb.OrderDetailJB;

@Mapper
public interface OrderDetailMapperJB {

	List<OrderDetailJB> getOrderdetails(int orderId);
	void bookStock(OrderDetailJB detail);
	int getOrderDetailCount(int orderId);
	List<OrderDetailJB> getPagedOrderDetails(Map<String, Object> params);

}
