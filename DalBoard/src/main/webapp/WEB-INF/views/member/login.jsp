<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<title>Login Page</title>
</head>
<body>
<!-- Header -->
<%@ include file="../includes/Header.jsp"%>
<!-- NavTop -->
<%@ include file="../includes/NavTop.jsp"%>
<div style="margin-top:50px">
<section class="content">
	<Form method="post">
	아이디 : <input type="text" name="mid" /><br>
	패스워드 : <input type="text" name="mpass" /><br>
	<input type="submit" value="로그인" />
	
	</Form>
	<hr>
	admin/12345<br>
	
</section>
</div>
<!-- Bottom -->
<%@ include file="../includes/Bottom.jsp"%>