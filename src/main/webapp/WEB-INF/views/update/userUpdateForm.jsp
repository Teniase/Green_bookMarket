<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
<form action="/update/userUpdate" method="post" enctype="multipart/form-data"
onsubmit="return chkUserPw()" name="frm">

	<div class="user-id-container">
	  <div class="user-info">
		<label for="user-id">아이디 : ${user.userId} </label> 
		<input type="hidden" id="user-id" name="userId" value="${user.userId}">

		<label for="user-img">프로필 이미지 : </label> 
		<input type="hidden" name="isReset" id="isReset" value="false">
		<input id="user-img" type="file" name="userUploadImg" accept="image/*" class="userImg-input"
		onchange="previewImage(this)">
	</div>

	<div class="userImg-wrapper">
			<img id="preview" src="/resources/sw/userimage/${user.userImg}" alt="프로필 이미지"
			class="userImg-preview ">
		</div>
	<c:if test="${not empty user.userImg}">
		
		<button type="button" onclick="deleteImg()" class="ImgDel">삭제</button>
	</c:if>
	</div>
	

	<label for="user-name">이름 : </label>
	<input id="user-name" type="text" name="userName" value="${user.userName}" required> <br>
	

	<label for="user-birth">생년월일 : </label>
	<input id="user-birth" type="date" name="userBirth" value="${user.userBirth}" required><br> 

	<label for="user-email">이메일 : </label>
	<div class="input-with-button">
			<input id="user-email" type="text" name="userEmail"
			value="${user.userEmail}"  required="required">
		</div>
	<button type="button" onclick="userEmailDupChk()">중복확인</button>
	<div id="user-email-dup-msg"></div>
	
	<label for="user-pw">비밀번호 : </label>
	<input id="user-pw" type="password" name="userPw" required><br>

	<label for="user-pw2">비밀번호 확인 : </label>
	<input id="user-pw2" type="password" name="userPw2" required><br>

	<label for="user-addr">주소 : </label>
	<input id="user-addr" type="text" name="userAddr" value="${user.userAddr}" required><br>

	<label for="user-tel">전화번호 : </label>
	<input id="user-tel" type="text" name="userTel"
		   value="${user.userTel}" pattern="010-\d{3,4}-\d{4}"
		   title="전화형식은 010-0000-0000입니다" required><br>

	<br><input type="submit" value="회원정보 수정">
	<br><button type="button" onclick="chkDel('${user.userId}')"> 회원탈퇴 </button>
</form>
	<script type="text/javascript" src="/resources/sw/update/js/chkUserPw.js"></script>
</body>
</html>