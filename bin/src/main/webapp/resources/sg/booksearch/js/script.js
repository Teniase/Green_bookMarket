function reqPage(keyword, page) {
	location.href = "/search/books?keyword=" + keyword + "&page=" + page;
}

function reqBookDetail(id) {
	location.href = "/detail/books?id=" + id;
}
