package com.bookmarket.app.mapper.sw;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.bookmarket.app.dto.sw.BookPublisherSW;


@Mapper
public interface PubMapperSW {
	BookPublisherSW select(Integer pubId);
	BookPublisherSW selectEmail(String pubEmail);
	int insert(BookPublisherSW bookPub);
	int update(BookPublisherSW bookPub);
	int delete(String pubId);
	List<BookPublisherSW> selectlist();
	List<BookPublisherSW> getPubList(Map<String, Object> paramMap);
	int getPubCount(Map<String, Object> paramMap);

}
