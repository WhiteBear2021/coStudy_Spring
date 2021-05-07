<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/myPage/myPage.css">
<link rel="stylesheet" href="../bootstrap-icons/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<section class="container col-lg-12">
			<div class="row">
				<div class="col-lg-3 bg-secondary m-5 text-center">
						<nav id="side_left" class="my-auto">
							<ul class="list-unstyled ">
								<li class="p-1"><a href="/CoStudy/myPage/studyDiaryListAction.do">공부일기</span>&nbsp;&nbsp;<i class="bi bi-journal-check fs-1"></i></a></li>
								<li class="p-1"><a href="/CoStudy/myPage/scheduleListAction.do">일정관리&nbsp;&nbsp; <i class="bi bi-calendar-month fs-1"></i></a></li>
								<li class="p-1"><a href="#">1:1 채팅목록&nbsp;&nbsp;<i class="bi bi-chat-square-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/CoStudy/myPage/joinGroupListAction.do">참가 그룹 목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/CoStudy/myPage/categoryUpdateFormAction.do">관심 분야 수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i></a></li>
								<li class="p-1"><a href="/CoStudy/myPage/userUpdateFormAction.do">회원 정보 수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i></a></li>
								<li class="p-1"><a href="/CoStudy/myPage/applyQuitUserCheckFormAction.do">회원 탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i></a></li>
							</ul>
						</nav>
				</div>
				<div class="col-lg-8" id="contents">
					<div class="text-end">
						<button class="btn btn-primary p-1"><a href="studyDiaryFormAction.do" class="text-white">Study Diary 작성</a></button>
					</div>
					
					<h3>Study Diary 목록</h3>
					<hr style="width:900px;" class="text-primary">
					<div class="row">
                        <table class="table table-striped table-hover">
                            <thead>
								<tr>
									<th id="no">글번호</th>
									<th id="title">제목/키워드</th>
									<th id="fileName">파일</th>
									<th id="regDate">작성날짜</th>

								</tr>
							</thead>	
                            <c:forEach var="diary" items="${studyNoteList}">
                                <tr>
                                    <td>${diary.studyNote_no}</td>
                                    <td>${diary.studyNote_keyword}</td>
                                    <td>${diary.studyNote_file}</td>
                                    <td>${diary.studyNote_date}</td>
    
                                </tr>
                            </c:forEach>
                        </table>
					</div>
					
					
				</div>
			</div>
		</section>		
		<jsp:include page="../common/footer.jsp"></jsp:include> 
</body>
</html>