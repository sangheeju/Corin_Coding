<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<!-- header -->
	<div class="header">
	</div>
	<c:if test="${user != null}">
		<c:out value="${user.mnick }님 어서오세요!" />
	</c:if>
	
	<!-- container -->
	<div class="container">
		
		<div class="content">
			<img src="./resources/images/mesoon.jpg" class="rounded" alt="test" width="80%" />
		</div>
		
	</div>
</div>
	<!-- bottom -->
	<jsp:include page="includes/header.jsp"></jsp:include>
	
	<!-- footer -->
	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>