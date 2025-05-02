package com.bookmarket.app.dto.sg;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookSmallCaregorySG")
public class BookSmallCaregorySG {
	private int bscId;
	private int blcId;
	private String bscName;
}
