<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">	
<style>
.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.modal-header {
	background-color: #2b473e;
	color: #ffffff;
}

.modal-content {
	border-radius: 12px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.modal-body span {
	font-weight: 500;
	color: #333;
}

.btn-info {
	background-color: #6d8c50;
	border: none;
}

.btn-info:hover {
	background-color: #5c7844;
}

.btn-success {
	background-color: #42917f;
	border: none;
}

.btn-success:hover {
	background-color: #347364;
}
</style>
</head>
<body class="p-4 bg-light">

	<h3 class="mb-4 fw-bold text-dark">📝 주문 승인 목록</h3>
	
	<form method="get" action="/admin/orderList"
				class="mb-4 d-flex justify-content-center">
				<input type="text" name="keyword" value="${keyword}"
					class="form-control me-2 w-50" placeholder="주문번호">
				<button type="submit" class="btn btn-success">검색</button>
			</form>

	<table class="table table-bordered shadow-sm bg-white">
		<thead class="table-secondary">
			<tr>
				<th>주문번호</th>
				<th>사용자</th>
				<th>주문일</th>
				<th>결제상황</th>
				<th>승인</th>
				<th>상세</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
					<c:if test="${order.orderConfirm eq 'n' && order.orderDel eq 'n'}">
					<tr>
						<td>${order.orderId}</td>
						<td>${order.userId}</td>
						<td>${order.orderDate}</td>
						<td><c:choose>
								<c:when test="${order.orderPay eq 'y'}">결제완료</c:when>
								<c:otherwise>결제대기</c:otherwise>
							</c:choose></td>
						<td><c:if test="${order.orderPay eq 'y'}">
								<button class="btn btn-sm btn-success"
									onclick="approveOrder(${order.orderId})">승인</button>
							</c:if></td>
						<td>
							<button class="btn btn-sm btn-info"
								onclick="showOrderDetail(${order.orderId})">상세보기</button>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>

	</table>
	<!-- 메인 이동 -->
	<div class="text-end mt-4">
		<a href="/" class="btn btn-outline-danger btn-sm"> <i
			class="bi bi-house-door-fill"></i> 메인으로
		</a>
	</div>

	<!-- 모달창 -->
	<div class="modal fade" id="orderDetailModal" tabindex="-1"
		aria-labelledby="orderDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="orderDetailModalLabel">📦 주문 상세 정보</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body px-4 py-3">
					<p>
						<strong>주문번호:</strong> <span id="modal-order-id"></span>
					</p>
					<p>
						<strong>사용자:</strong> <span id="modal-user-id"></span>
					</p>
					<p>
						<strong>주문일:</strong> <span id="modal-order-date"></span>
					</p>
					<p>
						<strong>주문상품:</strong> <span id="modal-order-name"></span>
					</p>
					<p>
						<strong>총가격:</strong> <span id="modal-total-price"></span> 원
					</p>
				</div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-outline-dark rounded-pill px-4"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<!-- 페이지네이션 -->
			<nav class="mt-4">
				<ul class="pagination justify-content-center">
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${i == currentPage ? 'active' : ''}"><a
							class="page-link" href="?page=${i}&keyword=${keyword}">${i}</a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="../resources/sw/admin/js/orderList.js"></script>

</body>
</html>
