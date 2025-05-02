<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ✅ 미니 헤더 CSS -->
<style>
  body {
    padding: 0;
  }

  .mini-header-wrapper {
    width: 100%;
  }

  .mini-header {
    background-color: #ffffff;
    border-bottom: 1px solid #dee2e6;
    padding: 16px 32px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
  }

  .mini-header .logo {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
    border: 2px solid #ff914c;
  }

  .mini-header .logo img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .mini-header .username {
    font-weight: 600;
  }

  .mini-header .search-form {
    display: flex;
    align-items: center;
    gap: 8px;
    flex-grow: 1;
    min-width: 200px;
    max-width: 400px;
  }

  .mini-header input#search {
    width: 100%;
    max-width: 300px;
  }
</style>

<!-- ✅ 미니 헤더 HTML -->
<div class="mini-header-wrapper">
  <div class="mini-header">

    <!-- 로고 + 검색창 -->
    <div class="d-flex align-items-center gap-3 flex-wrap">
      <div class="logo">
        <a href="/"><img src="/resources/jb/images/bookmarket.png" alt="로고"></a>
      </div>
      <form class="search-form" onsubmit="searchChk(); return false;">
        <input id="search" class="form-control" type="text" placeholder="검색어를 입력하세요">
        <button class="btn btn-outline-warning" type="submit">
          <i class="bi bi-search"></i>
        </button>
      </form>
    </div>

    <!-- 사용자 메뉴 -->
    <div class="d-flex align-items-center gap-3 mt-3 mt-md-0">
      <c:choose>
        <c:when test="${not empty sessionScope.userId || not empty sessionScope.pubId}">
          <span class="username">
            <c:choose>
              <c:when test="${not empty sessionScope.userId}">
                ${sessionScope.userId}
              </c:when>
              <c:otherwise>
                ${sessionScope.pubId}
              </c:otherwise>
            </c:choose>
          </span>
          <a href="/login/logout" class="btn btn-sm btn-outline-secondary">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="/login/selectLoginForm" class="btn btn-sm btn-outline-primary">로그인</a>
        </c:otherwise>
      </c:choose>
    </div>

  </div>
</div>

<!-- ✅ 검색 스크립트 -->
<script>
  function searchChk() {
    const keyword = document.getElementById("search").value;
    if (keyword.trim() !== '') {
      location.href = "/search/books?keyword=" + encodeURIComponent(keyword) + "&page=1";
    } else {
      alert("검색어를 입력해 주세요");
    }
  }
</script>
