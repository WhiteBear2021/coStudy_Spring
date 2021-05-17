<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>글쓰기</h3>
<hr>

<form id="frm">
    제목 : <input type="text" name="name" value="s"><br>
	내용: <input type="text" name="age" value="3"><br>
    <button id="btn2">serialize</button>
</form>
    <div id="result">
    
    </div>


</body>
<script src="/resources/js/jquery.js"></script>
<script type="text/javascript">


(function() {
	 $('#btn2').on('click', function(){
	        console.log("이벤트실행");
	        
	        
		 $.ajax({
	            url: "user_insert",
	            type: "POST",
	            data: $("#frm").serialize(),
	            
	            success: function(data){
	                $('#result').text(data);
	                console.log("성공");
	                
	            },
	            error: function(){
	                alert("serialize err");
	            }
	        });
	    });

	
</script>
</html>








