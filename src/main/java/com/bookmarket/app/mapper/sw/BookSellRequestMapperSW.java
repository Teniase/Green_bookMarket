package com.bookmarket.app.mapper.sw;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;

@Mapper
public interface BookSellRequestMapperSW {

	List<Map<String, Object>> myRequests(Map<String, Object> paramMap);

	int getRequsetBookCount(Integer pubId);

}
