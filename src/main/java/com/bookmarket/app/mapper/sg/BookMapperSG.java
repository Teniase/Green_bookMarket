package com.bookmarket.app.mapper.sg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSG;

@Mapper
public interface BookMapperSG {
	int insert(BookSG book);
	int getTotal();
	int getByKwOnSaleTaggedTotal(String keyword);
	List<BookSG> getByKwOnSaleTaggedList(Map<String, Object> map);
	BookSG selectByOnSaleTagged(int id);
	BookSG select(int id);
	int update(BookSG book);
	List<BookSG> getTodayBestBooks(int getCnt);
	List<BookSG> getWeeklyBestBooks(int getCnt);
	int getCategoryBookTotal(int bscId);
	List<BookSG> getCategoryBookList(Map<String, Object> map);
}