<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색 결과</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../resources/sg/booksearch/css/style.css">
</head>
<body class="bg-light p-0 m-0">

	<div class="container">
		<br>
		<h2 class="fw-bold mb-4">
			🔍 검색 결과: <span class="text-primary">${keyword}</span>
		</h2>
		<!-- ✅ 카드형 그리드 결과 -->
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
			<c:forEach var="book" items="${bookList}">
				<div class="col">
					<div class="card h-100 shadow-sm">
						<c:choose>
							<c:when
								test="${not empty book.bookImg and book.bookImg.startsWith('/uploads/')}">
								<a onclick="reqBookDetail(${book.bookId})"> <img
									src="${book.bookImg}" class="card-img-top" alt="도서 이미지">
								</a>
							</c:when>
							<c:when test="${not empty book.bookImg}">
								<a onclick="reqBookDetail(${book.bookId})"> <img
									src="/resources/sw/bookImg/${book.bookImg}"
									class="card-img-top" alt="도서 이미지">
								</a>
							</c:when>
							<c:otherwise>
								<a onclick="reqBookDetail(${book.bookId})"> <img
									src="/resources/sw/bookImg/noBookImg.png" class="card-img-top"
									alt="기본 이미지">
								</a>
							</c:otherwise>
						</c:choose>

						<div class="card-body">
							<h5 class="card-title text-truncate">${book.bookName}</h5>
							<p class="card-text small text-muted mb-1">저자:
								${book.bookWriter}</p>
							<p class="card-text text-danger fw-semibold">${book.bookPrice}원</p>
						</div>

						<div class="card-footer bg-white border-top-0 text-end">
							<button class="btn btn-outline-success btn-sm"
								onclick="reqBookDetail(${book.bookId})">상세보기</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- ✅ 페이지네이션 -->
		<div class="d-flex justify-content-center mt-5" id="page-container">
			<c:if test="${pgData.startPage != 1}">
				<button class="btn btn-outline-secondary me-2"
					onclick="reqPage('${keyword}', ${pgData.prevPage})">이전</button>
			</c:if>

			<c:forEach var="page" begin="${pgData.startPage}"
				end="${pgData.endPage}">
				<c:choose>
					<c:when test="${pgData.page == page}">
						<button class="btn btn-primary me-1" id="cur-page-btn"
							onclick="reqPage('${keyword}', ${page})">${page}</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-secondary me-1 page-btn"
							onclick="reqPage('${keyword}', ${page})">${page}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${pgData.endPage != pgData.maxPage}">
				<button class="btn btn-outline-secondary ms-2"
					onclick="reqPage('${keyword}', ${pgData.nextPage})">다음</button>
			</c:if>
		</div>
	</div>

	<script type="text/javascript"
		src="../resources/sg/booksearch/js/script.js"></script>
</body>
</html>
