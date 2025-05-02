function pubIdDupChk() {
	const pubIdDupMsg = document.querySelector("#pub-id-dup-msg");
	const pubId = frm.pubId.value.trim();

	// 1. 입력 안 했을 때
	if (!pubId) {
		frm.pubId.focus();
		pubIdDupMsg.textContent = "사업아이디를 입력해 주세요";
		pubIdDupMsg.style.color = "red";
		pubIdDupMsg.style.display = "block";
		return false;
	}

	// 2. 6자리가 아닐 때
	if (pubId.length !== 6) {
		frm.pubId.focus();
		pubIdDupMsg.textContent = "6자리의 코드를 입력해 주세요";
		pubIdDupMsg.style.color = "red";
		pubIdDupMsg.style.display = "block";
		return false;
	}

	// 3. Ajax로 중복 체크
	$.post('/pubIdDupChk', "pubId=" + pubId, function(data) {
		$('#pub-id-dup-msg').html(data);
		pubIdDupMsg.style.display = "block";
	});
}


 function pubEmailDupChk() {
//	const pubEmailInput = document.querySelector("#pub-email");
	const pubEmailDupMsg = document.querySelector("#pub-email-dup-msg");

	
	if (!frm.pubEmail.value) {
		frm.pubEmail.focus();
		pubEmailDupMsg.textContent = "이메일을입력해주세요";
		pubEmailDupMsg.style.color = "red";
		pubEmailDupMsg.style.display = "block";
		return false;
	}
	$.post('/pubEmailDupChk', "pubEmail="+frm.pubEmail.value, function(data) {
		$('#pub-email-dup-msg').html(data)
	})
}

function chkPubJoinForm() {
	const pubPw = document.querySelector("#pub-pw");
	const pubPw2 = document.querySelector("#pub-pw2");
	
	if (pubPw.value !== pubPw2.value) {
		alert("비밀번호와 비밀번호 확인이 다릅니다");
		return false;
	} else {
		return true;
	}
}