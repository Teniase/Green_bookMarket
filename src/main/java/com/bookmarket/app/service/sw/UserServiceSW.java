package com.bookmarket.app.service.sw;

import java.util.List;

import com.bookmarket.app.dto.sw.UserSW;

public interface UserServiceSW {

	UserSW select(String userId);
	UserSW selectEmail(String userEmail);
	int insert(UserSW user);
	int update(UserSW user);
	int delete(String userId);
	List<UserSW> selectlist();
	List<UserSW> getUserList(int userOffset, int pageSize, boolean hideWithdrawn,String searchType, String keyword);
	int getUserCount(boolean hideWithdrawn, String searchType, String keyword);
}


