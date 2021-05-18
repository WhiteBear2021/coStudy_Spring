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
<style>
		 
		#mail_check_input_box_false{
		    background-color:#ebebe4;
		}
		 
		#mail_check_input_box_true{
		    background-color:white;
		}
 
 
		.correct{
		    color : green;
		}
		.incorrect{
		    color : red;
		}
</style>
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
								<button id="searchIdBtn" type="button" class="btn btn-primary btn-block">확인</button>			
							</div>
						</div>
						<div id="searchPw">
							<div class="form-group">
								<label for="user_id" class="text-info">회원아이디:</label><input type="text" name="user_id" id="user_id" class="form-control">
							</div>
							<div class="form-group">
								<label for="user_email" class="text-info">이메일:</label><input type="text" name="user_email" id="user_email" class="form-control">
										
								<div class="mail_check_input_box" id="mail_check_input_box_false">
									인증번호 : <input class="mail_check_input" disabled="disabled"><button id="checkBtn" type="button" class="btn btn-primary">인증번호 전송</button>
								</div>
								 <span id="mail_check_input_box_warn"></span>
							</div>
							
							<div class="form-group">
								<button id="searchPwBtn" type="button" class="btn btn-primary btn-block" disabled="disabled">확인</button>
							</div>
						</div>
						
				
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var code = "";  
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
			
			$("#searchIdBtn").on("click",function(){
					console.log($("#user_firstName").val());
					console.log($("#user_lastName").val());
					console.log($("#user_phoneNo").val());
					let searchIdinfo={
							 user_firstName:$("#user_firstName").val(),
							 user_lastName:$("#user_lastName").val(),
							 user_phoneNo:$("#user_phoneNo").val(),
						 };
					console.log(searchIdinfo);
					 $.ajax({
						 url:'searchId',
						 type:'post',
						 contentType:"application/json",
						 data:JSON.stringify(searchIdinfo),
						 dataType:"text",
						 success:function(data,status,xhr){
							 console.log(data);
							 alert(data);							 	
/* 							 	$("#id").attr("checked",false);
							 	$("#pw").attr("checked","checked");
								$("#searchPw").css("display","block");
								$("#searchId").css("display","none");
								$("#searchWhat").text("비밀번호 찾기"); */
							 location.href="login";
						 },
						 error:function(xhr,status,error){}
					  });// searchId ajax End				
			}); //#searchIdBtn click 이벤트
			
			$("#searchPwBtn").on("click",function(){
					let searchPwinfo={
							user_id:$("#user_id").val(),
							user_email:$("#user_email").val(),
					}
					console.log(searchPwinfo);
					 $.ajax({
						 url:'searchPw',
						 type:'post',
						 contentType:"application/json",
						 data:JSON.stringify(searchPwinfo),
						 dataType:"text",
						 success:function(data,status,xhr){
							 console.log(data);
							 alert(data);
							 location.href="login";
							 
						 },
						 error:function(xhr,status,error){
							 alert("id와 email 정보를 찾을 수 없습니다.");
						 }
					  });// searchPw ajax End
			}); //#searchPwBtn click 이벤트
			
			/* 인증번호 이메일 전송 */
			$("#checkBtn").click(function(){
				var user_id=$("#user_id").val();
			    var email=$("#user_email").val();
			    console.log(email);
			    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
			    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
		    $.ajax({			        
			        type:"GET",
			        url:"mailCheck?email="+email+"&user_id="+user_id,
			        success:function(data){
			        	console.log("인증번호:"+data);
			            cehckBox.attr("disabled",false);
			            boxWrap.attr("id", "mail_check_input_box_true");
			            code = data;
			            $("#checkBtn").text("인증번호 다시 전송");
			        },
			        error:function(error){
			        	alert("id와 email 정보를 찾을 수 없습니다.");
			        }
			                
			    }); //ajax 끝
			});//click event 끝
			
			/* 인증번호 비교 */
			$(".mail_check_input").blur(function(){
				 var inputCode = $(".mail_check_input").val();        // 입력코드    
				 var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
				 if(inputCode == code){                            // 일치할 경우
				        checkResult.html("인증번호가 일치합니다.");
				        checkResult.attr("class", "correct");
				        $("#searchPwBtn").removeAttr("disabled");
				        console.log($("#searchPwBtn").text());
				    } else {                                            // 일치하지 않을 경우
				        checkResult.html("인증번호를 다시 확인해주세요.");
				        checkResult.attr("class", "incorrect");
				    }    
			});// 인증번호 비교 blur event End
			
		});
	</script>
</body>

</html>