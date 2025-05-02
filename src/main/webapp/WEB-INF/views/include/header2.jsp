<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#searchForm>div {
	display: inline;
	height: 200px;
}

#searchForm img {
	width: 210px;
}

#searchDiv {
	/* border: 3px solid #ff914c;
	border-radius: 30px;
	padding: 16px 2px; */
	vertical-align: baseline;
}

#search {
	height: 3.2em;
	width: 66%;
	padding: 10px 10px 12px 20px;
	border: 3px solid #ff914c;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

#searchbtn {
	height: 3.2em;
	width: 5%;
	background-color: white;
	padding-right: 10px;
	border-top-right-radius: 30px;
	border-bottom-right-radius: 30px;
	border: 3px solid #ff914c;
}

#searchbtn:hover {
	background-color: #ebe1da;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid justify-content-between">

			<!-- ✅ 왼쪽: 로그인 유저 정보 표시 영역 -->
			<div class="d-flex align-items-center">
				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<!-- 유저 프로필 + 아이디 -->
						<img src="/resources/sw/userimage/${sessionScope.userImg}"
							alt="프로필 이미지" class="rounded-circle" width="40" height="40"
							style="object-fit: cover; margin-right: 8px;">

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

			<!-- ✅ 오른쪽: 메뉴 영역 -->
			<div class="collapse navbar-collapse flex-row-reverse" id="navbarNav">
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${not empty sessionScope.userId || not empty sessionScope.pubId}" >
							<li class="nav-item"><a class="nav-link"
								href="/login/logout">로그아웃</a></li>
							<c:choose>
								<c:when test="${not empty sessionScope.userId}">
									<li class="nav-item"><a class="nav-link"
										href="/update/userUpdateForm">정보수정</a></li>
									
								</c:when>
								<c:when test="${not empty sessionScope.pubId}">
									<li class="nav-item"><a class="nav-link"
										href="/update/pubUpdateForm">정보수정</a></li>
								</c:when>

							</c:choose>

							<!-- ✅ 관리자 메뉴 (예: userId가 'admin'일 경우) -->
							<c:if test="${sessionScope.userId eq 'admin'}">
								<li class="nav-item"><a class="nav-link"
									href="/userlist/listSelect">회원관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#">상품관리</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								href="/login/selectLoginForm">로그인</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link"
						onclick="moveToCart()" style="cursor: pointer;">장바구니</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="moveToOrder()" style="cursor: pointer;">주문/배송</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<%-- <nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid flex-row-reverse">
		
			<div class="collapse navbar-collapse flex-row-reverse" id="navbarNav">
				<ul class="navbar-nav">
					  <!-- 로그인 상태에 따라 분기 -->
					<c:choose>
						<c:when test="${not empty sessionScope.userId ||not empty sessionScope.pubId}">
							<!-- 로그인 상태 -->
							<li class="nav-item"><a class="nav-link" href="/login/logout">로그아웃</a>
							</li>
							<c:choose>
								<c:when test="${not empty sessionScope.userId}">
									<li class="nav-item"><a class="nav-link"
										href="/update/userUpdateForm">정보수정</a></li>
								</c:when>
								<c:when test="${not empty sessionScope.pubId}">
									<li class="nav-item"><a class="nav-link"
										href="/update/pubUpdateForm">정보수정</a></li>
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
							<!-- 비로그인 상태 -->
							<li class="nav-item"><a class="nav-link"
								href="/login/selectLoginForm">로그인</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" onclick="moveToCart()" style="cursor: pointer;">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" onclick="moveToOrder()" style="cursor: pointer;">주문/배송</a></li>
				</ul>
			</div>
		</div>
	</nav> --%>
	<div id="searchForm">
			<img alt="" src="/resources/jb/images/bookmarket.png">
		<div id="searchDiv">
			<input id="search" type="text" placeholder="...검색">
			<button id="searchbtn" onclick="searchChk()">
				<i id="searchIcon" class="bi bi-search"></i>
			</button>
		</div>
	</div>
	<script type="text/javascript">
		function searchChk() {
			const keyword = document.getElementById("search").value;
			
			if (keyword !== '') {
				location.href = "/search/books?keyword=" + keyword + "&page=1";
			} else {
				alert("검색어를 입력해 주세요");
			}
		}
		
		async function isUser() {
			let response = null;
			try {
				response = await axios.get('/user/chkIsUser');
				
				return response.data;
			} catch (error) {
				return false;
			}
		}
		
		async function moveToCart() {
			let isUserResult = await isUser();
			
			if (isUserResult === true) {
				location.href = '/cart/cartForm';
			} else {
				alert('먼저 로그인 해주세요');
			}
		}
		
		async function moveToOrder() {
			let isUserResult = await isUser();
			
			if (isUserResult === true) {
				location.href = '/order/requestOrders?page=1';
			} else {
				alert('먼저 로그인 해주세요');
			}
		}
	</script>
</body>
</html>