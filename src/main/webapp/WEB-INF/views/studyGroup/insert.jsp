<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<body>

   <div class="container">
      <div class="form-group studygroupUpdate">
         <h3>StudyGroup 만들기</h3>
         <form action="/studyGroup/insert" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               
            그룹 이름 : <input type="text" name="studygroup_name"> <br>
               
            그룹 소개 : <input type="text" name="studygroup_info"> <br>
               
            <select name="studygroup_location">
               <option value="서울">서울</option>
               <option value="부산">부산</option>
               <option value="대구">대구</option>
            </select> 그룹 지역 : <br>
            
            최대 인원 : 
            <input type="text" name="max_user_number"> <br> 
            
            대면여부 : 
            <input type="radio" name="isface" value="Y">대면
            <input type="radio" name="isface" value="N">비대면 <br>
            
            카테고리 : <select name="category_no">
               <option value="1">IT</option>
               <option value="2">외국어</option>
               <option value="3">취업</option>
               <option value="4">자격증</option>
               <option value="5">전공</option>
               <option value="6">수험생</option>
            </select> <br>
            
            <div class="inputArea">
               <label for="img">이미지</label> <input type="file" id="img"
                  name="file" />
               <div class="select_img">
                  <img src="" />
               </div>

            </div>

            <input type="hidden" name="user_no"
               value="${sessionScope.user.user_no}"> <input type="submit"
               value="그룹만들기">
         </form>
         <br> <br> <br> <br> <br> <br> <br>

         <br> <br> <br>
      </div>
   </div>
   <jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<jsp:include page="../common/scri.jsp"></jsp:include><hr>
<script>
                  $("#img").change(
                        function() {
                           if (this.files && this.files[0]) {
                              var reader = new FileReader;
                              reader.onload = function(data) {
                                 $(".select_img img").attr("src",
                                       data.target.result).width(
                                       500);
                              }
                              reader.readAsDataURL(this.files[0]);
                           }
                        });
               </script>
</html>