package com.bookmarket.app.service.sw;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;

public interface FindInfoServiceSW {

	UserSW selectId(UserSW user);
	UserSW selectPw(UserSW user);
	void updatePW(UserSW user2);
	BookPublisherSW selectPubId(BookPublisherSW bookPub);
	BookPublisherSW selectPubPw(BookPublisherSW bookPub);
	void updatePubPW(BookPublisherSW bookPub2);

}
