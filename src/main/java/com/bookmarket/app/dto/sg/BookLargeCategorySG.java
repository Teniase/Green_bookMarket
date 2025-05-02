package com.bookmarket.app.dto.sg;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookLargeCategorySG")
public class BookLargeCategorySG {
	private int blcId;
	private String blcName;
}
