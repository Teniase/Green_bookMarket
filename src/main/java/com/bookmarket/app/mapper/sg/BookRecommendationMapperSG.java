package com.bookmarket.app.mapper.sg;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookRecommendationSG;
import com.bookmarket.app.dto.sg.BookSG;

@Mapper
public interface BookRecommendationMapperSG {
	BookRecommendationSG selectByUserIdAndBookIdAndCurDay(Map<String, Object> map);
	int insert(Map<String, Object> map);
}
