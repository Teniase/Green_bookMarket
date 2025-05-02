<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/sw/join/css/join-form.css">
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<form action="/join/userJoin" method="post" onsubmit="return chkUserJoinForm()" name="frm">
		<label for="user-id">아이디 : </label>
		<div class="input-with-button">
			<input id="user-id" type="text" name="userId" required="required">
			<button type="button" onclick="userIdDupChk()">중복확인</button>
		</div>
		<div id="user-id-dup-msg"></div>

		<label for="user-name">이름 : </label>
		<input id="user-name" type="text" name="userName" required="required" autofocus="autofocus"><br>
		
		<label for="user-birth">생년월일 : </label>
		<input id="user-birth" type="date" name="userBirth" required="required" autofocus="autofocus"><br> 
		
		<label for="user-email">이메일 : </label>
		<div class="input-with-button">
			<input id="user-email" type="text" name="userEmail"
				required="required">
			<button type="button" onclick="userEmailDupChk()">중복확인</button>
		</div>
		<div id="user-email-dup-msg"></div>

		<label for="user-pw">비밀번호 : </label>
		<input id="user-pw" type="password" name="userPw" required="required" autofocus="autofocus"><br>
		
		<label for="user-pw2">비밀번호 확인 : </label>
		<input id="user-pw2" type="password" name="userPw2" required="required" autofocus="autofocus"><br>
		
		<label for="user-addr">주소 : </label>
		<input id="user-addr" type="text" name="userAddr" required="required" autofocus="autofocus"><br>
		
		<label for="user-tel">전화번호 : </label>
		<input id="user-tel" type="text" name="userTel" required="required" autofocus="autofocus" pattern="010-\d{3,4}-\d{4}" title="전화형식은 010-0000-0000입니다"><br>
		
		<br><input type="submit" value="회원가입">
	</form>
	<script type="text/javascript" src="/resources/sw/join/js/userDupChk.js"></script>
</body>
</html>