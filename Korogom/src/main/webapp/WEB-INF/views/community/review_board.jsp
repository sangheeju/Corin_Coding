<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="toDay" class="java.util.Date" />
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
.s1{
	width:10%;
}
.s2{
	width:50%;
}
.s3{
	width:15%;
}
.s4{
	width:15%;
}
.s5{
	width:10%;
}
th{
	text-align:center;
}
</style>
<div class="row">
	<div class="col-lg-1">
		Slide
	</div>
	<div class="col-lg-10">
	<h2>Review Board</h2>
	<table class="table table-hover">
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
                  		<td class="s1"><c:out value="${board.bno }"/></td>
                  		<td class="s2"><a class='move' href='/community/review_detail${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno}'>
                  				<c:out value="${board.btitle }"/>
                  			</a>
                  		</td>
                  		<td class="s3"><c:out value="${board.mno }"/></td>
                  		<td class="s4"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdate }"/></td>
                  		<td class="s5"><c:out value="${board.bcnt}"/></td>
                  	</tr>
                  </c:forEach>
	</table>
	<div>
		<button type="button" class="btn btn-outline-secondary" onClick="location.href='../community/review_board'">후기</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../community/petsitter_board'">펫시터</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../community/v_qna_board'">Q&A</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../admin/qna_board'">관리자Q&A</button>
    	<button type="button" class="btn btn-outline-secondary" onClick="location.href='../admin/notice_board'">공지사항</button>     
    	<a href='/community/review_register' onClick='fn_write()' class="btn btn-success pull-right">글쓰기</a><br>&nbsp;
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
		<button class="btn btn-outline-secondary" id='searchBtn'>Search</button>
    </div>
    <div class='text-center'>
    	<ul class="bpaging">
    		<c:if test="${pageMaker.prev }">
    			<li class='pbutton'><a class='pnum' href="review_board${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    			<li class="pbutton">
    				<a class="pnum${pageMaker.cri.page == num ? '_active':''}" href="review_board${pageMaker.makeSearch(num)}">${num}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li class="pbutton" ><a class='pnum' href="review_board${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    		</c:if>
    	</ul>
    </div>
    </div>
    <div class="col-lg-1">
		Slide
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#searchBtn').on("click",function(event){
			self.location = "review_board"
			+'${pageMaker.makeQuery(1)}'
			+"&searchType="
			+$("select option:selected").val()
			+"&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
</body>
</html>