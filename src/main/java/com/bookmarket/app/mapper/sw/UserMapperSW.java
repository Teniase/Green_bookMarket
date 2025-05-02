package com.bookmarket.app.mapper.sw;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bookmarket.app.dto.sw.UserSW;

@Mapper
public interface UserMapperSW {
	UserSW select(String userId);
	UserSW selectEmail(String userEmail);
	int insert(UserSW user);
	int update(UserSW user);
	int delete(String userId);
	List<UserSW> selectlist();
	List<UserSW> getUserList(Map<String, Object> param);;
	int getUserCount(Map<String, Object> paramMap);
	
}
