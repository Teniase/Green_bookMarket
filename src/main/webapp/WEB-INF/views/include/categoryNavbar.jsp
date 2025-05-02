<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/jb/mainCss/categoryNavbar.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 📌 상단 카테고리 네비게이션 -->
	<!-- 📌 상단 카테고리 네비게이션 -->
	<!-- 📌 /include/categoryNavbar.jsp -->
	<!-- ✅ /include/categoryNavbar.jsp -->
<div class="category-bar container rounded-3 shadow-sm px-4 py-3 my-4 bg-white d-flex justify-content-between align-items-center flex-wrap">
	<div class="d-flex align-items-center gap-2">
		<i class="bi bi-journals fs-4 text-success"></i>
		<h5 class="mb-0 fw-bold text-dark">카테고리</h5>
	</div>

	<div class="d-flex flex-wrap gap-3">
		<!-- 국내 -->
		<div class="dropdown">
			<button class="btn btn-outline-secondary dropdown-toggle fw-semibold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				국내
			</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="/book/category?bscId=1&page=1">만화</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=2&page=1">소설</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=3&page=1">경제</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=4&page=1">정치</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=5&page=1">어린이</a></li>
			</ul>
		</div>

		<!-- 외국 -->
		<div class="dropdown">
			<button class="btn btn-outline-secondary dropdown-toggle fw-semibold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				외국
			</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="/book/category?bscId=6&page=1">영어</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=7&page=1">일본</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=8&page=1">중국</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=9&page=1">기타</a></li>
			</ul>
		</div>

		<!-- eBook -->
		<div class="dropdown">
			<button class="btn btn-outline-secondary dropdown-toggle fw-semibold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				eBook
			</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="/book/category?bscId=10&page=1">과학</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=11&page=1">로맨스</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=12&page=1">헬스</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=13&page=1">역사</a></li>
				<li><a class="dropdown-item" href="/book/category?bscId=14&page=1">요리</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- 이거 삭제 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>