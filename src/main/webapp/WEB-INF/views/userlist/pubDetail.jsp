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
				<h4 class="mb-0">${bookPub.pubName}</h4>
			</div>

			<table class="table table-bordered table-custom">
				<tr>
					<th>이름</th>
					<td>${bookPub.pubName}</td>
				</tr>
				<tr>
					<th>사업번호</th>
					<td>${bookPub.pubId}</td>
				</tr>
				<tr>
					<th>대표</th>
					<td>${bookPub.pubCeo}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${bookPub.pubMgr}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${bookPub.pubEmail}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${bookPub.pubAddr}</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td>${bookPub.pubJoin}</td>
				</tr>
			</table>
			<c:url var="backUrl" value="/userlist/listSelect">
				<c:param name="userPage" value="${param.userPage}" />
				<c:param name="pubPage" value="${param.pubPage}" />
				<c:param name="withdraw" value="${param.withdraw}" />
			</c:url>
			<div class="text-end mt-4">
				<a class="btn btn-outline-success" href="${backUrl}#publisher-tab">목록으로</a>
			</div>
		</div>
	</div>


</body>
</html>