<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KOROGOM</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Bootstrap 3.3.4 -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<!-- jQuery 3.4.1 -->
<script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<body>

	<!-- TOP -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>KOROGOM</h1>
	</div>

	<!-- NAV -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"	data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">센터소개</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/center_view.jsp">센터소개</a>
						<a class="dropdown-item" href="#">펫시터 소개</a> 
						<a class="dropdown-item" href="#">공지사항</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">예약</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">숙소 예약</a> 
						<a class="dropdown-item" href="#">예약 확인</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">커뮤니티</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">고객후기</a> 
						<a class="dropdown-item" href="#">펫시터 후기</a> 
						<a class="dropdown-item" href="#">고객문의</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">편의시설</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">카페/공원</a> 
						<a class="dropdown-item" href="#">병원</a> 
						<a class="dropdown-item" href="#">편의용품점</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">로그인</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/fclass/login_t/regi_loginfrm.jsp">로그인</a>
						<a class="dropdown-item" href="#">회원가입</a>
					</div>
				</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">*** 정보</a> 
						<a class="dropdown-item" href="#">관리</a> 
						<a class="dropdown-item" href="/fclass/login_t/logout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>