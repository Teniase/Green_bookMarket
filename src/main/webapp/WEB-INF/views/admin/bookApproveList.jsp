<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 승인 요청</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="/resources/sw/admin/css/bookApproveList.css">
</head>
<script>
	function confirmApproval(form) {
		if (confirm("정말 이 도서를 승인하시겠습니까?")) {
			form.querySelector("button[type='submit']").disabled = true;
			return true;
		}
		return false;
	}
</script>
<body class="container py-5">

	<h2 class="mb-4">📋 도서 등록 승인 요청 목록</h2>


	<c:if test="${empty bookList}">
		<div class="alert alert-info">현재 승인 대기 중인 도서가 없습니다.</div>
	</c:if>

	<c:if test="${not empty bookList}">
		<table class="table table-bordered table-hover align-middle">
			<thead class="table-success text-center">
				<tr>
					<th>도서 ID</th>
					<th>제목</th>
					<th>저자</th>
					<th>가격</th>
					<th>출판일</th>
					<th>출판사 ID</th>
					<th>신청일</th>
					<th>상세정보</th>
					<th>승인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${bookList}">
					<tr>
						<td class="text-center">${book.bookId}</td>
						<td>${book.bookName}</td>
						<td>${book.bookWriter}</td>
						<td class="text-end">${book.bookPrice}원</td>
						<td class="text-center">${book.bookDate}</td>
						<td class="text-center">${book.pubId}</td>
						<td class="text-center">${book.bsrDate}</td>
						<td class="text-center">
							<button class="btn btn-outline-secondary btn-sm"
								data-bs-toggle="modal"
								data-bs-target="#bookDetailModal${book.bookId}">보기</button> <!-- 상세정보 모달 -->
							<div class="modal fade" id="bookDetailModal${book.bookId}"
								tabindex="-1"
								aria-labelledby="bookDetailModalLabel${book.bookId}"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title"
												id="bookDetailModalLabel${book.bookId}">${book.bookName}
												상세정보</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p>
												<strong>도서 ID:</strong> ${book.bookId}
											</p>
											<p>
												<strong>저자:</strong> ${book.bookWriter}
											</p>
											<p>
												<strong>ISBN:</strong> ${book.bookIsbn}
											</p>
											<p>
												<strong>크기:</strong> ${book.bookSize}
											</p>
											<p>
												<strong>페이지 수:</strong> ${book.bookPage}
											</p>
											<p>
												<strong>설명:</strong> ${book.bookDesc}
											</p>
											<p>
												<strong>목차:</strong> ${book.bookIndex}
											</p>
											<c:if test="${not empty book.bookImg}">
												<p>
													<strong>도서 이미지:</strong>
												</p>
												<img src="/resources/sw/bookImg/${book.bookImg}"
													class="img-fluid" alt="도서 이미지" />
											</c:if>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</td>

						<td class="text-center">
							<!-- 승인 버튼 -->
							<form method="post" action="/admin/approveBook"
								onsubmit="return confirmApproval(this);">
								<input type="hidden" name="bsrId" value="${book.bsrId}" />
								<button type="submit" class="btn btn-success btn-sm mb-1">승인</button>
							</form> <!-- 반려 버튼 (모달 트리거) -->
							<button class="btn btn-danger btn-sm" data-bs-toggle="modal"
								data-bs-target="#rejectModal${book.bsrId}">반려</button> <!-- 반려 사유 입력 모달 -->
							<div class="modal fade" id="rejectModal${book.bsrId}"
								tabindex="-1" aria-labelledby="rejectModalLabel${book.bsrId}"
								aria-hidden="true">
								<div class="modal-dialog">
									<form method="post" action="/admin/rejectBook"
										onsubmit="return confirmReject(this);">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="rejectModalLabel${book.bsrId}">반려
													사유 입력</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="닫기"></button>
											</div>
											<div class="modal-body">
												<input type="hidden" name="bsrId" value="${book.bsrId}" />
												<div class="mb-3">
													<label for="note${book.bsrId}" class="form-label">반려
														사유</label>
													<textarea class="form-control" id="reason${book.bsrId}"
														name="reason" rows="3"
														placeholder="예: 표지 이미지 오류, 내용 부적절 등" required></textarea>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-danger">반려 처리</button>
											</div>
										</div>
									</form>
								</div>
							</div>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<div>
	
		<c:if test="${brTotalPages > 0}">
			<nav aria-label="BookRegister pagination">
				<ul class="pagination justify-content-center custom-pagination">

					<!-- ◁◀ 이전 페이지 -->
					<c:if test="${startPage > 1}">
						<li class="page-item"><a class="page-link"
							href='<c:url value="/admin/bookApproveList"><c:param name="brPage" value="1"/></c:url>'>◁</a>
						</li>
						<li class="page-item"><a class="page-link"
							href='<c:url value="/admin/bookApproveList"><c:param name="brPage" value="${startPage - 1}"/></c:url>'>◀</a>
						</li>
					</c:if>

					<!-- 중간 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${i == brPage ? 'active' : ''}"><a
							class="page-link"
							href='<c:url value="/admin/bookApproveList"><c:param name="brPage" value="${i}"/></c:url>'>${i}</a>
						</li>
					</c:forEach>

					<!-- ▶▷ 다음 페이지 -->
					<c:if test="${endPage < brTotalPages}">
						<li class="page-item"><a class="page-link"
							href='<c:url value="/admin/bookApproveList"><c:param name="brPage" value="${endPage + 1}"/></c:url>'>▶</a>
						</li>
						<li class="page-item"><a class="page-link"
							href='<c:url value="/admin/bookApproveList"><c:param name="brPage" value="${brTotalPages}"/></c:url>'>▷</a>
						</li>
					</c:if>

				</ul>
			</nav>
		</c:if>

	</div>
	   <!-- 메인 이동 -->
    <div class="text-end mt-4">
      <a href="/" class="btn btn-outline-danger btn-sm">
        <i class="bi bi-house-door-fill"></i> 메인으로
      </a>
    </div>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
