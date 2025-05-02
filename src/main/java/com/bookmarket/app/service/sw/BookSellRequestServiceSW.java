package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

public interface BookSellRequestServiceSW {

	List<Map<String, Object>> myRequests(Integer pubId, int offset, int pageSize);

	int getRequsetBookCount(Integer pubId);
;
}
