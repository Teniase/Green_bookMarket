package com.bookmarket.app.service.jb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.jb.UserJB;
import com.bookmarket.app.mapper.jb.UserMapperJB;

@Service
public class UserServiceImplJB implements UserServiceJB {
	@Autowired
	private UserMapperJB usersMapper;

	public UserJB getUser(String userId) {
		return usersMapper.getUser(userId);
	}
}

