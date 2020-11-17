<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- NAV -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href='${contextPath}/'>HOME</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"	data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar" class="clearfix">
		<ul class="navbar-nav">
			<!-- Dropdown -->
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">센터소개</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${contextPath}/introduce/center_view.jsp">센터소개</a>
					<a class="dropdown-item" href="#">펫시터 소개</a> 
					<a class="dropdown-item" href="#">공지사항</a>
				</div>
			</li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">예약</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">숙소 예약</a> 
					<a class="dropdown-item" href="#">예약 확인</a>
				</div>
			</li>
			<li class="nav-item dropdown">
			<a	class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">커뮤니티</a>
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
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${user==null }">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">로그인</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href='${contextPath}/member/login'>로그인</a> 
						<a class="dropdown-item" href='${contextPath}/member/mregister'>회원가입</a>
					</div>
				</li>

			</c:if>
			<c:if test="${user!=null }">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">마이페이지</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href='${contextPath}/member/myPage?mno=${user.mno }'>${user.mnick }님의
							페이지</a> 
						<c:if test="${user.mclass == 3 }">
						<a class="dropdown-item" href='${contextPath}/member/memberPage'>관리자메뉴</a>
						</c:if>
						<a class="dropdown-item" href='${contextPath}/member/logout'>로그아웃</a>
					</div>
				</li>
			</c:if>
		</ul>
	</div>
</nav>