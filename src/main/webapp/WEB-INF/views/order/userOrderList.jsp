<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 주문 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<%@ include file="userOrderListHeader.jsp" %>
</head>
<body class="bg-light">

<div class="container mt-4" id="user-order-list-container">
  <c:forEach var="summary" items="${orderSummaries}">
  <c:if test="${summary.order.orderDel eq 'n'}">
    <div class="card mb-4 shadow-sm">
      <div class="card-header d-flex justify-content-between align-items-center">
        <div><strong>📦 주문번호:</strong> ${summary.order.orderId}</div>
        <div class="text-muted"><small>📅 ${summary.order.orderDate}</small></div>
      </div>
      <div class="card-body">
        <div class="mb-2">
          <strong>📚 주문 상품:</strong> ${summary.orderName}
        </div>
        <div class="mb-2">
          <strong>💰 총 가격:</strong> ${summary.totalPrice}원
        </div>
        <div>
          <strong>🚚 배송 상황:</strong>
          <span class="badge bg-${summary.order.orderConfirm eq 'y' ? 'success' : 'warning'}">
            <c:choose>
              <c:when test="${summary.order.orderConfirm eq 'y'}">배송중</c:when>
              <c:otherwise>상품준비중</c:otherwise>
            </c:choose>
          </span>
        </div>
      </div>
    </div>
    </c:if>
  </c:forEach>

  <!-- 페이지네이션 -->
  <div class="d-flex justify-content-center mt-4" id="page-container">
    <c:if test="${pgData.startPage != 1}">
      <button class="btn btn-outline-secondary me-2" onclick="reqPage(${pgData.prevPage})">이전</button>
    </c:if>
    <c:forEach var="page" begin="${pgData.startPage}" end="${pgData.endPage}">
      <c:choose>
        <c:when test="${pgData.page == page}">
          <button class="btn btn-primary me-1" id="cur-page-btn" onclick="reqPage(${page})">${page}</button>
        </c:when>
        <c:otherwise>
          <button class="btn btn-outline-secondary me-1" onclick="reqPage(${page})">${page}</button>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${pgData.endPage != pgData.maxPage}">
      <button class="btn btn-outline-secondary ms-2" onclick="reqPage(${pgData.nextPage})">다음</button>
    </c:if>
  </div>
</div>

<script>
  function reqPage(page) {
    const url = new URL(window.location.href);
    url.searchParams.set("page", page);
    window.location.href = url.toString();
  }
</script>
</body>
</html>
