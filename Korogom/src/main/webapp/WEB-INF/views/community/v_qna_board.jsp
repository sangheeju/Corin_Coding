<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />

<div class="row">
	<div class="col-lg-12">
		<h2>Q&A Board</h2>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
	<table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>회원번호</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <c:forEach items="${list}" var="board">
                  	<tr>
                  		<td><c:out value="${board.bno }"/></td>
                  		<td><a class='move' href='/community/v_qna_detail${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno}'><c:out value="${board.btitle }"/></a></td>
                  		<td><c:out value="${board.mno }"/></td>
                  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdate }"/></td>
                  		<td><c:out value="${board.bcnt}"/></td>
                  	</tr>
                  </c:forEach>
	</table>
	<div>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../reservation/resv_board'">후기</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../community/petsitter_board'">펫시터</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../community/v_qna_board'">Q&A</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../admin/qna_board'">관리자Q&A</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../admin/notice_board'">공지사항</button>
    <div class='box-body'>
    	<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>회원번호</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목 + 내용</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용 + 회원번호</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목 + 내용 + 회원번호</option>
		</select>
		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
		<button id='searchBtn'>Search</button>
	</div>
    <div class='text-center'>
    	<ul class="bpaging">
    		<c:if test="${pageMaker.prev }">
    			<li class='pbutton'><a class='pnum' href="resv_board${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    			<li class="pbutton">
    				<a class="pnum${pageMaker.cri.page == num ? '_active':''}" href="resv_board${pageMaker.makeSearch(num)}">${num}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li class="pbutton" ><a class='pnum' href="resv_board${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    		</c:if>
    	</ul>
    </div>
    </div>
</div>
</div>
<script>
	$(document).ready(function(){
		$('#searchBtn').on("click",function(event){
			self.location = "qna_board"
			+'${pageMaker.makeQuery(1)}'
			+"&searchType="
			+$("select option:selected").val()
			+"&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
</body>
</html>