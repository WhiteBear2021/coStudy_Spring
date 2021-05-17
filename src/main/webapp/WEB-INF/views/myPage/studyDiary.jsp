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
					<h3>Study Diary 글쓰기</h3>
					<hr style="width:800px;" class="text-primary">
					<div class="row">
						<div class="form-group">
							<form action="studyDiary" method="post">
								<input type="hidden" name="user_no" class="form-control mt-4 mb-2" value="${sessionScope.user.user_no}">
								<label>
								제목 : <input type="text" name="studyNote_title" style="width:300%;" placeholder="제목">
								</label><br><br>
								<label>
								키워드 : <input type="text" name="studyNote_keyword" style="width:300%;" placeholder="키워드를 입력해주세요.">
								</label><br><br>
								<label>
								글내용 :
								<textarea class="form-control" rows="10" cols="100" name="studyNote_content" placeholder="내용을 입력해주세요" required></textarea> 
								</label><br><br>
								<label>
								파일 : <input type="file" name="studyNote_file"> 
								</label><br><br>
								<div class="text-start">
								<button type="submit" class="btn btn-primary">글작성</button>
								</div>
							</form>
						</div>
					</div>
					
					
				</div>
			</div>
		</section>		
</body>
</html>