const bookReqCntRegex = /^(?:[1-9]|[1-9][0-9]|[1-9][0-9]{2})$/;
const currencyFormatter = new Intl.NumberFormat('ko-KR', {
	style: 'currency',
	currency: 'KRW',
});

let curBookReqCntInputValue = 1;


// 🔁 수량 입력 시 총 가격 자동 계산 + 유효성 검증
function refreshBookTotalPrice(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');

	if (!bookReqCntRegex.test(bookReqCntInput.value)) {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}

	let cnt = parseInt(bookReqCntInput.value);

	if (cnt > maxStock) {
		alert('❗ 재고보다 많은 수량은 선택할 수 없습니다.');
		cnt = maxStock;
		bookReqCntInput.value = cnt;
	}

	curBookReqCntInputValue = cnt;
	bookTotalPriceInput.value = currencyFormatter.format(unitPrice * cnt).replace('₩', '').trim();
}

// ➖ 수량 감소
function decBookReqCnt(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');

	if (!bookReqCntRegex.test(bookReqCntInput.value)) {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}

	let cnt = parseInt(bookReqCntInput.value);
	if (cnt > 1) {
		cnt--;
		bookReqCntInput.value = cnt;
		curBookReqCntInputValue = cnt;
		bookTotalPriceInput.value = currencyFormatter.format(unitPrice * cnt).replace('₩', '').trim();
	}
}

function incBookReqCnt(unitPrice) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	const bookTotalPriceInput = document.getElementById('book-total-price');

	if (!bookReqCntRegex.test(bookReqCntInput.value)) {
		bookReqCntInput.value = curBookReqCntInputValue;
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}

	let curCnt = parseInt(bookReqCntInput.value);

	// ✅ 수량이 재고보다 작을 때만 증가하고, 같거나 많으면 아무것도 안 함
	if (curCnt >= maxStock) {
		alert("❗ 재고보다 많은 수량은 선택할 수 없습니다.");
		 return;
	}
	curCnt++;
	bookReqCntInput.value = curCnt;
	curBookReqCntInputValue = curCnt;

	bookTotalPriceInput.value = currencyFormatter.format(unitPrice * curCnt).replace('₩', '').trim();
}



// 🛒 장바구니 담기
async function addBook(id) {
	const bookReqCntInput = document.getElementById('book-req-cnt');
	let isUserResult = await isUser();

	if (!isUserResult) {
		alert("먼저 로그인 해주세요");
		return;
	}

	if (!bookReqCntRegex.test(bookReqCntInput.value)) {
		alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
		return;
	}

	const data = {
		bookId: id,
		bookCnt: bookReqCntInput.value
	};

	try {
		const response = await axios.post('/cart/addBook', data);
		switch (response.data) {
			case 1:
				alert('장바구니 담기 성공');
				break;
			case 0:
				alert('이미 장바구니에 있습니다');
				break;
			case -1:
				alert('장바구니에 넣을 수 있는 책의 최대 갯수를 초과했습니다 (최대 : 15개)');
				break;
			case -2:
				alert('관리자는 장바구니 이용불가');
				break;
			default:
				alert('장바구니 오류');
		}
	} catch (error) {
		alert('장바구니 오류');
	}
}

// ❤️ 추천 기능
async function rcdBook(id) {
	let isUserResult = await isUser();
	if (!isUserResult) {
		alert("먼저 로그인 해주세요");
		return;
	}

	if (await isBookRcdExist(id)) {
		alert('추천은 1일 1회만 가능합니다');
		return;
	}

	const insertResult = await insertBookRcd(id);
	if (insertResult === -1) {
		alert('관리자는 추천할 수 없습니다');
		return;
	}
	if (insertResult !== 1) {
		alert('추천 오류');
		return;
	}

	try {
		const response = await axios.post('/book/incBookRcdCnt', { bookId: id });
		if (response.data.isSuccess) {
			await doRefreshBookRcdCnt(response.data.bookRcdCnt);
			alert('추천 성공');
		} else {
			alert('추천하기 실패');
		}
	} catch (error) {
		alert('추천 증가 오류');
	}
}

// 🧩 보조 함수들
async function isUser() {
	try {
		const response = await axios.get('/user/chkIsUser');
		return response.data;
	} catch {
		return false;
	}
}

async function isBookRcdExist(id) {
	try {
		const response = await axios.post('/bookRcd/chkIsRcdExist', { bookId: id });
		return response.data;
	} catch {
		return false;
	}
}

async function insertBookRcd(id) {
	try {
		const response = await axios.post('/bookRcd/insert', { bookId: id });
		return response.data;
	} catch {
		return false;
	}
}

async function doRefreshBookRcdCnt(cnt) {
	const container = document.getElementById('book-rcd-container');
	container.innerHTML =
		`<i class="bi bi-heart-fill text-danger fs-5"></i>
		<span class="badge bg-light text-dark border border-danger rounded-pill px-3 py-2 shadow-sm">
			추천수 <strong class="text-danger">${cnt}</strong>
		</span>`;
}

function chkDel(bookId) {
	let cf = confirm("정말로 삭제하시겠습니까?");

	if (cf) {
		location.href = "/bookdetail/bookDelete?bookId=" + bookId;
	} else {
		alert("탈퇴취소")
	}
}
