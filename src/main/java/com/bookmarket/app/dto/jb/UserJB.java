package com.bookmarket.app.dto.jb;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("userJB")
public class UserJB {
	private String userId;
	private String userName;
	private Date userBirth;
	private String userEmail;
	private String userPw;
	private String userTel;
	private String userAddr;
	private String userDel;
	private Date userJoin;
	private String userImg;
	
}
