<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세정보</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/sg/bookdetail/css/style.css">
</head>

<body class="bg-light m-0 p-0">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/categoryNavbar.jsp"%>

	<div class="container">
		<div class="detail-wrapper">
			<c:if test="${sessionScope.userId eq 'admin'}">
				<div class="d-flex gap-2 my-3">
					<a class="btn btn-warning px-4 py-2"
						href="/bookdetail/bookDetailUpdateForm?bookId=${book.bookId}">✏️수정</a>
					<a class="btn btn-danger px-4 py-2"
						onclick="chkDel('${book.bookId}')">🗑️ 삭제</a>
				</div>
			</c:if>

			<div class="row">
				<!-- 이미지 -->
				<div class="col-md-5 text-center">
					<c:choose>
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
				</div>
				<!-- 도서 정보 -->
				<div class="col-md-7">
					<h2 class="fw-bold">${book.bookName}</h2>
					<p class="text-muted">저자: ${book.bookWriter}</p>
					<p>
						<span class="badge bg-secondary">${book.bscName}</span>
					</p>
					<p class="text-danger fs-4 fw-semibold">${book.bookPrice}원</p>

					<div class="d-flex align-items-center gap-2 mt-3"
						id="book-rcd-container">
						<i class="bi bi-heart-fill text-danger fs-5"></i> <span
							class="badge bg-light text-dark border border-danger rounded-pill px-3 py-2 shadow-sm">
							추천수 <strong class="text-danger">${book.bookRcdCnt}</strong>
						</span>
					</div>

					<br>
					<c:if test="${book.bookOut == 'y' || book.bookStock <= 0 }">
						<div class="alert alert-danger">❌ 절판되었거나 재고가 없습니다</div>
					</c:if>
					<!-- 수량 컨트롤 영역 -->
					<!-- 수량 컨트롤 -->
					<div class="mb-3 d-flex align-items-center gap-2">
						<button class="btn btn-outline-secondary btn-sm"
							onclick="decBookReqCnt(${book.bookPrice})">-</button>
						<input type="text" id="book-req-cnt"
							class="form-control text-center" value="1" style="width: 60px;"
							oninput="refreshBookTotalPrice(${book.bookPrice})">
						<button class="btn btn-outline-secondary btn-sm"
							onclick="incBookReqCnt(${book.bookPrice})">+</button>
						<span class="ms-3 fw-bold">총 가격: <input type="text"
							id="book-total-price"
							class="border-0 bg-transparent fw-bold text-danger"
							value="${book.bookPrice}" readonly>원
						</span>
					</div>

					<!-- 버튼 정렬 -->
					<div class="d-flex gap-2 mt-3">
						<c:if test="${book.bookOut == 'n' && book.bookStock > 0 }">
							<button class="btn btn-success px-4 py-2"
								onclick="addBook(${book.bookId})">🛒 장바구니</button>
						</c:if>
						<button class="btn btn-outline-primary px-4 py-2"
							onclick="rcdBook(${book.bookId})">❤️ 추천하기</button>
					</div>
					<p class="mt-2">
						📦 재고: <strong class="text-primary">${book.bookStock}</strong>권
					</p>
					<hr class="my-5">

					<!-- 책 소개 및 목차 -->
					<div class="row">
						<div class="col-md-12">
							<h4>📘 책 소개</h4>
							<pre class="text-muted" style="white-space: pre-wrap;">${book.bookDesc}</pre>
							<h4 class="mt-4">📖 목차</h4>
							<pre class="text-muted" style="white-space: pre-wrap;">${book.bookIndex}</pre>

						</div>
					</div>
				</div>
			</div>
			<a class="btn btn-outline-success text-center" href="${backUrl}">목록으로</a>
		</div>

	</div>
	<script>
	// 서버에서 전달
	const maxStock = ${book.bookStock};
</script>
	<script src="../resources/sg/bookdetail/js/script.js"></script>

</body>



</html>
