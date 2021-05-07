<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp"></jsp:include><hr>
<body>

   	<div class="container">	
	    <div class="form-group studygroupUpdate">
	        <h3>StudyGroup 만들기</h3>
	        <form action="/CoStudy/studyGroup/makeGroupAction.do">
	        	<label>
	        	그룹 이름 : 
	        	<input type="text" name="studygroup_name">
	        	</label><br>
	        	<label>
	        	 그룹 소개 : 
	        	<input type="text" name="studygroup_info">
	        	</label><br>
	        	<label>
	        	그룹 지역 :
	        	<select name="studygroup_location">
	        		<option value="서울">서울</option>
	        		<option value="부산">부산</option>
	        		<option value="대구">대구</option>
	        	</select>
	        	</label><br>
	        	<label>
	        	최대인원 :	
	        	<input type="text" name="max_user_number">
	        	</label><br>
	        	<label>
	        	대면여부 :  
	        	<input type="radio" name="isface" value="Y">대면
	        	<input type="radio" name="isface" value="N">비대면
	        	</label><br>
	        	<label>
	        	카테고리 : 
	        	<select name="studygroup_category">
	        		<option value="1">IT</option>
	        		<option value="2">외국어</option>
	        		<option value="3">취업</option>
	        		<option value="4">자격증</option>
	        		<option value="5">전공</option>
	        		<option value="6">수험생</option>
	        	</select>
	        	</label><br>
	        	<input type="submit" value="그룹만들기">
	        </form>
	        <br>
	        
	        <br>
	       
	        <br>
	        
	        <br>
	       
	        <br>
	        
	        <br>
	        
	        <br>
	        
	        <br>
	        
	        <br>
	       
	        <br>
	    </div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</html>