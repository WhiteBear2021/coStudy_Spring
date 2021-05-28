<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css" />

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/resources/css/style2.css" />
<body>
	<div class="section" id="make" style="margin-top:50px; margin-bottom:70px;">
		<div class="section-center">
			<div class="container" >
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-7 col-md-push-5">
						<div class="form-group studygroupUpdate booking-form">
							<h3 class="form-label">스터디그룹 만들기</h3><br><br>
							<form action="/studyGroup/insert" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <span class="form-label">그룹
									이름</span> <input type="text" name="studygroup_name" class="form-control"> <br>
								<span class="form-label">그룹 소개</span> <input type="text"
									name="studygroup_info" class="form-control"> <br> <span
									class="form-label">그룹 지역</span> <select
									name="studygroup_location" class="form-control">
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									<option value="대구">대구</option>
								</select> <br><br> 
								<span class="form-label">최대 인원</span> <input
									type="text" name="max_user_number" class="form-control"> <br> <input
									type="radio" name="isface" value="Y" ><span class="form-label">대면    </span><input
									type="radio" name="isface" value="N" ><span class="form-label">비대면</span><br><br><span class="form-label">카테고리</span>
								 <select class="form-control" name="category_no">
									<option value="1">IT</option>
									<option value="2">외국어</option>
									<option value="3">취업</option>
									<option value="4">자격증</option>
									<option value="5">전공</option>
									<option value="6">수험생</option>
								</select> <br>

								<div class="inputArea">
									<label for="img"><span class="form-label">이미지</span></label> <input type="file" id="img"
										name="file" class="form-control form-btn" />
									<div class="select_img">
										<img src="" />
									</div>

								</div>

								<input type="hidden" name="user_no"
									value="${sessionScope.user.user_no}"> <input
									type="submit" value="그룹만들기" class="submit-btn">
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<jsp:include page="../common/scri.jsp"></jsp:include><hr>
<script>
	$("#img").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>
</html>