<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<div class="row">
	<div class="col-lg-1">
		Slide
	</div>
	<div class="col-lg-10">
		<h2>Reservation list</h2>
		<table style="border: 2px solid gray">
			<c:forEach items="${list }" var="room">
			<thead>
				<tr>
					<td colspan="2"><c:out value="${room.roomno}"/>호</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="4" class="img">
						<a href='/reservation/resv_detail?roomno=<c:out value="${room.roomno}" />'>
							<img src="/image/<c:out value='${room.uploadPath}'/>/s_<c:out value='${room.uuid}'/>_<c:out value='${room.fileName}'/>">
						</a>
					</td>
					<td class="roomtype"><h5><c:out value="${room.roomtype}"/></h5></td>
				</tr>
				<tr>
					<td class="roomprice"><c:out value="${room.roomprice }"/></td>
				</tr>
				<tr>
					<td class="roomcontent"><c:out value="${room.roomcontent }"/></td>
				</tr>
				<tr>
					<td class="roometc"><c:out value="${room.roometc }"/></td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<div class='text-center'>
    		<ul class="bpaging">
    			<c:if test="${pageMaker.prev }">
    				<li class='pbutton'><a class='pnum' href="resv_list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
    			</c:if>
    			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage-1 }">
    				<li class="pbutton">
    					<a class="pnum${pageMaker.cri.page == num ? '_active':''}" href="resv_list${pageMaker.makeSearch(num)}">${num}</a>
    				</li>
    			</c:forEach>
    			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    				<li class="pbutton" ><a class='pnum' href="resv_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    			</c:if>
    		</ul>
    	</div>
    </div>
    <div class="col-lg-1">
		Slide
	</div>
</div>
</body>
</html>