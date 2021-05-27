<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="common/head.jsp"></jsp:include>


<jsp:include page="common/header.jsp"></jsp:include>
<body>
   <input type="hidden" id="user_no" value="${user.user_no }">
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="/resources/img/banner1.jpg">
         <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="/resources/img/banner2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src=${random[0].thumbimg} alt="" style="width: 400px; height: 400px">
                        </div>
                        <div class="banner__item__text">
                            <h2>${random[0].studygroup_name}</h2>
                            <a href="#">random 1 link</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src=${random[1].thumbimg} alt="" style="width: 400px; height: 400px">
                        </div>
                        <div class="banner__item__text">
                            <h2>${random[1].studygroup_name}</h2>
                            <a href="#">ramdom 2 link</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <img src= ${random[2].thumbimg} alt="" style="width: 400px; height: 400px">
                        </div>
                        <div class="banner__item__text">
                            <h2>${random[2].studygroup_name}</h2>
                            <a href="/user/signUp">ramdom 3 link</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li value="new">NEW</li>
                        <li value="hot">HOT</li>
                        <li value="recom">RECOMMEND</li>
                    </ul>
                </div>
            </div>
            
            <div class="row product__filter" id="newGroup" >
            
            </div>
            <div class="row product__filter" id="hotGroup" style="display:none;">
            
            </div>
            <div class="row product__filter" id="recomGroup" style="display:none;">
            
            </div>
        </div>
    </section>
    <!-- Product Section End -->




<jsp:include page="common/footer.jsp"></jsp:include><hr>
</body>

<jsp:include page="common/scri.jsp"></jsp:include><hr>
</html>