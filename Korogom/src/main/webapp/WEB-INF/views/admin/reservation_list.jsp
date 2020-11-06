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
	<div class="col-lg-12">
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
                      <th>송금확인</th>
                    </tr>
                  </thead>
                  <c:forEach items="${resv}" var="resv">
                  	<tr>
                  		<td><c:out value="${resv.ino }"/></td>
                  		<td><c:out value="${resv.roomno }"/></td>
                  		<td><c:out value="${resv.mno }"/></td>
                  		<td><c:out value="${resv.istart }"/></td>
                  		<td><c:out value="${resv.iend }"/></td>
                  		<td><c:out value="${resv.icnt }"/></td>
                  		<td><c:out value="${resv.ifood }"/></td>
                  		<td><c:out value="${resv.isend }"/></td>
                  		<td>
                  			<c:if test="${resv.ibool eq 0}">
                  				<button id='addReplyBtn' class='btn btn-primary btn-xs'>입금확인</button>
                  			</c:if>
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
</body>
</html>