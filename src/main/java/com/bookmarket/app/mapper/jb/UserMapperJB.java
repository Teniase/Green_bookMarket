package com.bookmarket.app.mapper.jb;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.jb.UserJB;

@Mapper
public interface UserMapperJB {

	UserJB getUser(String userId);
	
	
}
