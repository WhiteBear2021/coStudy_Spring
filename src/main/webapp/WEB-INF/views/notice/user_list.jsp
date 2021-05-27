<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../common/head.jsp"></jsp:include>


<jsp:include page="../common/header.jsp"></jsp:include>
<head>
<style type="text/css">
@charset "UTF-8";

[data-toggle=collapse] i:before {
	content: "";
}

[data-toggle=collapse].collapsed i:before {
	content: "";
}

#accordion .card-header {
	margin-bottom: 8px;
}

#accordion .accordion-title {
	position: relative;
	display: block;
	padding: 8px 0 8px 50px;
	background: #213744;
	border-radius: 8px;
	overflow: hidden;
	text-decoration: none;
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	width: 100%;
	text-align: left;
	transition: all 0.4s ease-in-out;
}

#accordion .accordion-title i {
	position: absolute;
	width: 40px;
	height: 100%;
	left: 0;
	top: 0;
	color: #fff;
	background: radial-gradient(rgba(33, 55, 68, 0.8), #213744);
	text-align: center;
	border-right: 1px solid transparent;
}

#accordion .accordion-title:hover {
	padding-left: 60px;
	background: #213744;
	color: #fff;
}

#accordion .accordion-title:hover i {
	border-right: 1px solid #fff;
}

#accordion .accordion-body {
	padding: 40px 55px;
}

#accordion .accordion-body ul {
	list-style: none;
	margin-left: 0;
	padding-left: 0;
}

#accordion .accordion-body li {
	padding-left: 1.2rem;
	text-indent: -1.2rem;
}

#accordion .accordion-body li:before {
	content: "";
	padding-right: 5px;
	font-family: "Flaticon";
	font-size: 16px;
	font-style: normal;
	color: #213744;
}
</style>
</head>
<body>
	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="text-align: center;">공지사항번호</th>
					<th scope="col" style="text-align: center;">제목</th>
					<th scope="col" style="text-align: center;">날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="notice" items="${nlist }">
				<tr>
					<th scope="row" style="text-align: center;">${notice.notice_no }</th>
					<td style="text-align: center;">${notice.notice_title }</td>
					<td style="text-align: center;">${notice.notice_date }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>


	</div>

<Br><Br><Br>
	<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<script src="/resources/js/jquery.js"></script>

<jsp:include page="../common/scri.jsp"></jsp:include>


</html>