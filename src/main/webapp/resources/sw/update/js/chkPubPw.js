function chkPubPw() {
	const pubPw = document.querySelector("#pub-pw");
	const pubPw2 = document.querySelector("#pub-pw2");
	
	if (pubPw.value !== pubPw2.value) {
		alert("비밀번호와 비밀번호 확인이 다릅니다");
		return false;
	} else {
		return true;
	}
}

function chkDel(pubId) {
	let cf = confirm("정말로 탈퇴하시겠습니까?");
	
	if(cf) {
		location.href = "/update/pubDelete?pubId=" + pubId;
	} else {
		alert("탈퇴취소")
	}
}


 function pubEmailDupChk() {
//	const userEmailInput = document.querySelector("#user-email");
	const PubEmailDupMsg = document.querySelector("#pub-email-dup-msg");

	
	if (!frm.pubEmail.value) {
		frm.pubEmail.focus();
		PubEmailDupMsg.textContent = "이메일을입력해주세요";
		PubEmailDupMsg.style.color = "red";
		PubEmailDupMsg.style.display = "block";
		return false;
	}
	$.post('/pubEmailDupChk', "pubEmail="+frm.pubEmail.value, function(data) {
		$('#pub-email-dup-msg').html(data)
	})
}
