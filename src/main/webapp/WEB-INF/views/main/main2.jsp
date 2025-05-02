<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style type="text/css">
@import url("/resources/jb/mainCss/main.css");
</style>
</head>
<body>
	<div class="container text-center">
		<div id="carouselExampleIndicators" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/jb/images/1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/jb/images/2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/jb/images/3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<div id="bestNnew">
			<div id="todayBest" class="box">
				<h3>
					<i class="bi bi-calendar-check"></i>오늘의 BEST
				</h3>
				<span id="today"> _25.04.02</span>

				<div>
					<div style="display: inline;">
						<img src="resources/jb/images/3.jpg" class="bookImg"> 
						<span class="title">제목</span> <span class="writer">저자</span>
					</div>
					<div style="display: inline;">
						<img src="resources/jb/images/3.jpg" class="bookImg"> 
						<span class="title">제목</span> <span class="writer">저자</span>
					</div>
				</div>
			</div>

			<div id="weeklyBest" class="box">
				<h3>
					<i class="bi bi-calendar-check"></i>주간 BEST
				</h3>
				<span id="today"> _25.03.24 ~ 24.03.31 </span>
				<!-- 전주 기준 -->
				<div></div>
			</div>

			<div id="newBest" class="box">
				<h3>
					<i class="bi bi-calendar-check"></i>신간 BEST
				</h3>
				<div></div>
			</div>

		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>