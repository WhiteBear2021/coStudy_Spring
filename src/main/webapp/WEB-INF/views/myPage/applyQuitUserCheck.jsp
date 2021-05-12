<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>

			<div id="login">
				<h3 class="text-center text-white pt-5"></h3>
				<div class="container">
					<div id="login-row"
						class="row justify-content-center align-items-center">
						<div id="login-column" class="col-md-6">
							<div id="login-box" class="col-md-12">
								<form id="login-form" class="form" action="applyQuitUserCheck"
									method="post">
									<h3 class="text-center text-info">COSTUDY</h3>
									<br> <br>
									<div class="form-group">
										<label for="username" class="text-info">아이디:</label><br> <input
											type="text" name="userId" id="userId" class="form-control"
											value="${sessionScope.user.user_id}" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="password" class="text-info">비밀번호:</label><br> <input
											type="text" name="userPw" id="userPw" class="form-control">
									</div>
									<div class="form-group">
										<input type="submit" name="submit" class="btn btn-info btn-md"
											value="비밀번호 Check">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>

</html>