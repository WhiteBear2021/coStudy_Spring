<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">글 페이지</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>글번호</label> <input class="form-control" name='bno'
            value='<c:out value="${diary.studyNote_no}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${diary.studyNote_title}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Content</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${diary.studyNote_content}" /></textarea>
        </div>

        <div class="form-group">
          <label>File</label> <input class="form-control" name='writer'
            value='<c:out value="${diary.studyNote_file}"/>' readonly="readonly">
        </div>


<button class="btn btn-default"><a href="studyDiaryUpdate?studyNote_no=${diary.studyNote_no}">Modify</a></button>
<button id="listBtn"class="btn btn-info"><a href="studyDiaryList">List</a></button>
</body>
</html>