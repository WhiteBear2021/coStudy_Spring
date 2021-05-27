<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <header class="header_area">
        <!-- Top Header Area Start -->
        <div class="top_header_area">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-end">

                    <div class="col-12 col-lg-7">
                        <div class="top_single_area d-flex align-items-center">
                            <!-- Logo Area -->
                            <div class="top_logo">
                                <a href="#"><img src="/resources/img/logo2.PNG" alt="" width="200px" height="100px"></a>
                            </div>
                            <!-- Cart & Menu Area -->
                            <div class="header-cart-menu d-flex align-items-center ml-auto">
                                <!-- Cart Area -->
                                <div class="cart">

                                <%if (session.getAttribute("user")!=null) { %>
                                	<a href="/myPage/userProfile" id="header-cart-btn" target="_blank"> My Page &nbsp;&nbsp; |&nbsp;&nbsp; </a>
                                    <a href="/user/logout" id="header-cart-btn" target="_blank"> Logout &nbsp;&nbsp;&nbsp;&nbsp; </a>
                                    <% } else { %>
                                    <a href="/user/login" id="header-cart-btn" target="_blank"> Login &nbsp;&nbsp;|&nbsp;&nbsp; </a>
                                    <a href="/user/signUp" id="header-cart-btn" target="_blank"> Sign Up &nbsp;&nbsp; &nbsp;&nbsp; </a>
                                    <% } %>

                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Top Header Area End -->
        <div class="main_header_area">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-12 d-md-flex justify-content-between">
                        <!-- Header Social Area -->
                        <div class="header-social-area col-2">

                        </div>
                        <!-- Menu Area -->
                        <div class="main-menu-area col-">
                            <nav class="navbar navbar-expand-lg align-items-start">

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                    <ul class="navbar-nav animated" id="nav">
                                        <li class="nav-item active"><a class="nav-link" href="/main">Home</a></li>



                                        <li class="nav-item"><a class="nav-link" href="/studyGroup/list">Study Group List</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/notice/user_list">공지사항</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/qna/list">1:1문의</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <!-- Help Line -->
                        <div class="help-line ">
                        <% if (session.getAttribute("user")!=null) { %>
                            <a href="/studyGroup/insert">
                                Make Study Group
                            </a>
                        <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
