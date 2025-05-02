<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/jb/paymentCss/style.css">
</head>
<body class="bg-light">
	<div class="container payment-container my-5">
		<div class="order-summary card shadow-sm p-2 mb-3 small-box">
			<div
				class="d-flex justify-content-between align-items-center mb-2 px-2">
				<small class="text-dark fw-semibold">📦 주문 상품</small> <small
					class="text-muted">총 ${totalBookCnt}권</small>
			</div>
			<div class="book-list">
				<c:forEach var="detail" items="${details}">
					<div class="book-item">
						<c:choose>
							<c:when
								test="${not empty detail.bookImg and detail.bookImg.startsWith('/uploads/')}">
								<img src="${detail.bookImg}" class="book-img-fixed">
							</c:when>
							<c:otherwise>
								<img
									src="/resources/sw/bookImg/${detail.bookImg != null ? detail.bookImg : 'noBookImg.png'}"
									class="book-img-fixed">
							</c:otherwise>
						</c:choose>

						<div class="book-info">
							<div class="book-title-fixed">[${detail.bscName}]
								${detail.bookName}</div>
							<div class="book-meta-row">
								<span class="price">${detail.bookPrice}원</span> <span
									class="times"> × </span> <span class="count">${detail.odrCnt}권</span>
								<span class="equals"> = </span> <span class="total-price">${detail.bookPrice * detail.odrCnt}원</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


			<div class="text-end mt-2 fw-bold text-primary px-2"
				style="font-size: 14px;">총 결제금액: ${totalPrice}원</div>
		</div>


		<div class="card p-3 shadow-sm mb-4 small-box">
			<div id="payment-method" class="mb-2"></div>
			<div id="agreement"></div>
		</div>

		<div class="text-end">
			<button id="payment-button"
				class="btn btn-success btn-sm px-4 py-2 rounded-pill">💳
				결제하기</button>
		</div>
	</div>

	<script>
		const button = document.getElementById("payment-button");
		const amount = "${totalPrice}";
		const orderId = "${payOrderId}";
		const widgetClientKey = "${widgetClientKey}";
		const customerKey = "${user.userId}";
		const paymentWidget = PaymentWidget(widgetClientKey, customerKey);

		const paymentMethodWidget = paymentWidget.renderPaymentMethods(
				"#payment-method", {
					value : amount
				}, {
					variantKey : "DEFAULT"
				});

		paymentWidget.renderAgreement("#agreement", {
			variantKey : "AGREEMENT"
		});

		button.addEventListener("click", function() {
			paymentWidget.requestPayment({
				orderId : "${payOrderId}",
				orderName : "${orderName}",
				successUrl : window.location.origin + "/payment/success",
				failUrl : window.location.origin + "/payment/fail",
				customerEmail : "${user.userEmail}",
				customerName : "${user.userName}",
				customerMobilePhone : "${user.userTel}",
			});
		});
	</script>
</body>
</html>
