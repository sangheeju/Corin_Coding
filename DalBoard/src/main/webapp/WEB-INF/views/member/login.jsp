<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<title>Login Page</title>
</head>
<style>
.blankdiv {
	background-color: #e7e7e7;
	height:500px;
}
.spacing {
	padding: 20px 20px;
	align-items: center;

}
#kakaologin {
	border: none;
	align-items: center;
}
</style>
<body>
<!-- Header -->
<%@ include file="../includes/Header.jsp"%>
<!-- NavTop -->
<%@ include file="../includes/NavTop.jsp"%>
<div class="row content">
<div class="col-sm-3 blankdiv"> </div>
<div class="col-sm-4">
	<section class="content">
		<div class="spacing">
			<Form method="post">
				<div class="input-group">
			      <input id="email" type="text" class="form-control" name="mid" placeholder="아이디">
			      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
			    </div>
			    <div class="input-group">
			      <input id="password" type="password" class="form-control" name="mpass" placeholder="비밀번호">
			      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			    </div>
			<input type="submit" value="로그인" />
			</Form>
		</div>	
		<div class="spacing">
			<button type="button" name="kakaologin">
				<img src='${contextPath }/resources/images/kakao_login.png' alt="btnImages" class="btnImages">
			</button>
		</div>
	</section>
<hr>
<div class="col-sm-4">
		admin/12345<br>
		admin1/54321<br>
</div>
	</div>
</div>
<!-- Bottom -->
<%@ include file="../includes/Bottom.jsp"%>