<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/sw/login/css/user-login-form.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="select-container">
  <form action="/login/userLogin" method="post" class="login-form">
  <label for="user-id">아이디 : </label>
  <input id="user-id" type="text" name="userId" required="required">

  <label for="user-pw">비밀번호 : </label>
  <input id="user-pw" type="password" name="userPw" required="required">

  <input type="submit" value="로그인">
</form>
</div>

</body>
</html>