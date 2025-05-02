package com.bookmarket.app.dto.sw;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("userSW")
public class UserSW {
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
