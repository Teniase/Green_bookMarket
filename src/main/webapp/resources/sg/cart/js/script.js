const bookReqCntRegex = /^(?:[1-9]|[1-9][0-9]|[1-9][0-9]{2})$/;
const currencyFormatter = new Intl.NumberFormat('ko-KR', {
  style: 'currency',
  currency: 'KRW',
});

let reqPageResponse = null;
let curBookReqInputValues = [];

window.onload = async function () {
  await reqPage(1);
};

async function reqPage(page) {
  try {
    const { data } = await axios.post('/cart/cartData', { page });
    if (!data?.isSuccess) throw new Error('데이터 없음');

    reqPageResponse = data;
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
  }
}

async function clearCartContainer() {
  document.getElementById('cart-container').innerHTML = '';
}

async function clearPageContainer() {
  const pageContainer = document.getElementById('page-container');
  if (pageContainer) pageContainer.innerHTML = '';
}

async function clearOrderFormContainer() {
  document.getElementById('order-form-container').innerHTML = '';
}

async function insertBooks() {
  const cartContainer = document.getElementById('cart-container');
  const bookList = reqPageResponse.bookList;

  bookList.forEach((book, i) => {
    curBookReqInputValues[i] = book.bookCnt;

    const bookContainer = document.createElement('div');
    bookContainer.classList.add('book-container');

	// 이미지 영역
	const bookImgContainer = document.createElement('div');
	bookImgContainer.classList.add('book-img-container');

	const bookImg = document.createElement('img');
	bookImg.classList.add('book-img');

	if (book.bookImg) {
	    if (book.bookImg.startsWith('/uploads/')) {
	        // 업로드한 파일이면 그대로 경로 사용
	        bookImg.src = book.bookImg;
	    } else {
	        // 기존 등록 파일이면 resources/sw/bookImg/ 붙여서 사용
	        bookImg.src = `/resources/sw/bookImg/${book.bookImg}`;
	    }
	} else {
	    // bookImg가 없으면 noBookImg
	    bookImg.src = '/resources/sw/bookImg/noBookImg.png';
	}

	bookImgContainer.appendChild(bookImg);
	bookContainer.appendChild(bookImgContainer);

    // 설명 영역
    const bookDesc = document.createElement('div');
    bookDesc.classList.add('book-desc-container');
    bookDesc.innerHTML = `
      <div class="d-flex flex-column gap-1">
        <div class="fw-semibold mb-1 fs-6">${book.bookName}</div>
        <div class="d-flex flex-column small bg-light rounded px-3 py-2 border">
          <div><span class="text-muted">단가:</span> <strong class="text-dark">${currencyFormatter.format(book.bookPrice)}</strong></div>
		  <div><span class="text-muted">재고:</span> <strong class="text-primary">${book.bookStock}</strong></div>
		  <div><span class="text-muted">총 합계:</span> <strong class="text-danger" id="book-total-${i}">${currencyFormatter.format(book.bookCnt * book.bookPrice)}</strong></div>
        </div>
      </div>`;
    bookContainer.appendChild(bookDesc);

    // 수량 조절
    const inputGroup = document.createElement('div');
    inputGroup.classList.add('input-group', 'justify-content-center', 'mt-2');

    const minusBtn = document.createElement('button');
    minusBtn.classList.add('btn', 'btn-outline-secondary', 'btn-sm');
    minusBtn.innerText = '-';
    minusBtn.onclick = () => {
      bookReqCntInput.stepDown();
      bookReqCntInput.dispatchEvent(new Event('input'));
    };

    const bookReqCntInput = document.createElement('input');
    bookReqCntInput.classList.add('form-control', 'text-center', 'book-req-cnt-input');
    bookReqCntInput.type = 'number';
    bookReqCntInput.min = '1';
    bookReqCntInput.max = '999';
    bookReqCntInput.value = book.bookCnt;
    bookReqCntInput.style.width = '60px';

    bookReqCntInput.oninput = async function () {
      const value = parseInt(bookReqCntInput.value);
      if (!bookReqCntRegex.test(value)) {
        bookReqCntInput.value = curBookReqInputValues[i];
        alert('올바른 값을 입력해주세요 (1~999)');
        return;
      }

      const response = await updateCartBookCnt(book.cartId, value);
      if (response) {
        document.getElementById(`book-total-${i}`).innerText = currencyFormatter.format(value * book.bookPrice);
        document.getElementById('total-order-display-container').innerText =
          '총 주문 금액 : ' + currencyFormatter.format(response.data.totalOrderPrice).replace('₩', '').trim() + '원';
        curBookReqInputValues[i] = value;
      } else {
        bookReqCntInput.value = curBookReqInputValues[i];
        alert('장바구니 책 갯수 업데이트 오류');
      }
    };

    const plusBtn = document.createElement('button');
    plusBtn.classList.add('btn', 'btn-outline-secondary', 'btn-sm');
    plusBtn.innerText = '+';
    plusBtn.onclick = () => {
      const current = parseInt(bookReqCntInput.value);
      if (current >= book.bookStock) {
        alert('❗ 재고보다 많은 수량은 선택할 수 없습니다.');
        return;
      }
      bookReqCntInput.stepUp();
      bookReqCntInput.dispatchEvent(new Event('input'));
    };

    inputGroup.appendChild(minusBtn);
    inputGroup.appendChild(bookReqCntInput);
    inputGroup.appendChild(plusBtn);

    const reqContainer = document.createElement('div');
    reqContainer.classList.add('book-request-container');
    reqContainer.appendChild(inputGroup);
    bookContainer.appendChild(reqContainer);
	
	const deleteBtn = document.createElement('button');
	deleteBtn.classList.add('btn', 'btn-outline-danger', 'px-3', 'py-1', 'w-auto');
	deleteBtn.innerText = '삭제';
	deleteBtn.style.marginLeft = '8px';  // 👉 수량조절 버튼과 자연스럽게 띄우기
	deleteBtn.onclick = async () => {
	  const result = await deleteBookFromCart(book.cartId);
	  if (result === true) await reqPage(reqPageResponse.pgData.page);
	};

	

    const deleteContainer = document.createElement('div');
    deleteContainer.classList.add('book-delete-container');
    deleteContainer.appendChild(deleteBtn);
    bookContainer.appendChild(deleteContainer);

    cartContainer.appendChild(bookContainer);
  });
}

async function insertPages() {
  const pageContainer = document.getElementById('page-container');
  const pgData = reqPageResponse.pgData;

  if (pgData.startPage !== 1) {
    const btn = document.createElement('button');
    btn.innerText = '이전';
    btn.onclick = () => reqPage(pgData.prevPage);
    pageContainer.appendChild(btn);
  }

  for (let i = pgData.startPage; i <= pgData.endPage; i++) {
    const btn = document.createElement('button');
    btn.innerText = i;
    btn.className = pgData.page === i ? 'active' : 'page-btn';
    btn.onclick = () => reqPage(i);
    pageContainer.appendChild(btn);
  }

  if (pgData.endPage !== pgData.maxPage) {
    const btn = document.createElement('button');
    btn.innerText = '다음';
    btn.onclick = () => reqPage(pgData.nextPage);
    pageContainer.appendChild(btn);
  }
}

async function insertOrders() {
  const orderFormContainer = document.getElementById('order-form-container');
  const totalOrderPrice = await reqTotalOrderPrice();

  const totalDisplay = document.createElement('div');
  totalDisplay.id = 'total-order-display-container';
  totalDisplay.innerText = '총 주문 금액 : ' + currencyFormatter.format(totalOrderPrice).replace('₩', '').trim() + '원';
  orderFormContainer.appendChild(totalDisplay);

  const orderBtn = document.createElement('button');
  orderBtn.id = 'order-btn';
  orderBtn.type = 'submit';
  orderBtn.innerText = '주문하기';
  orderBtn.onclick = function () {
    if (document.getElementById('cart-container').innerText === '') {
      alert('최소 1개 이상의 책을 골라주세요');
      return false;
    }
    return true;
  };
  orderFormContainer.appendChild(orderBtn);
}

async function updateCartBookCnt(cartId, bookCnt) {
  try {
    return await axios.post('/cart/updateCartBookCnt', { cartId, bookCnt });
  } catch {
    return null;
  }
}

async function reqTotalOrderPrice() {
  try {
    const { data } = await axios.get('/cart/totalOrderPrice');
    return data;
  } catch {
    return 0;
  }
}

async function deleteBookFromCart(cartId) {
  try {
    const { data } = await axios.post('/cart/deleteBook', { cartId });
    return data;
  } catch {
    return false;
  }
}

