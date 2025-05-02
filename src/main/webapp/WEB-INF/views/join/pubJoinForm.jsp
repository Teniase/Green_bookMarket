<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출판사 회원가입</title>
	<link rel="stylesheet" href="/resources/sw/join/css/join-form.css">
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<form action="/join/pubJoin" method="post" onsubmit="return chkPubJoinForm()" name="frm">
		<label for="pub-id">사업자아이디: </label>
		<div class="input-with-button">
			<input id="pub-id" type="text" name="pubId" required="required">
			<button type="button" onclick="pubIdDupChk()">중복확인</button>
		</div>
		<div id="pub-id-dup-msg"></div>

		<label for="pub-name">출판사 이름 : </label>
		<input id="pub-name" type="text" name="pubName" required="required" autofocus="autofocus"><br>
		
		<label for="pub-ceo">대표 이름 : </label>
		<input id="pub-ceo" type="text" name="pubCeo" required="required" autofocus="autofocus"><br>
		
		<label for="pub-mgr">담당자 이름 : </label>
		<input id="pub-mgr" type="text" name="pubMgr" required="required" autofocus="autofocus"><br>
		
		<label for="pub-email">이메일 : </label>
		<div class="input-with-button">
			<input id="pub-email" type="text" name="pubEmail"
				required="required">
			<button type="button" onclick="pubEmailDupChk()">중복확인</button>
		</div>
		<div id="pub-email-dup-msg"></div>

		<label for="pub-pw">비밀번호 : </label>
		<input id="pub-pw" type="password" name="pubPw" required="required" autofocus="autofocus"><br>
		
		<label for="pub-pw2">비밀번호 확인 : </label>
		<input id="pub-pw2" type="password" name="pubPw2" required="required" autofocus="autofocus"><br>
		
		<label for="pub-addr">주소 : </label>
		<input id="pub-addr" type="text" name="pubAddr" required="required" autofocus="autofocus"><br>
		
		<label for="pub-tel">전화번호 : </label>
		<input id="pub-tel" type="text" name="pubTel" required="required" autofocus="autofocus" pattern="010-\d{3,4}-\d{4}" title="전화형식은 010-0000-0000입니다"><br>
		
		<br><input type="submit" value="회원가입">
	</form>
	<script type="text/javascript" src="/resources/sw/join/js/pubDupChk.js"></script>
</body>
</html>