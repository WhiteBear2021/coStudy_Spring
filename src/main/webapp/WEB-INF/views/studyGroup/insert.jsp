<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
									이름</span> <input type="text" name="studygroup_name" class="form-control"  required="required"> <br>
								<span class="form-label">그룹 소개</span> <input type="text"
									name="studygroup_info" class="form-control"  required="required"> <br> <span
									class="form-label">그룹 지역</span> <select
									name="studygroup_location" class="form-control" required="required">
									               <option disabled="disabled" selected="selected">선택하세요.</option>
										               <option value="서울특별시">서울특별시</option>
										               <option value="부산광역시">부산광역시</option>
										               <option value="대구광역시">대구광역시</option>
										               <option value="인천광역시">인천광역시</option>
										               <option value="광주광역시">광주광역시</option>
										               <option value="대전광역시">대전광역시</option>
										               <option value="울산광역시">울산광역시</option>
										               <option value="세종특별자치시">세종특별자치시</option>
										               <option value="경기도">경기도</option>
										               <option value="강원도">강원도</option>
										               <option value="충청북도">충청북도</option>
										               <option value="충청남도">충청남도</option>
										               <option value="전라북도">전라북도</option>
										               <option value="전라남도">전라남도</option>
										               <option value="경상북도">경상북도</option>
										               <option value="경상남도">경상남도</option>
										               <option value="제주특별자치도">제주특별자치도</option>
								</select> <br><br> 
								<span class="form-label">최대 인원</span> <input
									type="text" name="max_user_number" class="form-control" required="required"> <br> <input
									type="radio" name="isface" value="Y" ><span class="form-label">대면    </span><input
									type="radio" name="isface" value="N" ><span class="form-label">비대면</span><br><br><span class="form-label">카테고리</span>
								 <select class="form-control" name="category_no" required="required">
											<option disabled="disabled" selected="selected">선택하세요.</option>
											<c:forEach var="cl" items="${categoryList}">
												<option value="${cl.category_no}">${cl.category_name}</option>
											</c:forEach>
								</select> <br>

								<div class="inputArea">
									<label for="img"><span class="form-label">이미지</span></label> <input type="file" id="img"
										name="file" class="form-control form-btn"  required="required"/>
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