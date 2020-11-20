<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<div class="row">
	<div class="col-lg-12">
		<h2>Admin Page</h2>
	</div>
</div>

<div class="row">
	<div class="col-lg-2">
		<div id='navi' class="cnav">
      		<ul>
        		<li><a href="/member/memberPage">회원 관리</a></li>
        		<li><a href="/admin/reservation_list">예약 목록</a></li>
        		<li><a href="/admin/notice_board">공지사항 등록</a></li>
        		<li><a href="/admin/qna_board">Q&A 등록</a></li>
        		<li><a href="/admin/room_register">객실 등록</a></li>
      		</ul>
    	</div>
	</div>
	<div class="col-lg-9">
    </div>
    <div class="col-lg-1">
    </div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
</body>
</html>