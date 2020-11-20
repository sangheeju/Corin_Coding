<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>KOROGOM</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/page.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/star.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/upload.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/panel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css">
<!-- 부가적인 테마 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>

	<!-- TOP -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>KOROGOM</h1>
	</div>

	<!-- NAV -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"	data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">센터소개</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/intro_center">센터소개</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/intro_petsiter">펫시터 소개</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/v_notice_board">공지사항</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">예약</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/resv_list">숙소 예약</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/reservation_check">예약 확인</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">커뮤니티</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/community/review_board">고객후기</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/community/petsitter_board">펫시터 후기</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/community/v_qna_board">고객문의</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">편의시설</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/amenities/cafe_view">카페/공원</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/amenities/hospt_view">병원</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/amenities/snack_view">편의용품점</a>
						
					</div>
				</li>
				<c:set var="user" value="${sessionScope.user }"/>
				<c:choose>
					<c:when test="${null eq user}">
					<span class="float-right">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">로그인</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">로그인</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/member/mregister">회원가입</a>
							</div>
						</li>
					</span>
					</c:when>
					<c:when test="${'ADMIN' eq user}">
						<li class="nav-item dropdown">
							<span class="float-right">
							<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminpage">관리자페이지</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
							</div>
							</span>
						</li>
					</c:when>
					<c:when test="${'naver' eq site}">
						<li class="nav-item dropdown">
						<span class="float-right">
							<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">로그아웃</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
							</div>
						</span>
						</li>
					</c:when>
					<c:when test="${!empty user}">
						<li class="nav-item dropdown" style="text-align:right">
						<span class="float-right">
							<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${contextPath}/member/myPage?mno=<%= session.getAttribute("mno") %>"><%= session.getAttribute("user") %>님의페이지</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
						</div>
						</span>
						</li>
					</c:when>
			</c:choose>
			</ul>
		</div>
	</nav>