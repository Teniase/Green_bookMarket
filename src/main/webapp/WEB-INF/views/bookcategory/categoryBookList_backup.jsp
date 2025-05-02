<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/sg/bookcategory/css/style.css">
</head>
<body>
	<c:forEach var="book" items="${categoryBookList }">
		<div id="book-container">
			<div id="book-img-container">
				<c:if test="${book.bookImg != null }">
					<img id="book-img" alt="" src="../resources/sw/bookImg/${book.bookImg }">
				</c:if>
				<c:if test="${book.bookImg == null }">
					<img id="book-img" alt="" src="../resources/sw/bookImg/noBookImg.png">
				</c:if>
			</div>
			<div id="book-info-container">
				책 저자 : ${book.bookWriter }<br>
				책 제목 : ${book.bookName }<br>
				책 가격 : ${book.bookPrice }<br>
				카테고리 아이디 : ${book.bscId }<br>
				카테고리 이름 : ${book.bscName }<br>
			</div>
			<div id="book-interaction-container">
				<div id="detail-container" onclick="reqBookDetail(${book.bookId})">상세보기</div>
			</div>
		</div>
	</c:forEach>
	<div id="page-container">
		<c:if test="${pgData.startPage != 1 }">
			<button onclick="reqPage(${bscId }, ${pgData.prevPage })">이전</button>
		</c:if>
		<c:forEach var="page" begin="${pgData.startPage }" end="${pgData.endPage }">
			<c:if test="${pgData.page == page }">
				<button id="cur-page-btn" onclick="reqPage(${bscId }, ${page })">${page }</button>
			</c:if>
			<c:if test="${pgData.page != page }">
				<button onclick="reqPage(${bscId }, ${page })">${page }</button>
			</c:if>
		</c:forEach>
		<c:if test="${pgData.endPage != pgData.maxPage }">
			<button onclick="reqPage(${bscId }, ${pgData.nextPage })">다음</button>
		</c:if>
	</div>
	<script type="text/javascript" src="../resources/sg/bookcategory/js/script.js"></script>
</body>
</html>