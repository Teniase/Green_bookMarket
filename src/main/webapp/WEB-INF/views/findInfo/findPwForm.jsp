<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/sw/findInfo/css/find-info.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="find-container">
	<h2 class="find-title">비밀번호 찾기</h2>

	<!-- 탭 헤더 -->
	<div class="tab-header">
		<button class="tab-btn active" data-tab="user-tab">일반회원</button>
		<button class="tab-btn" data-tab="publisher-tab">출판사회원</button>
	</div>

	<!-- 일반회원 탭 -->
	<div id="user-tab" class="tab-content active">
		<form action="/findInfo/findUserPw" method="post" id="findUserPw">
			<div class="find-form-group">
				<label for="userId">아이디</label>
				<input type="text" id="userId" name="userId" placeholder="아이디 입력" required>
			</div>
			
			<div class="find-form-group">
				<label for="userEmail">이메일</label>
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일 입력" required>
			</div>

			<button type="submit" class="find-submit-btn">비밀번호 찾기</button>
		</form>
	</div>

	<!-- 출판사 탭 -->
	<div id="publisher-tab" class="tab-content">
		<form action="/findInfo/findPubPw" method="post" id="findPubPw">
			<div class="find-form-group">
				<label for="pubId">출판사 아이디</label>
				<input type="text" id="pubId" name="pubId" placeholder="출판사 아이디 입력" required>
			</div>
			
			<div class="find-form-group">
				<label for="pubEmail">이메일</label>
				<input type="email" id="pubEmail" name="pubEmail" placeholder="이메일 입력" required>
			</div>

			<button type="submit" class="find-submit-btn">비밀번호 찾기</button>
		</form>
		<script type="text/javascript" src="/resources/sw/findInfo/js/findPw.js"></script>
	</div>
</div>

</body>
</html>
