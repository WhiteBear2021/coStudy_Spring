<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/login.css" rel="stylesheet" type="text/css">
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
							<h3 class="text-center text-info" id="searchWhat">${key}</h3>
							<br> <br>
							<div class="form-group">
								<div class="row">
									<div class="col-md-5">
										<input type='radio' class="search_total" name="search_total" id="id" value='id'/>아이디 찾기 
									</div>
									<div class="col-md-5">	
										<input type='radio' class="search_total" name="search_total" id="pw" value='pw'/>비밀번호 찾기
									</div>
								</div>
							</div>
						<div id="searchId">
							<div class="form-group">
							<div class="row"> 
								<div class="col-md-5">
									<label for="user_lastName" class="text-info">성:</label><input type="text" name="user_lastName" id="user_lastName" class="form-control">
								</div>
								<div class="col-md-5">
									<label for="user_firstName" class="text-info">이름:</label><input type="text" name="user_firstName" id="user_firstName" class="form-control">
								</div>
							</div>
							</div>
							<div class="form-group" style="diplay:none;">
								<label class="text-info" for="user_phoneNo">휴대폰번호 : </label><br>
								<input type="text" class="form-control" id="user_phoneNo" name="user_phoneNo" placeholder="ex) 01077779999">
							</div>
							<div class="form-group">
								<button id="searchBtn" type="button" class="btn btn-primary btn-block">확인</button>			
							</div>
						</div>
						<div id="searchPw">
							<div class="form-group">
								<label for="user_id" class="text-info">회원아이디:</label><input type="text" name="user_id" id="user_id" class="form-control">
							</div>
							<div class="form-group">
								<label for="user_email" class="text-info">이메일:</label><input type="text" name="user_email" id="user_email" class="form-control">
							</div>
							<div class="form-group">
								<button id="searchBtn" type="button" class="btn btn-primary btn-block">확인</button>
							</div>
						</div>
						
				
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			let searchWhat=$("#searchWhat").text();
			console.log(searchWhat);
			if(searchWhat=="아이디 찾기"){
				$("#id").attr("checked","checked");
				$("#searchId").css("display","block");
				$("#searchPw").css("display","none");
			}else if(searchWhat=="비밀번호 찾기"){
				$("#pw").attr("checked","checked");
				$("#searchPw").css("display","block");
				$("#searchId").css("display","none");
			}
			
			$(".search_total").on("change",function(){
				let key=$(this).val()
				console.log(key);
				if(key=="id"){
					$("#searchId").css("display","block");
					$("#searchPw").css("display","none");
					$("#searchWhat").text("아이디 찾기");
				}else if(key=="pw"){
					$("#searchPw").css("display","block");
					$("#searchId").css("display","none");
					$("#searchWhat").text("비밀번호 찾기");
				}
			});
			
			$("#searchBtn").on("click",function(){
				console.log($("#user_firstName").val());
				console.log($("#user_lastName").val());
				console.log($("#user_phoneNo").val());
				 $.ajax({
					 url:'searchId',
					 type:'post',
					 data:{
						 user_firstName:$("#user_firstName").val(),
						 user_lastName:$("#user_lastName").val(),
						 user_phoneNo:$("#user_phoneNo").val(),
					 },
					 dataType:"text",
					 success:function(data,status,xhr){
						 console.log(data);
						 alert(data);
					 },
					 error:function(xhr,status,error){}
				  });
			});
		});
	</script>
</body>

</html>