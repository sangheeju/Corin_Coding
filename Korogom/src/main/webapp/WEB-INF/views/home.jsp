<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOROGOM</title>

<!-- header -->
<jsp:include page="includes/header.jsp"></jsp:include>

</head>
<body>

	<!-- top -->
	<jsp:include page="includes/top.jsp"></jsp:include>
	<div class="frame">

		<!-- container -->
		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="demo" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src='${contextPath }/resources/images/merry.jpg' alt="merry">
							</div>
							<div class="carousel-item">
								<img src='${contextPath }/resources/images/merry1.jpg' alt="merry1">
							</div>
							<div class="carousel-item">
								<img src='${contextPath }/resources/images/merry2.jpg' alt="merry2">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>

					</div>
				</div>
				<div class="col-sm-2" style="margin-top: 10px;">
					<div class="card">
						<div class="card-body" style="text-align: center;">
							<c:if test="${user != null}">
								<p>
									<c:out value="${user.mnick }님" />
									<br /> 어서오세요!
								</p>
								<button type="button" class="btn btn-dark btn-block">로그아웃</button>
								<br />
								<button type="button" class="btn btn-info btn-block">
									예약내역 <br />확인
								</button>
							</c:if>
							<c:if test="${user == null}">
								<button type="button" class="btn btn-primary">로그인</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<h3>공지사항</h3>
					<table class="table">
						<thead>
							<tr>
								<th>게시일</th>
								<th colspan="3">제목</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>년-월-일</td>
								<td colspan="3"><a href="${pageContext.request.contextPath}/member/login">제목</a></td>
							</tr>
						</tbody>
					</table>
					<p style="text-align: right;">
						<a href="${pageContext.request.contextPath}/introduce/v_notice_board">더보기</a>
					</p>
				</div>
				<div class="col-sm-6">
					<h3>등록한 애완동물 정보</h3>
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>나이</th>
								<th>유형</th>
								<th>성별</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="plist" items="${plist }">
								<tr>
									<td><a href='/member/petPage?pno=${plist.pno }'>${plist.pname}</a></td>
									<td>${plist.pbirth}</td>
									<td>${plist.pdiv}</td>
									<td>${plist.pdel}</td>
								</tr>
							</c:forEach>							
						</tbody>
					</table>
					<p style="text-align: right;">
						<a href="${pageContext.request.contextPath}/member/login">+ 애완동물 추가 / 삭제</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		//회원정보 수정을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="member/login";
		});
		//회원 탈퇴 버튼을 눌렀을 때 처리
		$(".btn-dark").click(function(){
			location.href="./logout";
		});
		//예약내역 확인
		$(".btn-info").click(function(){
			location.href="member/logout";
		});
	})
	</script>

	<!-- bottom -->
	<jsp:include page="includes/bottom.jsp"></jsp:include>

	<!-- footer -->
	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>