package com.bookmarket.app.mapper.sg;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDetailMapperSG {
	int insertBooks(Map<String, Object> map);
}
