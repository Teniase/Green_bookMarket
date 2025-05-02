package com.bookmarket.app.service.sw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookSmallCaregorySW;
import com.bookmarket.app.mapper.sw.BookSmallCaregoryMapperSW;

@Service
public class BookSmallCaregoryServiceImplSW implements BookSmallCaregoryServiceSW {
	@Autowired
	private BookSmallCaregoryMapperSW bms;
	
	@Override
	public List<BookSmallCaregorySW> select() {
	
		return bms.select();
	}

}
