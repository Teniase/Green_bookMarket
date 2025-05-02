package com.bookmarket.app.mapper.sg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderSG;

@Mapper
public interface OrderMapperSG {
	int insert(OrderSG order);
	OrderSG select(int id);
	int getTotal();
	int getReqOdrTotalByUserId(String userId);
	List<BookSG> getReqOrderBookList(Map<String, Object> map);
	List<OrderSG> getReqOrderList(Map<String, Object> map);
	int getAcptedOdrTotalByUserId(String userId);
	List<BookSG> getAcptedOrderBookList(Map<String, Object> map);
	List<OrderSG> getAcptedOrderList(Map<String, Object> map);
	int updateByUserId(Map<String, Object> map);
}
