const sock = new SockJS('http://localhost:8081/echo');
const myName = $("#myName").val();
const roomNo = $("#roomNo").val();

sock.onopen = function() {
	sock.send(JSON.stringify({"roomNo": roomNo, "userNo": myName, type:'ENTER'}));
    $("#chat").append('<li><strong class="login">'+myName+'님이 입장했습니다</strong><li>');
    $("#chat").scrollTop($("#chat")[0].scrollHeight);
};

sock.onmessage = function(e) {
    let data = JSON.parse(e.data);
    console.log(data);
    
    let html;
    if(data.user_no == myName){
    	html = '<li class="me"><div class="entete"><h3>시간??</h3><h2>'+data.user_no+'</h2></div><div class="triangle"></div><div class="message">'+ data.group_msg_log +'</div></li>';
    } else{
    	html = '<li class="you"><div class="entete"><h2>'+data.user_no+'</h2><h3>시간??</h3></div><div class="triangle"></div><div class="message">'+ data.group_msg_log +'</div></li>';
    }
    
    $("#chat").append(html);
    $("#chat").scrollTop($("#chat")[0].scrollHeight);
   
};

sock.onclose = function() {
    $("#chat").append('<li><strong class="login">'+myName+'님이 퇴장했습니다.</strong><li>');
    sock.close();
};


$(function(){
	$("form").submit(function (e) {
		  e.preventDefault();

		  //sock.send(JSON.stringify({chatRoomId :$("#roomNo").val(), type:'CHAT', writer:$("#myName").val(), message: $("#msg").val()}));
		  
		  sock.send('/app/user', {}, JSON.stringify({'roomNo' : roomNo, type : 'CHAT', userNo : myName, message : $("#msg").val()}));
		  $("#msg").val("");
	});
	  
	function connect(){
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame){
			console.log('connected: '+frame);
			stompClient.subscribe(`/topic/${roomNo}`, function(response){
				console.log(response);
				console.log(JSON.parse(response.body));
			});
		});
	}
});
    