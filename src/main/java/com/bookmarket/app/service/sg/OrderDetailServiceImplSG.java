package com.bookmarket.app.service.sg;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.mapper.sg.OrderDetailMapperSG;

@Service("OrderDetailServiceImplSG")
public class OrderDetailServiceImplSG implements OrderDetailServiceSG {
	@Autowired
	private OrderDetailMapperSG orderDetailMapper;

	@Override
	public int insertBooks(Map<String, Object> map) {
		return orderDetailMapper.insertBooks(map);
	}
}