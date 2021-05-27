<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<nav class="pcoded-navbar menu-light ">
	<div class="navbar-wrapper  ">
		<div class="navbar-content scroll-div ">

			<div class="">
				<div class="main-menu-header">
					<img class="img-radius" src="/resources/img/manager.png" alt="User-Profile-Image">
					<div class="user-details">
						<div id="more-details">
							관리자 <i class="fa fa-caret-down"></i>
						</div>
					</div>
				</div>
				<div class="collapse" id="nav-user-link">
					<ul class="list-unstyled">
						<li class="list-group-item"><a href="/manager/list"><i
								class="feather icon-user m-r-5"></i>관리자 추가/삭제</a></li>
					</ul>
				</div>
			</div>

			<ul class="nav pcoded-inner-navbar ">


				<li class="nav-item pcoded-hasmenu"><a href="#"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">사용자
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="/manageUser/list" >전체 회원
								리스트</a></li>
						<li><a href="/manageUser/newList">새로운
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
					

				<li class="nav-item"><a href="/qna/manager_list" class="nav-link "><span
						class="pcoded-micon"><i class="feather icon-home"></i></span><span
						class="pcoded-mtext">1:1 문의 관리</span></a>
				</li>
						
						
				<li class="nav-item pcoded-hasmenu"><a href="#!"
					class="nav-link "><span class="pcoded-micon"><i
							class="feather icon-layout"></i></span><span class="pcoded-mtext">스터디그룹
							관리</span></a>
					<ul class="pcoded-submenu">
						<li><a href="/studyGroup/manager_list" >스터디그룹
								리스트</a></li>

					</ul></li>

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

