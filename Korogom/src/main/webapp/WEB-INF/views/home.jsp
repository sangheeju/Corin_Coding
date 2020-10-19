<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레이아웃테스트</title>

<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<div class="frame">

	<!-- header -->
	<div class="header">
	</div>
	<c:if test="${user != null}">
		<c:out value="${user.mnick }님 어서오세요!" />
	</c:if>
	
	<!-- container -->
	<div class="container">
		
		<div class="content">
			내용
		</div>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="includes/footer.jsp"></jsp:include>
</div>
</body>
</html>