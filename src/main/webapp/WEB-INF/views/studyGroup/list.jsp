<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<body>

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li><a href="#">IT (숫자)</a></li>
                                                    <li><a href="#">외국어 (숫자)</a></li>
                                                    <li><a href="#">취업 (숫자)</a></li>
                                                    <li><a href="#">자격증 (숫자)</a></li>
                                                    <li><a href="#">전공 (숫자)</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">인원수</a>
                                    </div>
                                    <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="#">1명 - 5명</a></li>
                                                    <li><a href="#">6명 - 10명</a></li>
                                                    <li><a href="#">11명 - 15명</a></li>
                                                    <li><a href="#">16명 - 20명</a></li>
                                                    <li><a href="#">21명 - 3명</a></li>
                                                    <li><a href="#">30명이상</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                   
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseSix">대면/비대면</a>
                                    </div>
                                    <div id="collapseSix" class="collapse" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__tags">
                                                <a href="#">대면</a>
                                                <a href="#">비대면</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>총갯수</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by</p>
                                    <select>
                                        <option value="">인원수 적은순</option>
                                        <option value="">인원수 많은순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <c:forEach var="studyGroup" items="${list }">
                    
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                    <img src="${studyGroup.thumbimg}" style="width: 262px; height: 262px;">
                                </div>
                                <div class="product__item__text">
                                    <a href="/studyGroup/detail?studygroup_no=${studyGroup.studygroup_no }" class="add-cart">+more</a>
                                   
                                    <h6>${studyGroup.category_no }</h6>
                                    
                                    <p>${studyGroup.studygroup_no }</p>
                                   
                                </div>
                                <h5><a href="/studyGroup/detail?studygroup_no=${studyGroup.studygroup_no }">${studyGroup.studygroup_name }</a></h5>
                            </div>
                        </div>
               
               </c:forEach>
                      
                  
              
                
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
    
    <!-- 페이지 영역 -->

   <!-- 이전 영역 -->

   <nav aria-label="...">
      <ul class="pagination" style="clear:right;width:500px;margin:auto">
         <!--이전  -->
         <c:if test="${pageMaker.prev}">
            <li class="page-item"><a class="page-link"
               href="${pageMaker.startPage -1}">Previous</a></li>
         </c:if>

         <!-- 페이지목록 -->
         <c:forEach var="num" begin="${pageMaker.startPage }"
            end="${pageMaker.endPage }">

            <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
               <a class="page-link" href="${num }">${num }</a>
            </li>


         </c:forEach>

         <!-- 이후 영역 -->
         <c:if test="${pageMaker.next}">

            <li class="page-item"><a class="page-link"
               href="${pageMaker.endPage +1 }">Next</a></li>
         </c:if>
      </ul>
   </nav>
   
   
   <!-- search -->
      <div class="row" style="clear:right;width:500px;margin:auto">
         <div class="col-lg-12">
            <form id="searchForm" action="/studyGroup/list" method="get">
               <select name="type">
                  <option value="W">카테고리</option>
                  <option value="T">내용</option>
                  <option value="C">작성자</option>
               </select>
               <input type="text" name="keyword" value="${pageMaker.cri.keyword}"/>
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
               <button class="btn btn-primary btn-sm">검색</button>
            </form>
         </div>
      </div>

      <!-- search(e) -->


   <form id='actionForm' action="/studyGroup/list" method='get'>
      <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
      <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
      <input type="hidden" name="type" value="${pageMaker.cri.type}">
      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
   </form>
   
    
    
<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<jsp:include page="../common/scri.jsp"></jsp:include><hr>
<script type="text/javascript">
   $(function() {
      var success_no = '<c:out value="${success.success_no }"></c:out>';
      var page = '<c:out value="${success.page }"></c:out>';

      studygroupInsertModal(success_no);

      history.replaceState({}, null, null);

      function studygroupInsertModal(success_no) {
         if (success_no === '' || history.state) {
            return;
         }

         if (parseInt(success_no) > 0) {
            $modal = $('.modal-frame');
            $overlay = $('.modal-overlay');

            $modal
                  .bind(
                        'webkitAnimationEnd oanimationend msAnimationEnd animationend',

                        function(e) {
                           if ($modal.hasClass('state-leave')) {
                              $modal.removeClass('state-leave');
                           }
                        });
            $overlay.addClass('state-show');
            $modal.removeClass('state-leave').addClass('state-appear');
         }
      }
      $('.close').on('click', function() {
         $overlay.removeClass('state-show');
         $modal.removeClass('state-appear').addClass('state-leave');
      });

      var actionForm = $("#actionForm");

      $(".page-item a").on("click", function(e) {
         e.preventDefault();
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });
   
   

   
   })

var searchForm = $("#searchForm");

$("#searchForm button").on("click",function(e) {
   if (!searchForm.find("input[name='keyword']").val()) {
      alert("키워드를 입력하세요");
      return false;
   }

    // 페이지 번호를 1로 처리
   searchForm.find("input[name='pageNum']").val("1");

    // 폼 태그의 전송을 막음
   e.preventDefault();

   searchForm.submit();

});

</script>
</html>