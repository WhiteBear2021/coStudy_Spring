<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<jsp:include page="../managerModule/head.jsp"></jsp:include><hr>
<body class="">

	<jsp:include page="../managerModule/header.jsp"></jsp:include><hr>

	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">관리자 관리</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header">
							<h5>관리자 리스트</h5>
						</div>
						<div class="card-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="col-xl-12">
										<div class="card">

											<div class="card-body table-border-style">
												<div class="table-responsive">
													<table class="table" style="text-align: center;">
														<thead>
															<tr>
																<td>관리자번호</td>
																<td>아이디</td>
																<td>비밀번호</td>
																<td></td>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="manager" items="${list}">
																<tr>
																	<td><c:out value="${manager.manager_no }" /></td>
																	<td><c:out value="${manager.manager_id }" /></td>
																	<td><c:out value="${manager.manager_pw }" /></td>
																	<td><button onclick="location.href='delete?manager_no=<c:out value="${manager.manager_no }"/>'"/>삭제</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>

										</div>
										<div class="form-row float-right">

											<form action="add" method="post">

												<input type="text" placeholder="아이디" name="manager_id"
													id="manager_id"> <input type="text"
													placeholder="비밀번호" name="manager_pw" id="manager_pw">
												<input type="submit" value="추가">
											</form>

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		function checkModal(result){
			if(result ===''){
				return;
			}
			if(parseInt(result)>0){
				$(".modal-body").html(parseInt(result)+"번째 관리자가 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
	});
</script>
<jsp:include page="../managerModule/footer.jsp"></jsp:include><hr>
</html>