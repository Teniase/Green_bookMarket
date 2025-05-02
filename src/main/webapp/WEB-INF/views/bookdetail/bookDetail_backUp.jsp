<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="../resources/sg/bookdetail/css/style.css">
</head>
<body>
	<div id="book-container">
		<c:if test="${book.bookImg != null }">
			<img alt="" src="../resources/sw/bookImg/${book.bookImg }" style="width: 50%; display: inline-block;">
		</c:if>
		<c:if test="${book.bookImg == null }">
			<img alt="" src="../resources/sw/bookImg/noBookImg.png" style="width: 50%; display: inline-block;">
		</c:if>
		<div id="book-desc-container">
			book-desc-container<br>
			bookId : ${book.bookId }<br>
			<div id="book-rcd-container">추천수 : ${book.bookRcdCnt }</div>
			<div id="book-interaction-container">
				<c:if test="${book.bookOut == 'y' || book.bookStock <= 0 }">
					<div id="cart">절판되거나 재고나 없습니다</div>
				</c:if>
				<c:if test="${book.bookOut == 'n' && book.bookStock > 0 }">
					<div id="book-request-control-container">
						<button id="book-req-cnt-dec-btn" onclick="decBookReqCnt(${book.bookPrice})">-</button>
						수량 : <input type="text" oninput="refreshBookTotalPrice(${book.bookPrice })" id="book-req-cnt" maxlength="3" value="1" min="1" max="999">
						<button id="book-req-cnt-inc-btn" onclick="incBookReqCnt(${book.bookPrice})">+</button>
						<input type="text" id="book-total-price" value="${book.bookPrice }" readonly="readonly">원
					</div>
					<div id="cart"><button onclick="addBook(${book.bookId})">장바구니</button></div>
				</c:if>
				<div id="recommend"><button onclick="rcdBook(${book.bookId})">추천하기</button></div>
			</div>
		</div>
	</div>
	<div id="book-info-container">
		book-info-container
	</div>
	<script type="text/javascript" src="../resources/sg/bookdetail/js/script.js"></script>
</body>
</html>