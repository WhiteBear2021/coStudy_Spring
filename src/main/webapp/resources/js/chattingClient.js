const sock = new SockJS('http://localhost:8081/echo');

sock.onopen = function() {
    $("#chat").append('<li><strong class="login">'+$("#myName").val()+'님이 입장했습니다.</strong><li>');
    $("#chat").scrollTop($("#chat")[0].scrollHeight);
};

sock.onmessage = function(e) {
    let data = e.data;
   
    let html = '<li class="me"><div class="entete"><h3>10:12AM, Today</h3><h2>'+$("#myName").val()+'</h2></div><div class="triangle"></div><div class="message">'+ data +'</div></li>';
    $("#chat").append(html);
    $("#chat").scrollTop($("#chat")[0].scrollHeight);
    //sock.close();
};

sock.onclose = function() {
    $("#chat").append('<li><strong class="login">'+$("#myName").val()+'님이 퇴장했습니다.</strong><li>');
};


$("form").submit(function (e) {
	  e.preventDefault();
	  sock.send($("#msg").val());
	  $("#msg").val("");
});

$(function(){
	  
	  
});
    