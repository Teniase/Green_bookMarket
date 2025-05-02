<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/sg/order/requestorders/css/header.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
	<div class="bg-white border-bottom py-3 px-4 mb-4 d-flex gap-3 justify-content-start align-items-center"
		id="header-container">
		<button class="btn btn-outline-dark btn-sm rounded-pill px-3"
			onclick="location.href='/'">
			<i class="bi bi-house-door-fill"></i> 메인
		</button>
		<button class="btn btn-outline-dark btn-sm rounded-pill px-3"
			onclick="location.href='/order/requestOrders?page=1'">
			<i class="bi bi-list-check"></i> 주문신청목록
		</button>
		<button class="btn btn-dark btn-sm rounded-pill px-3"
			onclick="location.href='/order/userOrderList?page=1'">
			<i class="bi bi-check-circle-fill"></i> 배송현황
		</button>
	</div>

	<script type="text/javascript"
		src="../resources/sg/order/requestorders/js/header.js"></script>
</body>
</html>