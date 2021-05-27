<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="../resources/css/login.css" rel="stylesheet" type="text/css">
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
						<form id="login-form" class="form" action="login"
							method="post">
							<a href="/main"><h3 class="text-center text-info">COSTUDY</h3></a>
							<br> <br>
							<div class="form-group">
								<input type='radio' name='member' value='user' checked />회원 <input
									type='radio' name='member' value='manager' />관리자
							</div>
							<div class="form-group">
								<label for="username" class="text-info">아이디:</label><br> <input
									type="text" name="userId" id="userId" class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">비밀번호:</label><br> <input
									type="password" name="userPw" id="userPw" class="form-control">
							</div>
							<div class="form-group">
								<label for="remember-me" class="text-info"><span>자동로그인</span> <span><input
										id="remember-me" name="remember-me" type="checkbox"></span></label><br>
								<input type="submit" name="submit" class="btn btn-info btn-md"
									value="로그인">
							</div>
							<div id="register-link" class="text-right">
								<br>
								<a href="signUp" class="text-info">회원가입</a>
								<br>
								<a href="searchUser?key=id" class="text-info">아이디 찾기</a>&nbsp;|&nbsp;
								<a href="searchUser?key=pw" class="text-info">비밀번호 찾기</a>
							</div>
					
								
					
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}');
	</script>
</c:if>
</body>

</html>