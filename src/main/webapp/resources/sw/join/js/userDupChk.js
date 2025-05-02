function userIdDupChk() {
	// const userIdInput = document.querySelector("#user-id");
	 const userIdDupMsg = document.querySelector("#user-id-dup-msg");
	
	if (!frm.userId.value) {
		frm.userId.focus();
		userIdDupMsg.textContent = "아이디를 입력해 주세요";
		userIdDupMsg.style.color = "red";
		userIdDupMsg.style.display = "block";
		return false;
	}
	$.post('/userIdDupChk', "userId="+frm.userId.value, function(data) {
		$('#user-id-dup-msg').html(data)
	})
	
}

 function userEmailDupChk() {
//	const userEmailInput = document.querySelector("#user-email");
	const userEmailDupMsg = document.querySelector("#user-email-dup-msg");

	
	if (!frm.userEmail.value) {
		frm.userEmail.focus();
		userEmailDupMsg.textContent = "이메일을입력해주세요";
		userEmailDupMsg.style.color = "red";
		userEmailDupMsg.style.display = "block";
		return false;
	}
	$.post('/userEmailDupChk', "userEmail="+frm.userEmail.value, function(data) {
		$('#user-email-dup-msg').html(data)
	})
}

function chkUserJoinForm() {
	const userPw = document.querySelector("#user-pw");
	const userPw2 = document.querySelector("#user-pw2");
	
	if (userPw.value !== userPw2.value) {
		alert("비밀번호와 비밀번호 확인이 다릅니다");
		return false;
	} else {
		return true;
	}
	

}