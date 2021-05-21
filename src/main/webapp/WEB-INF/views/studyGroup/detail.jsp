<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/head.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<body>


	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<div style="text-align: center;">
									<h3 class="m-b-10">상세 정보</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<form>
								<div class="form-row">
									<div class="form-group col-md-1">
										<label style="font-weight: bold;">그룹 번호</label> 
										<input type="text" disabled class="form-control" name="studygroup_no" value="${studygroup.studygroup_no }">
									</div>
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">그룹 이름</label> 
									<input type="text" disabled class="form-control" name="studygroup_name" value="${studygroup.studygroup_name }">
								</div>
								<div class="form-group col-md-2">
									<label style="font-weight: bold;">그룹 방장</label> 
									<input type="text" disabled class="form-control" name="user_no" value="${studygroup.user_no }">
								</div>
								<div class="form-group col-md-9">
									<label style="font-weight: bold;">그룹 정보</label> 
									<input type="text" disabled class="form-control" name="studygroup_info" value="${studygroup.studygroup_info }">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">그룹 관심 카테고리</label> 
									<input type="text" disabled class="form-control" name="category_no" value="${studygroup.category_no }">
								</div>
								<div class="form-group col-md-2">
									<label style="font-weight: bold;">그룹 위치</label> 
									<input type="text" disabled class="form-control" name="studygroup_location" value="${studygroup.studygroup_location }">
								</div>
								<div class="form-group col-md-1">
									<label style="font-weight: bold;">그룹 대면 여부</label> 
									<input type="text" disabled class="form-control" name="isface" value="${studygroup.isface }">
								</div>
								<div class="form-group col-md-1">
									<label style="font-weight: bold;">그룹 최대 인원</label> 
									<input type="text" disabled class="form-control" name="max_user_number" value="${studygroup.max_user_number }">
								</div>
								<div class="form-group col-md-1">
									<label style="font-weight: bold;">그룹 현재 인원</label> 
									<input type="text" disabled class="form-control" name="current_user_number" value="${studygroup.current_user_number }">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">그룹 만든 날짜</label> 
									<input type="text" disabled class="form-control" name="made_date" value="${studygroup.made_date }">
								</div>
								<div style="text-align: center;">
									<a href=""><button type="button" class="button type1">방장과 1:1 채팅하기</button></a>
								</div>
								<br>
								<div style="text-align: center;">
									<a href=""><button type="button" class="button type1">신청하기</button></a>
									<a href="/studyGroup/list"><button type="button" class="button type1">취소</button></a>
								</div> 
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
</html>