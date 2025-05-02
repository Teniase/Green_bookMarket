<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마켓 헤더</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> 
<style>
  .top-header {
    background-color: #ffffff;
    border-bottom: 1px solid #dee2e6;
    padding: 16px 32px;
  }

  .search-bar input {
    width: 400px;
    padding: 10px 20px;
    border: 2px solid #ff914c;
    border-right: none;
    border-radius: 30px 0 0 30px;
  }

  .search-bar button {
    border: 2px solid #ff914c;
    border-left: none;
    padding: 0 18px;
    border-radius: 0 30px 30px 0;
    background-color: white;
    transition: background-color 0.3s ease;
  }

  .search-bar button:hover {
    background-color: #ffe7d0;
  }

  .user-profile {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-right: 20px;
  }

  .user-profile img {
    width: 40px;
    height: 40px;
    object-fit: cover;
    border-radius: 50%;
  }

  .nav-link {
    font-weight: 500;
  }
  
  .logo-circle {
  width: 52px;
  height: 52px;
  border-radius: 50%;
  overflow: hidden;
  border: 2px solid #ff914c;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #fff;
}

.logo-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
</head>

<body>

<!-- ✅ 상단 통합 헤더 -->
<div class="top-header d-flex justify-content-between align-items-center flex-wrap">
  
  <!-- 왼쪽: 로고 + 검색창 -->
  <div class="d-flex align-items-center gap-4 flex-wrap">
			<div class="logo-circle">
				<a href="/"> <img src="/resources/jb/images/bookmarket.png"
					alt="로고" class="logo-img">
				</a>
			</div>
			<form class="d-flex search-bar" onsubmit="searchChk(); return false;">
      <input id="search" class="form-control" type="text" placeholder="검색어를 입력하세요">
      <button id="searchbtn" class="btn" type="submit">
        <i class="bi bi-search"></i>
      </button>
    </form>
  </div>

  <!-- 오른쪽: 사용자 메뉴 -->
<div class="d-flex align-items-center flex-wrap">
  <div class="user-profile">
    <c:choose>
      <c:when test="${not empty sessionScope.userId}">
        <c:set var="imgSrc" value="${empty sessionScope.userImg ? 'default_profile.JPG' : sessionScope.userImg}" />
        <img src="/resources/sw/userimage/${imgSrc}" alt="프로필 이미지">
        <c:choose>
          <c:when test="${sessionScope.userId eq 'admin'}">
            <span style="font-weight: bold; color: #d9534f;">관리자(admin)</span>
          </c:when>
          <c:otherwise>
            <span>${sessionScope.userId}</span>
          </c:otherwise>
        </c:choose>
      </c:when>
      <c:when test="${not empty sessionScope.pubId}">
        <span>${sessionScope.pubId}</span>
      </c:when>
    </c:choose>
  </div>

    <nav class="navbar navbar-expand-lg bg-body-white">
  <div class="collapse navbar-collapse show" id="navbarNav">
    <ul class="navbar-nav flex-row gap-3">

      <c:choose>
        <c:when test="${not empty sessionScope.userId || not empty sessionScope.pubId}">
          <c:if test="${sessionScope.userId eq 'admin'}">
            <li class="nav-item"><a class="nav-link" href="/login/logout">로그아웃</a></li>
            <li class="nav-item"><a class="nav-link" href="/update/userUpdateForm">정보수정</a></li>
            <li class="nav-item"><a class="nav-link" href="/userlist/listSelect">회원관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/admin/orderList">주문관리</a></li>
             <li class="nav-item"><a class="nav-link" href="/admin/bookStock">재고관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/admin/bookApproveList">판매신청관리</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.userId and sessionScope.userId ne 'admin'}">
            <li class="nav-item"><a class="nav-link" href="/login/logout">로그아웃</a></li>
            <li class="nav-item"><a class="nav-link" href="/update/userUpdateForm">정보수정</a></li>
            <li class="nav-item"><a class="nav-link" onclick="moveToCart()" style="cursor: pointer;">장바구니</a></li>
            <li class="nav-item"><a class="nav-link" onclick="moveToOrder()" style="cursor: pointer;">주문</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.pubId}">
            <li class="nav-item"><a class="nav-link" href="/login/logout">로그아웃</a></li>
            <li class="nav-item"><a class="nav-link" href="/update/pubUpdateForm">정보수정</a></li>
            <li class="nav-item"><a class="nav-link" href="/publisher/registerBookForm">도서판매신청</a></li>
 			<li class="nav-item"><a class="nav-link" href="/publisher/myRequest">판매신청목록</a></li>
          </c:if>
        </c:when>
    
        <c:otherwise>
          <li class="nav-item"><a class="nav-link" href="/login/selectLoginForm">로그인</a></li>
        </c:otherwise>
      </c:choose>

    </ul>
  </div>
</nav>
  </div>
</div>

<!-- ✅ 기능 스크립트 -->
<script type="text/javascript">
  function searchChk() {
    const keyword = document.getElementById("search").value;
    console.log("keyword = " , keyword);
    if (keyword !== '') {
      location.href = "/search/books?keyword=" + keyword + "&page=1";
    } else {
      alert("검색어를 입력해 주세요");
    }
  }

  async function isUser() {
    try {
      const response = await axios.get('/user/chkIsUser');
      return response.data;
    } catch (error) {
      return false;
    }
  }

  async function moveToCart() {
    const isUserResult = await isUser();
    console.log("result = " , isUserResult);
    if (isUserResult === true) {
      location.href = '/cart/cartForm';
    } else {
      alert('먼저 로그인 해주세요');
    }
  }

  async function moveToOrder() {
    const isUserResult = await isUser();
    if (isUserResult === true) {
      location.href = '/order/requestOrders?page=1';
    } else {
      alert('먼저 로그인 해주세요');
    }
  }
</script>

</body>
</html>
