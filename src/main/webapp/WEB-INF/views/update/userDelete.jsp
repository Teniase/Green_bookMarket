<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("탈퇴성공")
		location.href = "/login/selectLoginForm"
	</script>
</c:if>

<c:if test="${result <= 0}">
	<script type="text/javascript">
		alert("탈퇴실패")
		history.back();
	</script>
</c:if>
</body>
</html>