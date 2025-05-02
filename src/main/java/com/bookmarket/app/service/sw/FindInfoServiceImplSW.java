package com.bookmarket.app.service.sw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.mapper.sw.FindInfoMapperSW;

@Service
public class FindInfoServiceImplSW implements FindInfoServiceSW{
	@Autowired
	private FindInfoMapperSW fis;
	
	@Override
	public UserSW selectId(UserSW user) {
		// TODO Auto-generated method stub
		return fis.selectId(user);
	}

	@Override
	public UserSW selectPw(UserSW user) {
		// TODO Auto-generated method stub
		return fis.selectPw(user);
	}

	@Override
	public void updatePW(UserSW user2) {
		fis.updatePw(user2);
		
	}

	@Override
	public BookPublisherSW selectPubId(BookPublisherSW bookPub) {
		// TODO Auto-generated method stub
		return fis.selectPubId(bookPub);
	}

	@Override
	public BookPublisherSW selectPubPw(BookPublisherSW bookPub) {
		// TODO Auto-generated method stub
		return fis.selectPubPw(bookPub);
	}

	@Override
	public void updatePubPW(BookPublisherSW bookPub2) {
	
		 fis.updatePubPW(bookPub2);
	}

}
