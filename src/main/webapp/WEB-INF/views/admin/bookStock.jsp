<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
body {
	background-color: #f8f9fa;
}

.stock-wrapper {
	max-width: 900px;
	margin: 0 auto;
	background-color: white;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>

	<div class="container py-5">
		<div class="stock-wrapper">
			<h2 class="mb-4 text-center">📦 도서 재고 목록</h2>

			<form method="get" action="/admin/bookStock"
				class="mb-4 d-flex justify-content-center">
				<input type="text" name="keyword" value="${keyword}"
					class="form-control me-2 w-50" placeholder="도서명 또는 저자 검색">
				<button type="submit" class="btn btn-success">검색</button>
			</form>

			<table class="table table-bordered text-center align-middle">
				<thead class="table-light">
					<tr>
						<th>도서 ID</th>
						<th>제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th>재고</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${bookList}">
						<tr class="${book.bookStock <= 5 ? 'table-warning' : ''}">
							<td>${book.bookId}</td>
							<td>${book.bookName}</td>
							<td>${book.bookWriter}</td>
							<td>${book.pubName}</td>
							<td>${book.bookStock}</td>
							<td><a href="../detail/books?id=${book.bookId}"
								class="btn btn-outline-primary btn-sm">상세보기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

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
	<div class="text-center mt-4">
		<a href="/" class="btn btn-outline-danger btn-sm"> <i
			class="bi bi-house-door-fill"></i> 메인으로
		</a>
	</div>

</body>
</html>
