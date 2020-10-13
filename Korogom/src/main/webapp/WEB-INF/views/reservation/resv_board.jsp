<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <c:forEach items="${list}" var="board">
                  	<tr>
                  		<td><c:out value="${board.bno }"/></td>
                  		<td><a class='move' href='<c:out value="${board.bno }"/>'><c:out value="${board.title }"/></a></td>
                  		<td><c:out value="${board.writer }"/></td>
                  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdate}"/></td>
                  		<td><c:out value="${board.bcnt}"/></td>
                  	</tr>
                  </c:forEach>
</table>
</body>
</html>