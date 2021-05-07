<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/signUp/addressapi.js"></script>
<!-- Icons font CSS-->
<link
	href="../vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="../vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">

<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="../vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="../vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="../css/signUp/main.css" rel="stylesheet" media="all">

</head>
<body>
	<div class="page-wrapper p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">회원가입</h2>
				</div>
				<div class="card-body">
					<form action="signUpAction.do" method="post">
						<div class="form-row m-b-55">
							<div class="name">이름</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text"
												name="user_lastName"> <label class="label--desc">성</label>
										</div>
									</div>
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name=user_firstName>
											<label class="label--desc">이름</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">아이디</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_id">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">비밀번호</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_pw">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">핸드폰번호</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_phoneNo">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">이메일</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="email" name="user_email">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">주소</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" placeholder="우편번호"
												name="addr1" id="addr1">
										</div>
									</div>
									<div class="col-2">
										<input type="button" class="btn btn--radius-2 btn--blue"
											onclick="execPostCode();" value="우편번호 찾기"><br>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name"></div>
							<div class="value">
								<div class="input-group"> 
									<input class="input--style-5" type="text" name="addr2" id="addr2"
										placeholder="주소">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name"></div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5"  type="text" name="addr3" id="addr3"
										placeholder="상세주소">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">생년월일</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="date" name="user_birth">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">관심분야</div>
							<div class="value">
								<div class="input-group">
									<div class="rs-select2 js-select-simple select--no-search">
										<select name="category_no">
											<option disabled="disabled" selected="selected">선택하세요.</option>
											<option value="1">IT</option>
											<option value="2">외국어</option>
											<option value="3">취업</option>
											<option value="4">자격증</option>
											<option value="5">전공</option>
											<option value="6">수험생</option>
										</select>
										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<button class="btn btn--radius-2 btn--red" type="submit">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="../vendor/jquery/jquery.min.js"></script>

	<!-- Vendor JS-->
	<script src="../vendor/select2/select2.min.js"></script>
	<script src="../vendor/datepicker/moment.min.js"></script>
	<script src="../vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="../js/signUp/global.js"></script>

</body>
</html>