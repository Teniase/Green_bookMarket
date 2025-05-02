package com.bookmarket.app.mapper.sw;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sw.BookSmallCaregorySW;

@Mapper
public interface BookSmallCaregoryMapperSW {
	
	List<BookSmallCaregorySW> select();

}
