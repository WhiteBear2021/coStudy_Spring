<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">

<title>Insert title here</title>
</head>
<body>
                 <section id="timer">
                     <span id="time_output">00:00:00</span><br>
                     <div class="content_center">
                        <input type="button" id="timer_bnt_save" value="저장"> <input
                           type="button" id="timer_bnt_start" value="시작">
                     </div>
                  </section>
                  
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                  <script type="module" src="/resources/js/timer.js"></script>

</body>
</html>