<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<%@ include file="../includes/Header.jsp"%>
<style>
table, td, th {
	border: 1px solid #ddd;
	text-align: center;
}

table {
	margin-top: 30px;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}
</style>
<!-- NavTop -->
<%@ include file="../includes/NavTop.jsp"%>
<div class="container-fluid text-center">
	<div class="row content">
		<!-- NavSide -->
		<%@ include file="../includes/NavSide.jsp"%>
		<div class="col-sm-9">
			<div class="table-responsive">
			<h2><br />자유 게시판</h2>
				<table class="table">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${list }">
						<tr>
							<td>${board.bno}</td>
							<td><a href='${pageContext.request.contextPath }/board/detail?bno=${board.bno}'>${board.btitle} </a></td>
							<td>${board.bdate}</td>
							<td>${board.mid}</td>
							<td><span class="badge">${board.bcnt }</span></td>
						</tr>
					</c:forEach>
				</table>
				<input type='hidden' name='mno' value='${board.mno}' />
				<input type='hidden' name='mid' value='${user.mid }' />
				<div class="box-footer">
					<button class="btn btn-success">글 쓰기</button>
				</div>
			</div>
			<div><br/></div>
			  <div align="center">  
				  <ul class="pagination">
				  	<c:if test="${pageMaker.startPage != 1 }">
				    <li class="paginate_button previous"><a href="${pageContext.request.contextPath }/board/fBoard?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}">Previous</a></li>
				    </c:if>
				    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<c:choose>
							<c:when test="${num == pageMaker.nowPage }">
								<li><a href="#">${num }</a></li>
							</c:when>
							<c:when test="${num != pageMaker.nowPage }">
								<li><a href="${pageContext.request.contextPath }/board/fBoard?nowPage=${num }&cntPerPage=${pageMaker.cntPerPage}">${num }</a></li>
							</c:when>
						</c:choose>			
					</c:forEach>
					<c:if test="${pageMaker.endPage != pageMaker.lastPage}">
				    <li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
				    </c:if>
				  </ul>

				</div>	<!--  End Of Paging -->
		</div>
	</div>
</div>
<script>
	$(function() {
		//메인 버튼을 눌렀을 때 처리
		$(".btn-success").click(function() {
			location.href = "${contextPath}/board/register";
		});
	})
</script>
<%@ include file="../includes/Bottom.jsp"%>