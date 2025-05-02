$(document).ready(function() {
    $('#findUserPw').on('submit', function(e) {
        e.preventDefault(); // 폼 기본 제출 막기

        var userId = $('#userId').val();
        var userEmail = $('#userEmail').val();

        // 간단한 유효성 검사
        if (!userId || !userEmail) {
            alert("아이디와 이메일을 모두 입력하세요.");
            return;
        }

        $.post("/findInfo/findUserPw",
           "userId="+userId+"&userEmail="+userEmail,
            function(response) {
                alert(response); // 서버 응답을 alert로 출력
            }
        );
    });
});

$(document).ready(function() {
    $('#findPubPw').on('submit', function(e) {
        e.preventDefault(); // 폼 기본 제출 막기

        var pubId = $('#pubId').val();
        var pubEmail = $('#pubEmail').val();

        // 간단한 유효성 검사
        if (!pubId || !pubEmail) {
            alert("아이디와 이메일을 모두 입력하세요.");
            return;
        }

        $.post("/findInfo/findPubPw",
           "pubId="+pubId+"&pubEmail="+pubEmail,
            function(response) {
                alert(response); // 서버 응답을 alert로 출력
            }
        );
    });
});

$(document).ready(function () {
    $('.tab-btn').click(function () {
      var target = $(this).data('tab');

      // 버튼 클래스 관리
      $('.tab-btn').removeClass('active');
      $(this).addClass('active');

      // 콘텐츠 표시 전환
      $('.tab-content').removeClass('active');
      $('#' + target).addClass('active');
    });
  });