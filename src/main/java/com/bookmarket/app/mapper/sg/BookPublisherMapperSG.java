package com.bookmarket.app.mapper.sg;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookPublisherSG;

@Mapper
public interface BookPublisherMapperSG {
	BookPublisherSG select(int id);
}
