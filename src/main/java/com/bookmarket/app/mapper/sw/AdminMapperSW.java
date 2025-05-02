package com.bookmarket.app.mapper.sw;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sw.BookSW;

@Mapper
public interface AdminMapperSW {

	List<BookSW> getList(Map<String, Object> paramMap);
	int approveBook(int bsrId);
	int rejectBook(Map<String, Object> param);
	int getPendingBookCount();

}
