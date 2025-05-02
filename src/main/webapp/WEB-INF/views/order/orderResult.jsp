<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
		/* alert('주문신청 완료');
		location.href = '/order/requestOrders?page=1'; */
			location.href = '/payment/checkout';
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			const notPassedBookName = '${notPassedBook.bookName }';
			alert(notPassedBookName + '의 재고가 없습니다 삭제후 다시 요청해주세요');
			history.back();
		</script>
	</c:if>
	<c:if test="${result <= -1 }">
		<script type="text/javascript">
			const notPassedBookName = '${notPassedBook.bookName }';
			const notPassedBookStock = '${notPassedBook.bookStock}'
			alert(notPassedBookName + '의 요청 갯수가 재고보다 많습니다 ' + '남은 재고 : ' + notPassedBookStock);
			history.back();
		</script>
	</c:if>
</body>
</html>