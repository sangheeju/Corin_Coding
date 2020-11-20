<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="toDay" class="java.util.Date" />
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<div class="row">
	<div class="col-lg-1">
		Slide
	</div>
	<div class="col-lg-10">
		<div class="panel panel-default">
			<div class="panel-heading">Reservation detail Page</div>
			<div class="panel-body">
				<form role="form" action="/reservation_register" method="post">
					<div class="form-group">
						<h2><c:out value="${room.roomno}"/>호</h2>
						<input type="hidden" name="roomno" value='<c:out value="${room.roomno}"/>'>
					</div>
					<div class="form-group">
						<img src="/image/<c:out value='${room.uploadPath}'/>/s_<c:out value='${room.uuid}'/>_<c:out value='${room.fileName}'/>">
					</div>
					<div class="form-group">
						<label>타입 : <c:out value="${room.roomtype}"/>숙박가능</label>
					</div>
					<div class="form-group">
						<label>1박 기준 : <c:out value="${room.roomprice}"/>원</label>
						<input type="hidden" name="roomprice" value='<c:out value="${room.roomprice}"/>' >
					</div>
					<div class="form-group">
						<label><c:out value="${room.roomcontent }"/></label>
					</div>
					<div class="form-group">
						<label>비고</label>
						<input class="form-control" name="roometc" value='<c:out value="${room.roometc }"/>' readonly="readonly">
					</div>
					<button type="submit" class="btn btn-primary" id="resv_Btn">예약하기</button>
			   	 	<button type="submit" class="btn btn-danger" id="resv_listBtn">뒤로가기</button>
				</form>
			</div>
		</div>
    </div>
    <div class="col-lg-1">
		Slide
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$("#resv_Btn").on("click", function(){
			formObj.attr("action", "/reservation/resv_reservation");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
		$("#resv_listBtn").on("click", function(){
			formObj.attr("action", "/community/resv_list");
			formObj.submit();
		});
	});
</script>
<script>
$(function(){
	CKEDITOR.replace('roomcontent',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/adm/fileupload.do'
	});
});
</script>
</body>
</html>