package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BookRecommendationSG")
public class BookRecommendationSG {
	private int rcdId;
	private String userId;
	private int bookId;
	private Date rcdDate;
}
