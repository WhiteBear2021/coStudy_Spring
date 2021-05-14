<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<nav class="pcoded-navbar menu-light ">
	<div class="navbar-wrapper  ">
		<div class="navbar-content scroll-div ">

			<div class="">
				<div class="main-menu-header">
					<img class="img-radius" src="" alt="User-Profile-Image">
					<div class="user-details">
						<div id="more-details">
							관리자 <i class="fa fa-caret-down"></i>
						</div>
					</div>
				</div>
				<div class="collapse" id="nav-user-link">
					<ul class="list-unstyled">
						<li class="list-group-item"><a href="managerList.do"><i
								class="feather icon-user m-r-5"></i>관리자 리스트/추가</a></li>
						<li class="list-group-item"><a
							href="#"><i
								class="feather icon-log-out m-r-5"></i>로그아웃</a></li>
					</ul>
				</div>
			</div>

			<ul class="nav pcoded-inner-navbar ">

				<li class="nav-item pcoded-hasmenu"><a href="#!"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">디자인
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="#" >배너 이미지
								변경</a></li>
						<li><a href="#" >이미지
								편집</a></li>
					</ul></li>
				<li class="nav-item pcoded-hasmenu"><a href="#"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">사용자
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="../manageUser/userInfo.do" >전체 회원
								리스트</a></li>
						<li><a href="#" >통계_회원</a></li>
						<li><a href="../manageUser/newUser.do">새로운
								회원</a></li>
					</ul></li>
				<li class="nav-item pcoded-hasmenu"><a href="#"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">공지사항
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="/notice/list" >공지사항 리스트</a></li>
						<li><a href="/notice/insert" >공지사항 등록</a></li>

					</ul></li>
				<li class="nav-item pcoded-hasmenu"><a href="#!"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">자주묻는질문
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="#" >자주묻는질문 리스트</a></li>
						<li><a href="#" >자주묻는질문 등록</a></li>

					</ul></li>

				<li class="nav-item"><a href="/CoStudy/Qna/QnaInfoAction.do" class="nav-link "><span
						class="pcoded-micon"><i class="feather icon-home"></i></span><span
						class="pcoded-mtext">1:1 문의 관리</span></a></li>
						
						
				<li class="nav-item pcoded-hasmenu"><a href="#!"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">스터디그룹
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="#" >스터디그룹
								리스트</a></li>
						<li><a href="#" >통계_스터디그룹</a></li>

					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link "><span
						class="pcoded-micon"><i class="feather icon-home"></i></span><span
						class="pcoded-mtext">신고 관리</span></a></li>
			</ul>



		</div>
	</div>
</nav>
<header
	class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">


	<div class="m-header">
		<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
		<a href="#!" class="b-brand"> </a> <a href="#!" class="mob-toggler">
			<i class="feather icon-more-vertical"></i>
		</a>
	</div>


</header>

