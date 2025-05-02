package com.bookmarket.app.mapper.sg;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSellRequestSG;

@Mapper
public interface BookSellRequestMapperSG {
	int getTotal();
	int insert(BookSellRequestSG bsr);
}
