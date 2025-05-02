package com.bookmarket.app.dto.sw;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pubSW")
public class BookPublisherSW {
	private int pubId;
	private String pubName;
	private String pubPw;
	private String pubAddr;
	private String pubEmail;
	private String pubCeo;
	private Date pubJoin;
	private String pubDel;
	private String pubMgr;
}
