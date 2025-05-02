<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 신청</title>
<!-- 외부 CSS 로딩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="/resources/sw/publisher/css/registerBookForm.css">
</head>
<body class="container py-5">
	<h2 class="mb-4">📚 도서 등록 신청</h2>
	<form method="post" action="/publisher/requestBook"
		enctype="multipart/form-data" name="frm">
		<div class="row g-3">
			<div class="col-md-6">
				<label class="form-label">책 제목</label> <input type="text"
					class="form-control" name="bookName" required>
			</div>

			<div class="col-md-6">
				<label class="form-label">저자</label> <input type="text"
					class="form-control" name="bookWriter" required>
			</div>

			<div class="col-md-6">
				<label class="form-label">가격</label> <input type="number"
					class="form-control" name="bookPrice" required>
			</div>


			<div class="col-md-6">
				<label class="form-label">책 수량 (재고)</label> <input type="number"
					class="form-control" name="bsrCnt" required>
			</div>



			<div class="col-md-6">
				<label class="form-label">페이지 수</label> <input type="number"
					class="form-control" name="bookPage" required>
			</div>

			<div class="col-md-6">
				<label class="form-label">책 크기</label> <input type="text"
					class="form-control" name="bookSize" placeholder="예: 152x225mm"
					required>
			</div>

			<div class="col-md-6">
				<label class="form-label">ISBN</label>
				 <input type="number" class="form-control" name="bookIsbn" pattern="\d{13}"
					title="숫자 13자리를 입력하세요" required>		
			<button class="btn btn-success" onclick="isbnDupChk()">중복확인</button>		
			</div>
			<div id="isbn-dup-msg"></div>
			
			<div class="col-md-12">
				<label class="form-label">책 설명</label>
				<textarea class="form-control" name="bookDesc" rows="4" required></textarea>
			</div>

			<div class="col-md-6">
				<label class="form-label">츨판사코멘트</label> <input type="text"
					class="form-control" name="bookPubCmt" required>
			</div>


			<div class="col-md-12">
				<label class="form-label">책 목차</label>
				<textarea class="form-control" name="bookIndex" rows="4" required></textarea>
			</div>

			<div class="col-md-12">
				<label class="form-label">도서 이미지</label> <input type="file"
					class="form-control" name="book_img" id="book_img" accept="image/*"
					required> <img id="imgPreview" alt="이미지 미리보기">
			</div>

			<div class="col-md-6">
				<label class="form-label">소분류</label> <select class="form-select"
					name="bscId" required>
					<c:forEach var="category" items="${smallCategoryList}">
						<option value="${category.bscId}">${category.bscName}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="mt-4">
			<button type="submit" class="btn btn-success">도서 등록 신청하기</button>
			<a href="/" class="btn btn-danger px-4 py-2"> 메인으로 </a>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/sw/publisher/js/registerBookForm.js"></script>
</body>
</html>
