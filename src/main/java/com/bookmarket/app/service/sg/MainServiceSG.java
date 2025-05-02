package com.bookmarket.app.service.sg;

import java.sql.Date;
import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;

public interface MainServiceSG {
	Date getTodayDate();
	Date getPrevWeekDate();
	List<BookSG> getTodayBestBooks(int getCnt);
	List<BookSG> getWeeklyBestBooks(int getCnt);
}
