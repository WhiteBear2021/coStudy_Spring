<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/chatting/chattingForm.css">
</head>
<body>
   <div>
        <input type="text" id="sender" value="${sessionScope.member.m_id }" style="display: none;">
    </div>

        <div id="container">
	        <main> 
	            <ul id="chat">
	
	            </ul>
	            <footer>
	                <form>
	                    <input type="textarea" id="msg" placeholder="Message">
	                    <button type="submit">SEND</button>
	                </form>
	            </footer>
	        </main>
	    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                      
    <!-- websocket javascript -->
    <script type="text/javascript">
    
    const sock = new SockJS('http://localhost:8081/echo');
    
    sock.onopen = function() {
        console.log('open');
        let data = "연결";
        $("#chat").append('<li><strong class="login">' + data + '</strong><li>');
        $("#chat").scrollTop($("#chat")[0].scrollHeight);
    };
    
    sock.onmessage = function(e) {
        console.log('message', e.data);
        let data = e.data;
       
        let html = '<li class="me"><div class="entete"><h3>10:12AM, Today</h3><h2>'+data+'</h2></div><div class="triangle"></div><div class="message">'+ data +'</div></li>';
        $("#chat").append(html);
        $("#chat").scrollTop($("#chat")[0].scrollHeight);
        //sock.close();
    };

    sock.onclose = function() {
        console.log('close');
        $("#chat").append("연결 끊김");
    };
    
    
    $(function(){
    	  $("form").submit(function (e) {
    		  e.preventDefault();
    		  sock.send($("#msg").val());
    		  $("#msg").val("");
    	  });
    });
    
    
  </script>

</body>
</html>