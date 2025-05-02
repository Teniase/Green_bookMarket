<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="../resources/sg/cart/css/style.css">
	<%@ include file="sessionChk.jsp" %>
</head>
<body class="bg-light">

  <div class="container container-narrow py-4">
    <!-- 제목 -->
    <h4 class="fw-bold mb-4">
      <i class="bi bi-cart-check-fill me-2"></i>내 장바구니
    </h4>

    <!-- 장바구니 항목 -->
    <div id="cart-container" class="mb-4">
      <!-- JS 렌더링 -->
    </div>

    <!-- 페이지네이션 -->
    <div id="page-container" class="mb-4 text-center">
      <!-- JS 렌더링 -->
    </div>

    <!-- 주문폼 -->
    <form id="order-form-container" action="/cart/orderBooks" method="post"
      class="bg-white rounded shadow-sm p-4">
      <!-- JS 렌더링 -->
    </form>
    
    <form id="order-form-container" action="/cart/orderBooks" method="post">
		<!-- order-form-container -->
	</form>

    <!-- 메인 이동 -->
    <div class="text-end mt-4">
      <a href="/" class="btn btn-outline-danger btn-sm">
        <i class="bi bi-house-door-fill"></i> 메인으로
      </a>
    </div>
  </div>
  
  <script src="../resources/sg/cart/js/script.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">

</script>
</html>
