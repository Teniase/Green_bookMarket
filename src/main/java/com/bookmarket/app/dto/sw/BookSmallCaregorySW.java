package com.bookmarket.app.dto.sw;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookSmallCaregorySW")
public class BookSmallCaregorySW {
	private int bscId;
	private int blcId;
	private String bscName;
}
