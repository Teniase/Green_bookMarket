<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 도서 신청 현황</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10">

				<h2 class="mb-4 text-center">📚 내가 신청한 도서 목록</h2>

				<c:if test="${empty myRequest}">
					<div class="alert alert-info text-center">신청한 도서가 없습니다.</div>
				</c:if>

				<c:if test="${not empty myRequest}">
					<div class="table-responsive">
						<table
							class="table table-bordered table-hover text-center align-middle">
							<thead class="table-success">
								<tr>
									<th>도서명</th>
									<th>저자</th>
									<th>가격</th>
									<th>신청일</th>
									<th>승인 상태</th>
									<th>반려 사유</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="book" items="${myRequest}">
									<tr>
										<td>${book.bookName}</td>
										<td>${book.bookWriter}</td>
										<td>${book.bookPrice}원</td>
										<td>${book.bsrDate}</td>
										<td><c:choose>
												<c:when test="${book.bsrYn == 'y'}">
													<span class="badge bg-success">승인됨</span>
												</c:when>
												<c:when test="${book.bsrYn == 'n'}">
													<span class="badge bg-warning text-dark">대기중</span>
												</c:when>
												<c:when test="${book.bsrYn == 'r'}">
													<span class="badge bg-danger">반려됨</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">-</span>
												</c:otherwise>
											</c:choose></td>
										<td><c:if test="${book.bsrYn == 'r'}">
			                                ${book.bsrReason}
			                            </c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>

			</div>
		</div>
		<div class="text-center mt-4">
			<a href="/" class="btn btn-outline-danger btn-sm"> <i
				class="bi bi-house-door-fill"></i> 메인으로
			</a>
		</div>
		<br>
		<div>
			<c:if test="${mrTotalPages > 0}">
				<nav aria-label="myRequest pagination">
					<ul class="pagination justify-content-center custom-pagination">

						<!-- ◁◀ 이전 페이지 -->
						<c:if test="${startPage > 1}">
							<li class="page-item"><a class="page-link"
								href='<c:url value="/publisher/myRequest"><c:param name="mrPage" value="1"/></c:url>'>◁</a>
							</li>
							<li class="page-item"><a class="page-link"
								href='<c:url value="/publisher/myRequest"><c:param name="mrPage" value="${startPage - 1}"/></c:url>'>◀</a>
							</li>
						</c:if>

						<!-- 중간 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item ${i == brPage ? 'active' : ''}"><a
								class="page-link"
								href='<c:url value="/publisher/myRequest"><c:param name="mrPage" value="${i}"/></c:url>'>${i}</a>
							</li>
						</c:forEach>

						<!-- ▶▷ 다음 페이지 -->
						<c:if test="${endPage < brTotalPages}">
							<li class="page-item"><a class="page-link"
								href='<c:url value="/publisher/myRequest"><c:param name="mrPage" value="${endPage + 1}"/></c:url>'>▶</a>
							</li>
							<li class="page-item"><a class="page-link"
								href='<c:url value="/publisher/myRequest"><c:param name="mrPage" value="${mrTotalPages}"/></c:url>'>▷</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</c:if>
		</div>
	</div>

</body>
</html>
