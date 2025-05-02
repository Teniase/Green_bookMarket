<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/jb/paymentCss/success.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container complete-container">
		<h2 class="complete-title">🧾 주문 완료</h2>
		<div class="complete-message">
			고객님의 <strong>${orderName}</strong> 주문이 <br>정상적으로 완료되었습니다.
		</div>

		<div class="complete-info mb-4">
			<p id="orderId"></p>
			<p id="amount"></p>
		</div>

		<table class="complete-table mb-4">
			<tr>
				<td>전화번호</td>
				<td>${user.userTel}</td>
			</tr>
			<tr>
				<td>수령인</td>
				<td>${user.userName}</td>
			</tr>
			<tr>
				<td>배송지</td>
				<td>${user.userAddr}</td>
			</tr>
		</table>

		<div class="text-end">
			<button onclick="location.href='/order/requestOrders?page=1'" class="complete-button">
				주문 목록 보기
			</button>
		</div>

		<p id="paymentKey" style="display: none;"></p>
	</div>

	<script>
		const urlParams = new URLSearchParams(window.location.search);
		const paymentKey = urlParams.get("paymentKey");
		const orderId = urlParams.get("orderId");
		const amount = urlParams.get("amount");

		async function confirm() {
			const requestData = {
				paymentKey : paymentKey,
				orderId : orderId,
				amount : amount
			};

			const response = await fetch("/confirm", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json",
				},
				body : JSON.stringify(requestData),
			});

			const json = await response.json();

			if (!response.ok) {
				window.location.href = `/fail?message=${json.message}&code=${json.code}`;
			}

			console.log(json);
		}
		confirm();

		document.getElementById("orderId").textContent = "주문번호: " + orderId;
		document.getElementById("amount").textContent = "결제 금액: " + amount;
		document.getElementById("paymentKey").textContent = "paymentKey: " + paymentKey;
	</script>
</body>
</html>
