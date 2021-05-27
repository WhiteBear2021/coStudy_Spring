<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>회원정보수정</title>
<jsp:include page="../common/head.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet" href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <section class="container col-lg-12">
        <div class="row">
            <div class="col-lg-3 bg-secondary m-3 text-center">
                    <nav id="side_left" class="my-auto">
                        <ul class="list-unstyled" >
								<li class="p-1"><a href="/myPage/studyDiaryList">공부일기</span>&nbsp;&nbsp;<i class="bi bi-journal-check fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/scheduleList">일정관리&nbsp;&nbsp; <i class="bi bi-calendar-month fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/toDo">todo&nbsp;&nbsp;<i class="bi bi-chat-square-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/joinGroupList">참가 그룹 목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/categoryUpdate">관심 분야 수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/userUpdate">회원 정보 수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원 탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i></a></li>
                        </ul>
                    </nav>
            </div>
            <div class="col-8 " id="contents">
		        <h3>회원정보 수정</h3>
                <hr style="width:800px;" class="text-primary">
		        <div class="row mb-5">
                    <div class="col-lg-8 m-auto bg-white border border-primary p-3">
					<form action="userUpdate" method="post" enctype="multipart/form-data">
					        <input type="hidden" name="user_no" value="${user.user_no}">
					        <input type="hidden" name="user_id" value="${user.user_id}">
					        <input type="hidden" name="category_no" value="${user.category_no}">
					        <input type="hidden" name="user_birth" value="${user.user_birth}">
					        <input type="hidden" name="user_register_date" value="${user.user_register_date}">
					        <input type="hidden" name="user_photo" value="${sessionScope.user.user_photo}">
					        <input type="hidden" name="user_thumbImg" value="${sessionScope.user.user_thumbImg}">
					        <label>
					        	<p><b>아이디 :</b> ${sessionScope.user.user_id}
					        </label>
					    	<label>
					        	<p><b>닉네임 :</b> <input type="text" name="user_nickName" value="${sessionScope.user.user_nickName}"/></p>
					        </label>
					        
					        <div class="inputArea">
								<label for="img"><b>프로필 사진 : </b></label> 
								<input type="file" id="img"	name="file">
								<img id="profileImg" src="${sessionScope.user.user_thumbImg}" style="width:150px;" />
								
							</div>
					        <label>
					        	<p><b>비밀번호 :</b> <input type="password" name="user_pw" value="${sessionScope.user.user_pw}"></p>
					        </label>
					        <label>
					        	<p><b>생년월일 :</b> 
					     		<fmt:parseDate var="dt" value="${sessionScope.user.user_birth}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
								<fmt:formatDate value="${dt}" pattern="yyyy-MM-dd"/>
					        </label>
					        <label>
					        	 <p> <b>성 :</b> <input type="text" name="user_lastName" value="${sessionScope.user.user_lastName}"> <b>이름 :</b> <input type="text" name="user_firstName" value="${sessionScope.user.user_firstName}"></p>
					        </label>
					        <label>
					        	<p> <b>휴대전화 번호 :</b> <input type="text" name="user_phoneNo" value="${sessionScope.user.user_phoneNo}"></p>
					        </label>
					        <label>
					        	<p><b>우편번호 :</b> <input type="text" name="user_post" value="${sessionScope.user.user_post }"></p>
					        </label>
					        <label>
					        	<p> <b>주소 :</b> <input type="text" name="user_address1" value="${sessionScope.user.user_address1 }"></p>
					        </label>
					        <label>
					        	<p>  <b>상세주소 :</b> <input type="text" name="user_address2" value="${sessionScope.user.user_address2}"></p>
					        </label>
					        <label>
					        	<p>  <b>이메일주소 :</b> <input type="text" name="user_email" value="${sessionScope.user.user_email }"></p>
					        </label>
					        <label>								
					     		<fmt:parseDate var="dt" value="${sessionScope.user.user_register_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
								
					        	<p>  <b>가입일 :</b> <input type="text" name="user_register_date" value=<fmt:formatDate value="${dt}" pattern="yyyy-MM-dd"/> readonly="readonly"></p>
					        </label>
					         <label>
					        	<p>  <b>관심분야 :</b> 		
					        			<select name="category_no">
											<option value="${sessionScope.user.category_no}" selected="selected"></option>
											<c:forEach var="cl" items="${categoryList}">
												<option value="${cl.category_no}">${cl.category_name}</option>
											</c:forEach>
										</select>
					        </label>
					        <br><br>
                            <div class="text-center">
							<button type="submit" class="btn btn-primary p-1" style="margin-left:200px;">수정</button>
							<button type="reset" class="btn btn-primary p-1" style="margin-left:20px;">취소</button>
                            </div>
				        </form>
                        </div>
			        </div>
		        </div>
	        </div>
	    </section>
	    <script>
						$("#img").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$("#profileImg").attr("src",
													data.target.result).width(
													200);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
		</script>
	    <jsp:include page="../common/footer.jsp"></jsp:include> 
</body>
</html>