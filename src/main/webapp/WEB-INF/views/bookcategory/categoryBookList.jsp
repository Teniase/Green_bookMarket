<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 카테고리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/sg/bookcategory/css/style.css">
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/categoryNavbar.jsp"%>
	<div class="container mt-4">
		<div class="row g-4">
			<c:forEach var="book" items="${categoryBookList }">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="card h-100 shadow-sm">
						<c:choose>
							<c:when test="${book.bookImg != null}">
								<a onclick="reqBookDetail(${book.bookId})"> <c:choose>
										<c:when
											test="${not empty book.bookImg and book.bookImg.startsWith('/uploads/')}">
											<img src="${book.bookImg}" class="card-img-top">
										</c:when>
										<c:otherwise>
											<img
												src="/resources/sw/bookImg/${book.bookImg != null ? book.bookImg : 'noBookImg.png'}"
												class="bookImg img-fluid">
										</c:otherwise>
									</c:choose>
								</a>
							</c:when>
							<c:otherwise>
								<a onclick="reqBookDetail(${book.bookId})"> <img
									src="../resources/sw/bookImg/noBookImg.png"
									class="card-img-top" alt="기본 이미지">
								</a>
							</c:otherwise>
						</c:choose>
						<div class="card-body">
							<h6 class="card-title fw-bold text-truncate">${book.bookName}</h6>
							<p class="card-text small text-muted mb-1">저자:
								${book.bookWriter}</p>
							<p class="card-text small text-muted">카테고리: ${book.bscName}</p>
							<p class="text-danger fw-semibold">${book.bookPrice}원</p>
							<div class="d-grid">
								<button class="btn btn-outline-success btn-sm mt-2"
									onclick="reqBookDetail(${book.bookId})">상세보기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- ✅ 페이지네이션 -->
		<nav class="d-flex justify-content-center mt-5">
			<ul class="pagination">
				<c:if test="${pgData.startPage != 1 }">
					<li class="page-item"><a class="page-link"
						href="javascript:reqPage(${bscId }, ${pgData.prevPage })">이전</a></li>
				</c:if>
				<c:forEach var="page" begin="${pgData.startPage }"
					end="${pgData.endPage }">
					<li class="page-item ${pgData.page == page ? 'active' : ''}">
						<a class="page-link"
						href="javascript:reqPage(${bscId }, ${page })">${page }</a>
					</li>
				</c:forEach>
				<c:if test="${pgData.endPage != pgData.maxPage }">
					<li class="page-item"><a class="page-link"
						href="javascript:reqPage(${bscId }, ${pgData.nextPage })">다음</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script type="text/javascript"
		src="../resources/sg/bookcategory/js/script.js"></script>
</body>
</html>
