<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet" href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<title>Insert title here</title>

</head>
<body>

		<section class="container col-lg-12">
			<div class="row">
				<div class="col-lg-3 bg-secondary m-5 text-center">
						<nav id="side_left" class="my-auto">
							<ul class="list-unstyled ">
								<li class="p-1"><a href="/myPage/studyDiaryList">공부일기</span>&nbsp;&nbsp;<i class="bi bi-journal-check fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/scheduleList">일정관리&nbsp;&nbsp; <i class="bi bi-calendar-month fs-1"></i></a></li>
								<li class="p-1"><a href="#">1:1 채팅목록&nbsp;&nbsp;<i class="bi bi-chat-square-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/joinGroupList">참가 그룹 목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/categoryUpdate">관심 분야 수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/userUpdate">회원 정보 수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원 탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i></a></li>
							</ul>
						</nav>
				</div>
				<div class="col-8" id="contents">
				<h3>회원탈퇴 신청<i class="bi bi-trash fs-1"></i></h3>
				
				<p class="fs-3"><i class="bi bi-emoji-dizzy fs-1"></i> Study Group 계정삭제</p>
				<hr style="width:800px">	
				<div class="border border-primary my-auto text-center">
					<br>
					<b>중요한 내용이므로 주의 깊게 읽어 주세요.</b><br><br>
					다양한 Study Group 서비스에 엑세스 할 수 있는 Study Group 계정을 삭제하려고 합니다. 더 이상 Study Group 서비스를 이용할 수 없으며 계정과 데이터가 삭제됩니다.<br><br>
					${sessionScope.user.user_id} 계정을 삭제하기 전에 데이터를 다운로드할 수 있습니다.<br><br>

				</div>
				<p class="fs-3"><i class="bi bi-emoji-dizzy-fill fs-1"></i> 탈퇴 사유</p>
				<p class="fs-10">( 탈퇴 사유를 입력하여주시면 사유를 참고하여 더 나은 서비스를 만드는데 참고하겠습니다. )</p>
				<form action="quitUser" method="post">
						<input type="hidden" name="user_no" value="${sessionScope.user.user_no}">
						<textarea name="withdraw_reason" cols="105" rows="10"></textarea>
						<div class="text-center">
							<button type="submit" class="btn btn-primary p-1">회원탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</section>
</body>
</html>
</body>
</html>