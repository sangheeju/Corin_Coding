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
<jsp:include page="../includes/header.jsp" />

<style>
#center {
	width: 100%;
	height: 150px;
}
#intro {
	text-align:left;
	font-size: 15px;
	padding:20px;
}
</style>
</head>
<body>

	<!-- top -->
	<jsp:include page="<%=request.getContextPath()%>/includes/top.jsp" />
	
	<div class="frame">

		<!-- container -->
		<div class="container">
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-12">
					<h2>펫시터 소개</h2>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/ju.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						이름: 주상희<br>
						자격증: 동물간호복지사(2011.11)<br>
						- 우리집 아이들 보살피듯 보살피겠습니다!<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/kim.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						이름: 김성환<br>
						자격증: 애완동물 훈련사(2013.3)<br>
						- 사회성이 떨어지는 아이도 제게 맡겨주세요<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/roh.png">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						이름: 노유림<br>
						자격증: 애완동물 훈련사(2015.11)<br>
						- 바바~~★★★<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/cha.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						이름: 차영환<br>
						자격증: 애완동물 훈련사(2018.09)<br>
						- 최선을 다해 보살피겠습니다!!<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/jin.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						이름: 진서영<br>
						자격증: 동물간호복지사(2018.06)<br>
						- 내 반려동물처럼 생각하고 무사히 돌아갈 수 있도록 하겠습니다<br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- bottom -->
	<jsp:include page="<%=request.getContextPath()%>/includes/bottom.jsp" />

	<!-- footer -->
	<jsp:include page="../includes/footer.jsp" />
</body>
</html>