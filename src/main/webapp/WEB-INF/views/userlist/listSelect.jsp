<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 유형 선택</title>

<!-- CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="/resources/sw/userlist/css/select-list.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- 탭 버튼 -->
	<div class="tab-header">
		<button class="tab-btn active" data-tab="user-tab">일반회원</button>
		<button class="tab-btn" data-tab="publisher-tab">출판사회원</button>
	</div>

	<!-- 탈퇴회원 숨기기 체크박스 -->
	<div class="withdraw-toggle-container">
		<label> <input type="checkbox" id="hideWithdrawn"
			${withdraw eq 'true' ? 'checked' : ''} /> 탈퇴회원 숨기기
		</label>
	</div>


	<!-- 일반회원 탭 -->
	<div id="user-tab" class="tab-content active">
		<div class="d-flex justify-content-center mb-4">
			<form method="get" action="/userlist/listSelect"
				class="d-flex flex-wrap gap-2 align-items-center">
				<select name="searchType" class="form-select w-auto">
					<c:forTokens var="st" items="user_name,user_id,user_email" delims="," varStatus="i">
					<option value="${st }" <c:if test="${st == searchType}">selected</c:if>
						>${title[i.index] }</option>	
					</c:forTokens>				
				</select> 
				<input type="text" name="keyword" value="${keyword}"
					class="form-control w-auto" placeholder="검색어 입력"> 
					<input type="hidden" name="withdraw" value="${withdraw}" />
				<button type="submit" class="btn btn-success">검색</button>
			</form>
		</div>

		<table class="table table-custom">
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr class="${user.userDel == 'y' ? 'withdrawn-row' : ''}">
						<td><c:choose>
								<c:when test="${user.userDel == 'y'}">
									<span class="withdrawn-name">${user.userName} (탈퇴)</span>
								</c:when>
								<c:otherwise>
									<a class="btn btn-outline-success btn-sm"
										href="/userlist/userDetail?userId=${user.userId}&userPage=${userPage}&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">
										${user.userName} </a>
								</c:otherwise>
							</c:choose></td>
						<td class="${user.userDel == 'y' ? 'withdrawn-name' : ''}">${user.userId}</td>
						<td class="${user.userDel == 'y' ? 'withdrawn-name' : ''}">${user.userEmail}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 일반회원 페이징 -->
		<nav aria-label="User pagination">
			<ul class="pagination justify-content-center custom-pagination">
				<c:if test="${userPage > 1}">
					<li class="page-item"><a class="page-link"
						href="?userPage=1&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">◁</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage - 1}&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">◀</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${userTotalPages}">
					<li class="page-item ${i == userPage ? 'active' : ''}"><a
						class="page-link"
						href="?userPage=${i}&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${userPage < userTotalPages}">
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage + 1}&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">▶</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="?userPage=${userTotalPages}&pubPage=${pubPage}&withdraw=${withdraw}#user-tab">▷</a>
					</li>
				</c:if>
			</ul>
		</nav>
		   <div class="text-end mt-4">
      <a href="/" class="btn btn-outline-danger btn-sm">
        <i class="bi bi-house-door-fill"></i> 메인으로
      </a>
    </div>
	</div>

	<!-- 출판사회원 탭 -->
	<div id="publisher-tab" class="tab-content">
		<!-- 📌 출판사 검색 -->
		<div class="d-flex justify-content-center mb-4">
			<form method="get" action="/userlist/listSelect#publisher-tab"
				class="d-flex flex-wrap gap-2 align-items-center">
				<select name="searchType2" class="form-select w-auto">
					<c:forTokens var="st" items="pub_name,pub_id,pub_email" delims="," varStatus="i">
					<option value="${st }" <c:if test="${st == searchType2}">selected</c:if>
						>${title[i.index] }</option>	
					</c:forTokens>				
				</select> 
				<input type="text" name="keyword2" value="${keyword2}"
					class="form-control w-auto" placeholder="검색어 입력">  
				<input type="hidden" name="withdraw" value="${withdraw}" />
				<button type="submit" class="btn btn-success">검색</button>
			</form>
		</div>
		

		<table class="table table-custom">
			<thead>
				<tr>
					<th>출판사이름</th>
					<th>아이디</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bookPub" items="${pubList}">
					<tr class="${bookPub.pubDel == 'y' ? 'withdrawn-row' : ''}">
						<td><c:choose>
								<c:when test="${bookPub.pubDel == 'y'}">
									<span class="withdrawn-name">${bookPub.pubName} (탈퇴)</span>
								</c:when>
								<c:otherwise>
									<a class="btn btn-outline-success btn-sm"
										href="/userlist/pubDetail?pubId=${bookPub.pubId}&userPage=${userPage}&pubPage=${pubPage}&withdraw=${withdraw}#publisher-tab">
										${bookPub.pubName} </a>
								</c:otherwise>
							</c:choose></td>
						<td class="${bookPub.pubDel == 'y' ? 'withdrawn-name' : ''}">${bookPub.pubId}</td>
						<td class="${bookPub.pubDel == 'y' ? 'withdrawn-name' : ''}">${bookPub.pubEmail}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 출판사 페이징 -->
		<nav aria-label="Publisher pagination">
			<ul class="pagination justify-content-center custom-pagination">
				<c:if test="${pubPage > 1}">
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage}&pubPage=1&withdraw=${withdraw}#publisher-tab">◁</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage}&pubPage=${pubPage - 1}&withdraw=${withdraw}#publisher-tab">◀</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${pubTotalPages}">
					<li class="page-item ${i == pubPage ? 'active' : ''}"><a
						class="page-link"
						href="?userPage=${userPage}&pubPage=${i}&withdraw=${withdraw}#publisher-tab">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pubPage < pubTotalPages}">
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage}&pubPage=${pubPage + 1}&withdraw=${withdraw}#publisher-tab">▶</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="?userPage=${userPage}&pubPage=${pubTotalPages}&withdraw=${withdraw}#publisher-tab">▷</a>
					</li>
				</c:if>
			</ul>
		</nav>
    <div class="text-end mt-4">
      <a href="/" class="btn btn-outline-danger btn-sm">
        <i class="bi bi-house-door-fill"></i> 메인으로
      </a>
    </div>
    
	</div>


	<!-- 외부 JS 연결 -->
	<script src="/resources/sw/userlist/js/select-list.js"></script>
</body>
</html>
