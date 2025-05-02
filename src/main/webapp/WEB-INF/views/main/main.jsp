<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마켓 메인</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="/resources/jb/mainCss/main.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="container py-5">
		<%@ include file="../include/categoryNavbar.jsp"%>
		<!-- ✅ 메인 슬라이더 -->
		<div id="carouselExampleIndicators" class="carousel slide mb-5"
			data-bs-ride="carousel" data-bs-interval="3000">
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
					<img src="/resources/jb/images/banner1.jpg" class="d-block w-100"
						alt="슬라이드1" data-bs-toggle="modal" data-bs-target="#imageModal">
				</div>
				<div class="carousel-item">
					<img src="/resources/jb/images/banner2.jpg" class="d-block w-100"
						alt="슬라이드2" data-bs-toggle="modal" data-bs-target="#imageModal">
				</div>
				<div class="carousel-item">
					<img src="/resources/jb/images/banner3.jpg" class="d-block w-100"
						alt="슬라이드3" data-bs-toggle="modal" data-bs-target="#imageModal">
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


		<!-- ✅ BEST & NEW 영역 -->
		<div id="bestNnew">

			<!-- 오늘의 BEST -->
			<div id="todayBest" class="box">
				<h3 class="section-title">
					<i class="bi bi-stars"></i> 오늘의 BEST <span class="date-label">${todayDate}</span>
				</h3>
				<div class="row mt-4">
					<c:forEach var="book" items="${todayBestBookList}">
						<div class="col-md-2 col-sm-6 bookSlot mx-auto">
							<a href="/detail/books?id=${book.bookId}"> <c:choose>
									<c:when
										test="${not empty book.bookImg and book.bookImg.startsWith('/uploads/')}">
										<img src="${book.bookImg}" class="bookImg img-fluid">
									</c:when>
									<c:otherwise>
										<img
											src="/resources/sw/bookImg/${book.bookImg != null ? book.bookImg : 'noBookImg.png'}"
											class="bookImg img-fluid">
									</c:otherwise>
								</c:choose>
							</a> <span class="title">${book.bookName}</span> <span class="writer">${book.bookWriter}</span>
							<span class="recommend">추천수 : ${book.bookRcdCnt}</span>
						</div>
					</c:forEach>
				</div>

			

			</div>
			
				<!-- 주간 BEST -->
				<div id="weeklyBest" class="box">
					<h3 class="section-title">
						<i class="bi bi-calendar-week"></i> 주간 BEST <span
							class="date-label">${prevWeekDate} ~ ${todayDate}</span>
					</h3>
					<div class="row mt-4">
						<c:forEach var="book" items="${weeklyBestBookList}">
							<div class="col-md-2 col-sm-6 bookSlot mx-auto">
								<a href="/detail/books?id=${book.bookId}"> <c:choose>
										<c:when
											test="${not empty book.bookImg and book.bookImg.startsWith('/uploads/')}">
											<img src="${book.bookImg}" class="bookImg img-fluid">
										</c:when>
										<c:otherwise>
											<img
												src="/resources/sw/bookImg/${book.bookImg != null ? book.bookImg : 'noBookImg.png'}"
												class="bookImg img-fluid">
										</c:otherwise>
									</c:choose>
								</a> <span class="title">${book.bookName}</span> <span
									class="writer">${book.bookWriter}</span> <span
									class="recommend">추천수 : ${book.bookRcdCnt}</span>
							</div>
						</c:forEach>
					</div>
				</div>
		</div>
		<%@ include file="../include/footer.jsp"%>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
