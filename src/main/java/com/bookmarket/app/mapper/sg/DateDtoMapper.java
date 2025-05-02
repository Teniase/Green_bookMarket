package com.bookmarket.app.mapper.sg;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DateDtoMapper {
	Date getTodayDate();
	Date getPrevWeekDate();
}
