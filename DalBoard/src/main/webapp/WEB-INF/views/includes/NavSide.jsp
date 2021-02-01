<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
		<div class="col-sm-2 sidenav">
	      <p><a href="${contextPath}/board/fBoard">Free Board</a></p>
	      <p><a href="${contextPath}/board/nBoard">Notice</a></p>
	      <p><a href="${contextPath}/board/qnaBoard">Q&A</a></p>
    	</div>