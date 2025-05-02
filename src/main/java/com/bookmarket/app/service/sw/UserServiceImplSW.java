package com.bookmarket.app.service.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.mapper.sw.UserMapperSW;

@Service
public class UserServiceImplSW implements UserServiceSW {
	@Autowired
	private UserMapperSW ums;
	
	public UserSW select(String userId) {
		return ums.select(userId);
	}

	@Override
	public UserSW selectEmail(String userEmail) {
		
		return ums.selectEmail(userEmail);
	}

	@Override
	public int insert(UserSW user) {
		// TODO Auto-generated method stub
		return ums.insert(user);
	}

	@Override
	public int update(UserSW user) {
		
		return ums.update(user);
	}

	@Override
	public int delete(String userId) {
	
		return ums.delete(userId);
	}

	@Override
	public List<UserSW> selectlist() {
		// TODO Auto-generated method stub
		return ums.selectlist();
	}

	@Override
	public List<UserSW> getUserList(int userOffset, int pageSize, boolean hideWithdrawn, String searchType, String keyword) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("offset", userOffset);
	    paramMap.put("limit", pageSize);
	    paramMap.put("hideWithdrawn", hideWithdrawn);  
	    paramMap.put("searchType", searchType);
	    paramMap.put("keyword", keyword);
	    return ums.getUserList(paramMap);
	}
	@Override
	public int getUserCount(boolean hideWithdrawn, String searchType, String keyword) {
		 Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("hideWithdrawn", hideWithdrawn);  
		    paramMap.put("searchType", searchType);
		    paramMap.put("keyword", keyword);
		return ums.getUserCount(paramMap);
	}
}

