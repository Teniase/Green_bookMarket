<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>카테고리 도서 목록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    .card-img-top {
      height: 240px;
      object-fit: cover;
      border-top-left-radius: 12px;
      border-top-right-radius: 12px;
    }
    .card {
      border-radius: 12px;
      transition: transform 0.2s;
    }
    .card:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }
    .pagination .page-link {
      color: #2b473e;
    }
    .pagination .page-item.active .page-link {
      background-color: #6d8c50;
      border-color: #6d8c50;
      color: #fff;
    }
  </style>
</head>
<body>
  <%@ include file="../include/header.jsp" %>

  <div class="container py-5">
    <h2 class="mb-4">📘 카테고리 도서 목록</h2>

    <div class="row">
      <c:forEach var="book" items="${books}">
        <div class="col-md-3 col-sm-6 mb-4">
          <div class="card h-100 shadow-sm">
            <img src="/resources/jb/bookImg/${book.book_img}" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">${book.book_name}</h5>
              <p class="card-text text-muted">${book.book_writer}</p>
              <p class="card-text fw-bold">${book.book_price}원</p>
              <a href="/book/detail?bookId=${book.book_id}" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- 페이징 -->
    <nav class="mt-4">
      <ul class="pagination justify-content-center">
        <c:forEach begin="1" end="${totalPages}" var="i">
          <li class="page-item ${i == page ? 'active' : ''}">
            <a class="page-link" href="/category?bscId=${bscId}&page=${i}">${i}</a>
          </li>
        </c:forEach>
      </ul>
    </nav>
  </div>

  <%@ include file="../include/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
