<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정</title>
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
		<div class="detail-wrapper my-5">
			<h2 class="fw-bold mb-4">📚 도서 정보 수정</h2>


			<form action="/bookdetail/bookDetailUpdate" method="post"
				enctype="multipart/form-data" class="row g-4">

				<!-- hidden 값들 -->
				<input type="hidden" name="bookId" value="${book.bookId}"> <input
					type="hidden" name="originImg" value="${book.bookImg}">

				<!-- 왼쪽 : 이미지 + 업로드 -->
				<div class="col-md-5 text-center">
					<img id="preview-img"
						src="<c:out value='
        				${book.bookImg ne null and book.bookImg.startsWith("/uploads/") 
          					? book.bookImg 
         				 : (book.bookImg ne null ? "/resources/sw/bookImg/".concat(book.bookImg) : "/resources/sw/bookImg/noBookImg.png")
      						  }'/>"
						class="img-fluid rounded shadow-sm mb-3" alt="도서 이미지"
						style="max-height: 300px;">
					<div class="mb-3">
						<input type="file" name="uploadImg" id="uploadImg"
							class="form-control" onchange="previewImage(event)"> <small
							class="text-muted"> * 새 파일을 선택하면 위 이미지가 바뀝니다. 선택하지 않으면 기존
							이미지가 유지됩니다. </small>
					</div>
				</div>
				<!-- 오른쪽 : 책 정보 -->
				<div class="col-md-7">
					<div class="mb-3">
						<label class="form-label">도서명</label> <input type="text"
							name="bookName" class="form-control" value="${book.bookName}"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">저자</label> <input type="text"
							name="bookWriter" class="form-control" value="${book.bookWriter}"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">가격</label> <input type="number"
							name="bookPrice" class="form-control" value="${book.bookPrice}"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">재고 수량</label> <input type="number"
							name="bookStock" class="form-control" value="${book.bookStock}"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label">카테고리</label> <select class="form-select"
							name="bscId" required>
							<c:forEach var="category" items="${smallCategoryList}">
								<option value="${category.bscId}"
									<c:if test="${category.bscId == book.bscId}">selected</c:if>>
									${category.bscName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="mb-3">
						<label class="form-label">책 소개</label>
						<textarea name="bookDesc" class="form-control" rows="4" required>${book.bookDesc}</textarea>
					</div>

					<div class="mb-3">
						<label class="form-label">목차</label>
						<textarea name="bookIndex" class="form-control" rows="4" required>${book.bookIndex}</textarea>
					</div>

					<!-- 버튼 -->
					<div class="d-flex gap-3 mt-4">
						<button type="submit" class="btn btn-primary px-4 py-2">✅
							수정 완료</button>
						<a href="${backUrl}" class="btn btn-outline-secondary px-4 py-2">🔙
							돌아가기</a>
					</div>
				</div>

			</form>
			<!-- ★★★ form 닫기 ★★★ -->

		</div>
		<!-- detail-wrapper -->
	</div>
	<!-- container -->


	<script>
		function previewImage(event) {
			const input = event.target;
			const reader = new FileReader();

			reader.onload = function(e) {
				const preview = document.getElementById('preview-img');
				preview.src = e.target.result; // 새로 선택한 이미지로 미리보기 src 교체
			};

			if (input.files && input.files[0]) {
				reader.readAsDataURL(input.files[0]); // 파일을 읽어 DataURL로 변환
			}
		}
	</script>
</body>
</html>
