<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/sw/userlist/css/user-detail.css">
</head>
<body class="container py-5">


	<div class="detail-container">
		<div class="detail-card shadow">
			<h2 class="detail-title">회원 상세정보</h2>

			<div class="profile-box">
				<c:choose>
					<c:when test="${not empty user.userImg}">
						<img class="profile-img"
							src="/resources/sw/userimage/${user.userImg}" alt="사용자 이미지">
					</c:when>
					<c:otherwise>
						<img class="profile-img" src="/resources/sw/userimage/default_profile.jpg"
							alt="기본 이미지">
					</c:otherwise>
				</c:choose>
				<h4 class="mb-0">${user.userName}</h4>
			</div>

			<table class="table table-bordered table-custom">
				<tr>
					<th>아이디</th>
					<td>${user.userId}</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>${user.userBirth}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${user.userTel}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${user.userEmail}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${user.userAddr}</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td>${user.userJoin}</td>
				</tr>
			</table>
			
			<c:url var="backUrl" value="/userlist/listSelect">
				<c:param name="userPage" value="${param.userPage}" />
				<c:param name="pubPage" value="${param.pubPage}" />
				<c:param name="withdraw" value="${param.withdraw}" />
			</c:url>
			
			<div class="text-end mt-4">
			<!-- 	<a class="btn btn-outline-success" href="/userlist/listSelect">목록으로</a> -->
				<a class="btn btn-outline-success" href="${backUrl}#user-tab">목록으로</a>
			</div>
		</div>
	</div>


</body>
</html>