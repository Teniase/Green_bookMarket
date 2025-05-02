<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/sw/update/css/update-form.css">
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<form action="/update/pubUpdate" method="post" onsubmit="return chkPubPw()" name="frm">
	<label for="pub-id">아이디 : ${bookPub.pubId} </label>
	<input type="hidden" id="pub-id" name="pubId" value="${bookPub.pubId}" >
	
	<label for="pub-name">출판사 이름 : </label>
	<input id="pub-name" type="text" name="pubName" value="${bookPub.pubName}" required> <br> 
	
	<label for="pub-ceo">대표 이름: </label>
	<input id="pub-ceo" type="text" name="pubCeo" value="${bookPub.pubCeo}" required> <br> 
	
	<label for="pub-mgr">관리자 이름 : </label>
	<input id="pub-mgr" type="text" name="pubMgr" value="${bookPub.pubMgr}" required> <br> 

	<label for="pub-email">이메일 : </label>
	<div class="input-with-button">
			<input id="pub-email" type="text" name="pubEmail"
			value="${bookPub.pubEmail}"   required="required">
		</div>
	<button type="button" onclick="pubEmailDupChk()">중복확인</button>
	<div id="pub-email-dup-msg"></div>


	<label for="pub-pw">비밀번호 : </label>
	<input id="pub-pw" type="password" name="pubPw" required><br>

	<label for="pub-pw2">비밀번호 확인 : </label>
	<input id="pub-pw2" type="password" name="pubPw2" required><br>

	<label for="pub-addr">주소 : </label>
	<input id="pub-addr" type="text" name="pubAddr" value="${bookPub.pubAddr}" required><br>

	<br><input type="submit" value="회원정보 수정">
	<br><button type="button" onclick="chkDel('${bookPub.pubId}')"> 탈퇴 </button>
</form>
	<script type="text/javascript" src="/resources/sw/update/js/chkPubPw.js"></script>

</body>
</html>