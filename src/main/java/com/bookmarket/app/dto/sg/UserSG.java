package com.bookmarket.app.dto.sg;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("UserSG")
public class UserSG {
	private String userId;
	private String userName;
	private Date userBirth;
	private String userEmail;
	private String userPw;
	private String userAddr;
	private String userDel;
	private Date userJoin;
	private String userImg;
	private String userTel;
}
