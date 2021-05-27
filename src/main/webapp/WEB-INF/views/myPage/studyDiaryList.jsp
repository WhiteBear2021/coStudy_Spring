<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<jsp:include page="../common/head.jsp"></jsp:include>
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet" href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
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
				<div class="col-lg-8" id="contents">
					
					
					<h3>Study Diary 목록</h3>
					<div class="text-end" style="margin-bottom:10px;">
						<button class="btn btn-primary p-1 "><a href="studyDiary" class="text-white">Study Diary 작성</a></button>
					</div>
					<div class="row">
                        <table class="table table-striped table-hover">
                            <thead>
								<tr>
									<th id="no">글번호</th>
									<th id="title">제목/키워드</th>
									<th id="fileName">파일</th>
									<th id="regDate">최종수정일</th>
									<th></th>

								</tr>
							</thead>	
                            <c:forEach var="diary" items="${studyNoteList}">
                                <tr>
                                    <td><a href="studyDiaryDetail?studyNote_no=${diary.studyNote_no}">${diary.studyNote_no}</a></td>
                                    <td><a href="studyDiaryDetail?studyNote_no=${diary.studyNote_no}">[${diary.studyNote_keyword}]${diary.studyNote_title}</td>
                                    <td class="filedown"><span data-file="${diary.studyNote_file}">${diary.studyNote_fileName}</td>
                                    <td>${diary.studyNote_date}</td>
    								<td><a href="studyDiaryDelete?studyNote_no=${diary.studyNote_no}"><button>Delete</button></a></td>
                                </tr>
                            </c:forEach>
                        </table>
					</div>
					
					
				</div>
				<!-- 페이지 번호 표시 시작  -->
				<div class='pull-right'>
					<ul class="pagination">

									<%--             <c:if test="${pageMaker.prev}">
			              <li class="paginate_button previous"><a href="#">Previous</a>
			              </li>
			            </c:if>
			
			            <c:forEach var="num" begin="${pageMaker.startPage}"
			              end="${pageMaker.endPage}">
			              <li class="paginate_button"><a href="#">${num}</a></li>
			            </c:forEach>
			
			            <c:if test="${pageMaker.next}">
			              <li class="paginate_button next"><a href="#">Next</a></li>
			            </c:if> --%>

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ?"active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
			</div>
		</section>		
		<jsp:include page="../common/footer.jsp"></jsp:include> 
		<script>
			$(function(){
				$(".filedown").on("click","span",function(){
					var fileName=$(this).data("file");
					console.log("파일값:"+fileName);
					var fileCallPath=encodeURIComponent(fileName);
					console.log("Encoding한 파일이름:"+fileCallPath);
					
					$.ajax({
						url:"/files/download?fileName="+fileCallPath,
						type:"get",
						success:function(data){
							console.log(data);
							window.location ="/files/download?fileName="+fileCallPath;
						},
						error:function(error){
							console.log();
						}
						
					});//ajax 끝
				});
			});
		</script>
</body>
</html>