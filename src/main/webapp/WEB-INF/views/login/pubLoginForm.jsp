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
  <form action="/login/pubLogin" method="post" class="login-form">
  <label for="pub-id">사업아이디 : </label>
  <input id="pub-id" type="text" name="pubId" required="required">
  

  <label for="pub-pw">비밀번호 : </label>
  <input id="pub-pw" type="password" name="pubPw" required="required">

  <input type="submit" value="로그인" onsubmit="">
</form>

</body>
</html>