<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<h5 class="m-b-10">공지사항 등록</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<form action="noticeUpdateAction.do" method="post">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label style="font-weight: bold;">제목</label> <input
											type="text" class="form-control" name="notice_title"
											value="${notice.notice_title }">
									</div>
								</div>
								<div class="form-group">
									<label style="font-weight: bold;">내용</label> <input type="text"
										class="form-control" name="notice_content"
										value="${notice.notice_content }">
								</div>
								<input type="hidden" class="form-control" name="notice_no"
									value="${notice.notice_no }">


								<div style="text-align: center;">
									<button type="submit" class="button type1">수정완료</button>

								</div>
							</form>

						</div>
					</div>



				</div>
			</div>
		</div>

	</div>


</body>
<jsp:include page="../managerModule/footer.jsp"></jsp:include><hr>
</html>