function approveOrder(orderId) {
  if (!confirm("이 주문을 승인하시겠습니까?")) return;

  fetch("/admin/approveOrder", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: "orderId=" + orderId
  }).then(res => res.text())
    .then(result => {
      alert(result);
      location.reload();
    });
}

function showOrderDetail(orderId) {
  fetch(`/admin/orderDetail?orderId=${orderId}`)
    .then(res => res.json())
    .then(data => {
      document.getElementById('modal-order-id').textContent = data.orderId;
      document.getElementById('modal-user-id').textContent = data.userId;
      document.getElementById('modal-order-date').textContent = data.orderDate;
      document.getElementById('modal-order-name').textContent = data.orderName;
      document.getElementById('modal-total-price').textContent = data.totalPrice.toLocaleString();

      const modal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
      modal.show();
    })
    .catch(err => {
      alert("상세정보를 불러오는 데 실패했습니다.");
      console.error(err);
    });
}


document.addEventListener("DOMContentLoaded", function () {
	const buttons = document.querySelectorAll(".page-btn");
	buttons.forEach(btn => {
		btn.addEventListener("click", function () {
			const page = this.getAttribute("data-page");
			if (page) {
				const url = new URL(window.location.href);
				url.searchParams.set("page", page);
				window.location.href = url.toString();
			}
		});
	});
});
