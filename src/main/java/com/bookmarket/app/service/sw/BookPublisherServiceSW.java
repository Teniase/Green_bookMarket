package com.bookmarket.app.service.sw;

import java.util.List;

import com.bookmarket.app.dto.sw.BookPublisherSW;

public interface BookPublisherServiceSW {

	BookPublisherSW select(Integer pubId);
	BookPublisherSW selectEmail(String pubEmail);
	int insert(BookPublisherSW bookPub);
	int update(BookPublisherSW bookPub);
	int delete(String pubId);
	List<BookPublisherSW> selectlist();
	List<BookPublisherSW> getPubList(int pubOffset, int pageSize, boolean hideWithdrawn, String searchType, String keyword);
	int getPubCount(boolean hideWithdrawn, String searchType, String keyword);




}
