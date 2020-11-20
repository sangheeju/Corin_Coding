<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />

<div class="row">
	<div class="col-lg-12">
		<h2>예약 내역</h2>
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
	<div id="t1" class="col-lg-10">
	<table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>예약번호</th>
                      <th>예약숙소</th>
                      <th>회원번호</th>
                      <th>체크인</th>
                      <th>체크아웃</th>
                      <th>맡길 동물 수</th>
                      <th>요청사료</th>
                      <th>송금인</th>
                      <th>입금확인</th>
                      <th>예약취소</th>
                    </tr>
                  </thead>
                  <c:forEach items="${resv}" var="resv">
                  	<tr>
                  		<td><c:out value="${resv.ino }"/></td>
                  		<td><c:out value="${resv.roomno }"/>호</td>
                  		<td><c:out value="${resv.mno }"/></td>
                  		<td><c:out value="${resv.istart }"/></td>
                  		<td><c:out value="${resv.iend }"/></td>
                  		<td><c:out value="${resv.icnt }"/></td>
                  		<td><c:out value="${resv.ifood }"/></td>
                  		<td><c:out value="${resv.isend }"/></td>
                  		<td>
                  			<c:if test="${resv.ibool eq 0}">
                  				<button type='button' name='check' class='btn btn-primary btn-sm' value='<c:out value="${resv.ino }"/>'>입금확인</button>
                  			</c:if>
                  			<c:if test="${resv.ibool eq 1}">
                  				<button type="button" class="btn btn-outline-secondary btn-sm">입금완료</button>
                  			</c:if>
                  		</td>
                  		<td>
                  			<button type='button' name='cancel'  class='btn btn-danger btn-sm' value='<c:out value="${resv.ino}"/>'>예약취소</button>
                  		</td>
                  	</tr>
                  </c:forEach>
	</table>
    <div class='text-center'>
    	<ul class="bpaging">
    		<c:if test="${pageMaker.prev }">
    			<li class='pbutton'><a class='pnum' href="reservation_list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    			<li class="pbutton">
    				<a class="pnum${pageMaker.cri.page == num ? '_active':''}" href="reservation_list${pageMaker.makeSearch(num)}">${num}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li class="pbutton" ><a class='pnum' href="reservation_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    		</c:if>
    	</ul>
    </div>
    </div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
<script>
$(document).on("click",'[name="check"]',function(){
	var ino = $(this).attr('value');
	console.log(ino);
	$.ajax({
		url: '/admin/deposit_check',
		data: {ino:ino},
		dataType: 'text',
		type: 'POST'
	});
	window.location.reload(true);
});
$(document).on("click",'[name="cancel"]',function(){
	var ino = $(this).attr('value');
	console.log(ino);
	$.ajax({
		url: '/admin/deposit_cancel',
		data: {ino:ino},
		dataType: 'json',
		type: 'POST'
	});
	window.location.reload(true);
});

</script>
</body>
</html>