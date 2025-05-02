<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 유형 선택</title>
	<link rel="stylesheet" href="/resources/sw/login/css/select-form.css">
</head>
<body>
		
	<div class="select-container">
		<h2 class="select-title">회원 유형을 선택하세요</h2>
		<button class="select-button" onclick="selectUserLoginForm()">일반회원</button>
		<button class="select-button" onclick="selectPubLoginForm()">출판사회원</button>
		<button class="select-button" onclick="selectJoinForm()">회원가입</button>
		<a class="btn btn-outline-success btn-sm"  href="/findInfo/findIdForm">아이디찾기</a>
  		<a class="btn btn-outline-success btn-sm" href="/findInfo/findPwForm">비밀번호찾기</a>	
	</div>

	<script type="text/javascript" src="/resources/sw/login/js/select-form.js"></script>
</body>
</html>
