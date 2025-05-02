const bookReqCntRegex = /^(?:[1-9]|[1-9][0-9]|[1-9][0-9]{2})$/;
const currencyFormatter = new Intl.NumberFormat('ko-KR', {
	style: 'currency',
	currency: 'KRW',
});

let reqPageResponse = null;
let curBookReqInputValues = [];

window.onload = async function() {
	await reqPage(1);
}

async function reqPage(page) {
	const data = {
		page: page,
	};
	
	try {
		reqPageResponse = await axios.post('/cart/cartData', data);
		
		if(reqPageResponse.data.isSuccess !== true || reqPageResponse.data === null || 
			reqPageResponse.data === undefined || reqPageResponse.data === '') {
			await clearCartContainer();
			await clearPageContainer();
			alert('장바구니 페이지 요청 오류');
			return;
		}
		
		curBookReqInputValues = [];
		
		await clearCartContainer();
		await clearPageContainer();
		await clearOrderFormContainer();
		await insertBooks();
		await insertPages();
		await insertOrders();
	} catch (error) {
		await clearCartContainer();
		await clearPageContainer();
		await clearOrderFormContainer();
		alert('장바구니 오류');
		return;
	}
}

async function clearCartContainer() {
	const cartContainer = document.getElementById('cart-container');
	cartContainer.innerHTML = '';
}

async function insertBooks() {
	const cartContainer = document.getElementById('cart-container');
	const bookList = reqPageResponse.data.bookList;
	
	for (let i = 0; i < bookList.length; i++) {
		curBookReqInputValues[i] = bookList[i].bookCnt;
		////////////////////////////////////////////////////////////////////////////////////////
		const bookContainer = document.createElement('div');
		bookContainer.classList.add('book-container');
		cartContainer.appendChild(bookContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookImgContainer = document.createElement('div');
		bookImgContainer.classList.add('book-img-container');
		bookContainer.appendChild(bookImgContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookImgElement = document.createElement('img');
		bookImgElement.classList.add('book-img');
		if (bookList[i].bookImg !== null) {
			bookImgElement.src = '../resources/sw/bookImg/' + bookList[i].bookImg;
		} else {
			bookImgElement.src = '../resources/sw/bookImg/noBookImg.png';
		}
		bookImgContainer.appendChild(bookImgElement);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookDescContainer = document.createElement('div');
		bookDescContainer.classList.add('book-desc-container');
		bookDescContainer.innerText = bookList[i].bookName;
		bookContainer.appendChild(bookDescContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookRequestContainer = document.createElement('div');
		bookRequestContainer.classList.add('book-request-container');
		bookContainer.appendChild(bookRequestContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookRequestPriceContainer = document.createElement('div');
		bookRequestPriceContainer.classList.add('book-request-price-container');
		bookRequestPriceContainer.innerText = '단가 : ' + 
		currencyFormatter.format(bookList[i].bookPrice).replace('₩', '').trim() + '원\n' + '총 합계 : ' + 
		currencyFormatter.format(bookList[i].bookCnt * bookList[i].bookPrice).replace('₩', '').trim() + '원';
		bookRequestContainer.appendChild(bookRequestPriceContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookReqCntInput = document.createElement('input');
		bookReqCntInput.classList.add('book-req-cnt-input');
		bookReqCntInput.type = 'number';
		bookReqCntInput.min = '1';
		bookReqCntInput.max = '999';
		bookReqCntInput.value = bookList[i].bookCnt;
		bookReqCntInput.oninput = async function() {
			const bookReqCntInput = document.getElementsByClassName('book-req-cnt-input')[i];
			const inputValue = bookReqCntInput.value;
			
			if (bookReqCntRegex.test(inputValue)) {
				const updateBookCntResponse = await updateCartBookCnt(bookList[i].cartId, inputValue);
				if (updateBookCntResponse !== null) {
					bookRequestPriceContainer.innerText = '단가 : ' + 
					currencyFormatter.format(bookList[i].bookPrice).replace('₩', '').trim() + '원\n' + '총 합계 : ' + 
					currencyFormatter.format(inputValue * bookList[i].bookPrice).replace('₩', '').trim() + '원';
					
					const totalOrderDisplayContainer = document.getElementById('total-order-display-container');
					totalOrderDisplayContainer.innerText = '총 주문 금액 : ' + 
					currencyFormatter.format(updateBookCntResponse.data.totalOrderPrice).replace('₩', '').trim() + '원';
					curBookReqInputValues[i] = inputValue;
				} else {
					bookReqCntInput.value = curBookReqInputValues[i];
					alert('장바구니 책 갯수 업데이트 오류');
					return;
				}
			} else {
				bookReqCntInput.value = curBookReqInputValues[i];
				alert('올바른 값을 입력해주세요 최솟값: 1, 최댓값: 999');
			}
		};
		bookRequestContainer.appendChild(bookReqCntInput);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookCntDisplyContainer = document.createElement('div');
		bookCntDisplyContainer.classList.add('book-cnt-display-container');
		bookCntDisplyContainer.innerText = '개';
		bookRequestContainer.appendChild(bookCntDisplyContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookDeleteContainer = document.createElement('div');
		bookDeleteContainer.classList.add('book-delete-container');
		bookContainer.appendChild(bookDeleteContainer);
		////////////////////////////////////////////////////////////////////////////////////////
		const bookDeleteBtn = document.createElement('button');
		bookDeleteBtn.classList.add('book-delete-btn');
		bookDeleteBtn.innerText = '삭제';
		bookDeleteBtn.onclick = async function() {
			let result = false;
			result = await deleteBookFromCart(bookList[i].cartId);
			
			if (result === true) {
				await reqPage(reqPageResponse.data.pgData.page);
			}
		};
		bookDeleteContainer.appendChild(bookDeleteBtn);
	}
}

async function clearPageContainer() {
	const pageContainer = document.getElementById('page-container');
	pageContainer.innerHTML = '';
}

async function insertPages() {
	const pageContainer = document.getElementById('page-container');
	const pgData = reqPageResponse.data.pgData;
	
	if (pgData.startPage !== 1) {
		const btn = document.createElement('button');
		const prevPage = pgData.prevPage;
		
		btn.innerText = '이전';
		btn.id = 'prev-page-btn';
		btn.onclick = async function() {
			await reqPage(prevPage);
		}
		
		pageContainer.appendChild(btn);
	}
	
	for (let i = pgData.startPage; i <= pgData.endPage; i++) {
		if (pgData.page === i) {
			const btn = document.createElement('button');
			
			btn.innerText = i;
			btn.id = 'cur-page-btn';
			btn.onclick = async function() {
				await reqPage(i);
			}
			
			pageContainer.appendChild(btn);
		} else {
			const btn = document.createElement('button');
			
			btn.innerText = i;
			btn.classList.add('page-btn');
			btn.onclick = async function() {
				await reqPage(i);
			}
			
			pageContainer.appendChild(btn);
		}
	}
	
	if (pgData.endPage !== pgData.maxPage) {
		const btn = document.createElement('button');
		const nextPage = pgData.nextPage;
		
		btn.innerText = '다음';
		btn.id = 'next-page-btn';
		btn.onclick = async function() {
			await reqPage(nextPage);
		}
		
		pageContainer.appendChild(btn);
	}
}

async function updateCartBookCnt(cId, value) {
	let response = null;
	
	const data = {
		cartId : cId,
		bookCnt : value,
	};
	
	try {
		response = await axios.post('/cart/updateCartBookCnt', data);
		
		return response;
	} catch (error) {
		return null;
	}
}

async function insertOrders() {
	const cartContainer = document.getElementById('cart-container');
	const orderFormContainer = document.getElementById('order-form-container');
	let totalOrderPrice = await reqTotalOrderPrice();
	
	const totalOrderDisplayContainer = document.createElement('div');
	totalOrderDisplayContainer.id = 'total-order-display-container';
	totalOrderDisplayContainer.innerText = '총 주문 금액 : ' + currencyFormatter.format(totalOrderPrice).replace('₩', '').trim() + '원';
	orderFormContainer.appendChild(totalOrderDisplayContainer);
	////////////////////////////////////////////////////////////////////////////////////////
	const orderBtn = document.createElement('button');
	orderBtn.id = 'order-btn';
	orderBtn.type = 'submit';
	orderBtn.innerText = '주문하기';
	orderBtn.onclick = function () {
		if (cartContainer.innerText === '') {
			alert('최소 1개 이상의 책을 골라주세요');
			return false;
		} else {
			return true;
		}
	};
	orderFormContainer.appendChild(orderBtn);
}

async function reqTotalOrderPrice() {
	let response = null;
	
	try {
		response = await axios.get('/cart/totalOrderPrice');
		
		return response.data;
	} catch (error) {
		return null;
	}
}

async function clearOrderFormContainer() {
	const orderFormContainer = document.getElementById('order-form-container');
	orderFormContainer.innerHTML = '';
}

async function deleteBookFromCart(cId) {
	let response = null;
	
	const data = {
		cartId: cId,
	};
	
	try {
		response = await axios.post('/cart/deleteBook', data);
		return response.data;
	} catch (error) {
		return false;
	}
}

