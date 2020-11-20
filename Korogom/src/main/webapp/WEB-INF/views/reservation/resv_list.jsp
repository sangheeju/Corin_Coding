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
<style>
td{
	text-align:left;
}
</style>
<div class="row">
	<div class="col-lg-1">
		
	</div>
	<div class="col-lg-10">
		<h2>Reservation list</h2>
		<table style="border: 2px solid gray;width:100%;">
			<c:forEach items="${list }" var="room">
			<thead style="border-top: 2px solid gray">
				<tr>
					<td colspan="2"><h3><c:out value="${room.roomno}"/>호</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="4" class="img" style="width:280px">
						<a href='/reservation/resv_detail?roomno=<c:out value="${room.roomno}" />'>
							<img style="width:100%" src="/image/<c:out value='${room.uploadPath}'/>/s_<c:out value='${room.uuid}'/>_<c:out value='${room.fileName}'/>">
						</a>
					</td>
					<td class="roomtype"><h5><c:out value="${room.roomtype}"/>숙박 전용</h5></td>
				</tr>
				<tr>
					<td class="roomprice"><c:out value="${room.roomprice }"/>원(1박)</td>
				</tr>
				<tr>
					<td class="roomcontent"><c:out value="${room.roomcontent }"/></td>
				</tr>
				<tr>
					<td class="roometc">숙박가능 동물 수 : <c:out value="${room.roomcnt }"/></td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<div class='text-center'>
    		<ul class="bpaging">
    			<c:if test="${pageMaker.prev }">
    				<li class='pbutton'><a class='pnum' href="resv_list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
    			</c:if>
    			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
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
		
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
</body>
</html>