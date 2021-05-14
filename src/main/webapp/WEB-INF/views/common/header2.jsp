<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS here -->

<link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/slicknav.css">
<link rel="stylesheet" href="../css/fontawesome-all.min.css">
<link rel="stylesheet" href="../css/style.css">
</head>

<body>
 
 <header>
	 <!-- Header Start -->
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper">
                         <!-- Logo -->
                        <div class="logo">
                            <a href="/CoStudy/main/mainPage.do">
                            	<img src="../images/logo/logo6.png" alt="" style="max-width: 130px;">
                            </a>
                        </div> 
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>  
                                <ul id="navigation">  
                                    <li>
                                    <a href="/CoStudy/studyGroup/studyGroupListInfoAction.do">그룹 전체보기</a>
                                    </li>
                                    <li class="hot">
                                    <a href="/CoStudy/studyGroup/makeGroupFormAction.do">그룹 만들기</a>
                                    </li>
                                    <li>
                                    <a href="/CoStudy/user/myPageAction.do">마이페이지</a>
                                        <ul class="submenu">
                                            <li>
                                            <a href="/CoStudy/user/myPageAction.do">나의 프로필</a>
                                            </li>
                                            <li>
                                            <a href="/CoStudy/myPage/studyDiaryListAction.do">공부 일기</a>
                                            </li>
                                            <li>
                                            <a href="/CoStudy/myPage/scheduleListAction.do">일정 관리</a>
                                            </li>
                                            <li>
                                            <a href="/CoStudy/myPage/joinGroupListAction.do">1:1 채팅 목록</a>
                                            </li>
                                            <li>
                                            <a href="/CoStudy/myPage/joinGroupListAction.do">참가 그룹 목록</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                    <a href="#">고객지원</a>
                                        <ul class="submenu">
                                            <li>
                                            <a href="/CoStudy/notice/noticeUserListAction.do">공지 사항</a>
                                            </li>
                                            <li>
                                            <a href="/CoStudy/Qna/qnaUserListAction.do">1:1 질문하기</a>
                                            </li>
                                            <li>
                                            <a href="#">자주하는 질문</a>
                                            </li>
                                             <li>
                                            <a href="#">신고하기</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                        <ul id="navigation">
                        <%if (session.getAttribute("user")!=null) { %>
                                <li>
                                 <a href="/CoStudy/user/logout.do">로그아웃</a>
                                 </li>
                           <% } else { %>
                           		<li>
                                 <a href="/CoStudy/user/login.do">로그인</a>
                                 </li>
                                 
                                 <li>
                                 <a href="/CoStudy/user/signUp.do">회원가입</a>
                                 </li>
                                 <% } %>
                           </ul>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none">
                        	<div class="slicknav_menu">
                        		<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style>
                        		<span class="slicknav_menutxt">MENU</span>
                        		<span class="slicknav_icon">
                        		<span class="slicknav_icon-bar"></span>
                        		<span class="slicknav_icon-bar"></span>
                        		<span class="slicknav_icon-bar"></span>
                        		<span class="slicknav_icon-bar"></span>
                        		</span>
                        		</a>
                        		<ul class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">  
                                    <li>
                                    <a href="#" role="menuitem" tabindex="-1">그룹 참가하기</a>
                                    </li>
                                    <li>
                                    <a href="#" role="menuitem" tabindex="-1">그룹 만들기</a>
                                    </li>
                                    <li class="hot slicknav_collapsed slicknav_parent">
                                    <a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style>
                                    <a href="#" tabindex="-1">마이페이지</a>
                                        <span class="slicknav_arrow">+</span>
                                        </a>
                                        <ul class="submenu slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">나의 프로필</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">공부 일기</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">일정 관리</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">1:1 치탱 목록</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">참가 그룹 목록</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">관심분야 수정</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">회원정보 수정</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">회원 탈퇴 신청</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="slicknav_collapsed slicknav_parent">
                                    <a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style>
                                    <a href="#" tabindex="-1">고객 지원</a>
                                        <span class="slicknav_arrow">+</span>
                                        </a>
                                        <ul class="submenu slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
                                            <li>
                                            <a href="#">공지 사항</a>
                                            </li>
                                            <li>
                                            <a href="#" role="menuitem" tabindex="-1">1:1 질문하기</a>
                                            </li>
                                             <li>
                                            <a href="#" role="menuitem" tabindex="-1">자주하는 질문</a>
                                            </li>
                                             <li>
                                            <a href="#" role="menuitem" tabindex="-1">신고하기</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                        	</div>
                    </div>
                </div>
            </div>
        </div>
     </div>
        <!-- Header End -->
    </header>
	<script src="../../js/jquery-1.12.4.min.js"></script>

	<script src="../../js/jquery.slicknav.min.js"></script>

	<script src="../../css/js/main.js"></script>
	
	<script type="text/javascript" src="../../bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../bootstrap/jquery-ui.min.js"></script>


	   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
   crossorigin="anonymous">
   </script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
   integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
   crossorigin="anonymous">
   </script> 
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
   </script> 
 <script> $('.carousel').carousel({ interval: 2000 }) </script>  
</body>
</html>