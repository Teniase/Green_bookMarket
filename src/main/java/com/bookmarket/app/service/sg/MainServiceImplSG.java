package com.bookmarket.app.service.sg;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.mapper.sg.BookMapperSG;
import com.bookmarket.app.mapper.sg.DateDtoMapper;

@Service("MainServiceImplSG")
public class MainServiceImplSG implements MainServiceSG {
	@Autowired
	private DateDtoMapper dateDtoMapper;
	@Autowired
	private BookMapperSG bookMapper;
	
	@Override
	public Date getTodayDate() {
		return dateDtoMapper.getTodayDate();
	}

	@Override
	public Date getPrevWeekDate() {
		return dateDtoMapper.getPrevWeekDate();
	}

	@Override
	public List<BookSG> getTodayBestBooks(int getCnt) {
		return bookMapper.getTodayBestBooks(getCnt);
	}

	@Override
	public List<BookSG> getWeeklyBestBooks(int getCnt) {
		return bookMapper.getWeeklyBestBooks(getCnt);
	}
}
