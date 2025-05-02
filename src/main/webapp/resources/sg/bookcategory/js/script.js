function reqPage(bscId, page) {
	location.href = '/book/category?bscId=' + bscId + '&page=' + page;
}

function reqBookDetail(id) {
	location.href = '/detail/books?id=' + id;
}
