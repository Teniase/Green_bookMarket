<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header_mini.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 유형 선택</title>

	<!-- 외부 CSS 로딩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="/resources/sw/login/css/select-form.css">
</head>
<body>


	<!-- 중앙정렬 영역 -->
	<div class="content-center-wrapper">
		<div class="select-container">
			<h2 class="select-title">회원 유형을 선택하세요</h2>
			<button class="select-button" onclick="selectUserLoginForm()">일반회원</button>
			<button class="select-button" onclick="selectPubLoginForm()">출판사회원</button>
			<button class="select-button" onclick="selectJoinForm()">회원가입</button>
			<a class="btn btn-outline-success btn-sm" href="/findInfo/findIdForm">아이디찾기</a>
			<a class="btn btn-outline-success btn-sm" href="/findInfo/findPwForm">비밀번호찾기</a>
		</div>
	</div>

	<script src="/resources/sw/login/js/select-form.js"></script>
</body>
</html>
