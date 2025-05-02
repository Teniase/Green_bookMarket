package com.bookmarket.app.mapper.sw;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;

@Mapper
public interface BookMapperSW {

	int insertBook(Map<String, Object> map);
	BookSW selectIsbn(String bookIsbn);
	int getBookCount(String keyword);
	List<BookSW> getBookStockList(Map<String, Object> map);
	void increaseStock(@Param("bookId") int bookId, @Param("count") int count);
	int update(BookSW book);
	int delete(int bookId);



	
}

	

