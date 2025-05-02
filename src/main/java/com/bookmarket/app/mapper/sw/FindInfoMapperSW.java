package com.bookmarket.app.mapper.sw;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;

@Mapper
public interface FindInfoMapperSW {
	UserSW selectId(UserSW user);
	UserSW selectPw(UserSW user);
	void updatePw(UserSW user2);
	BookPublisherSW selectPubId(BookPublisherSW bookPub);
	BookPublisherSW selectPubPw(BookPublisherSW bookPub);
	void updatePubPW(BookPublisherSW bookPub2);

}
