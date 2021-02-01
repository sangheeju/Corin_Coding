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
		<div class="col-sm-6">
			<div class="table-responsive">
				<h2><a href='${pageContext.request.contextPath }/board/fBoard'>자유  게시판</a></h2>
				<table class="table">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${list }" begin="1" end="10" step="1">
						<c:if test="${board.bsort == 1}">
							<tr>
								<td>${board.bno}</td>
								<td><a href='${pageContext.request.contextPath }/board/detail?bno=${board.bno}'>${board.btitle} </a></td>
								<td>${board.bdate}</td>
								<td>${board.mid}</td>
								<td><span class="badge">${board.bcnt }</span></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<h2><br /><a href='${pageContext.request.contextPath }/board/nBoard'>공지 게시판</a></h2>
				<table class="table">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${list }" begin="1" end="10" step="1">
						<c:if test="${board.bsort == 2}">
							<tr>
								<td>${board.bno}</td>
								<td><a href='${pageContext.request.contextPath }/board/detail?bno=${board.bno}'>${board.btitle} </a></td>
								<td>${board.bdate}</td>
								<td>${board.mid}</td>
								<td><span class="badge">${board.bcnt }</span></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<h2><br /><a href='${pageContext.request.contextPath }/board/qnaBoard'>QnA 게시판</a></h2>
				<table class="table">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${list }" begin="1" end="10" step="1">
						<c:if test="${board.bsort == 3}">
								<tr>
								<td>${board.bno}</td>
								<td><a href='${pageContext.request.contextPath }/board/detail?bno=${board.bno}'>${board.btitle} </a></td>
								<td>${board.bdate}</td>
								<td>${board.mid}</td>
								<td><span class="badge">${board.bcnt }</span></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<input type='hidden' name='mno' value='${board.mno}' />
				<input type='hidden' name='mid' value='${user.mid }' />
				<input type='hidden' name='bsort' value='${board.bsort}' />
				<div class="box-footer">
				</div>
			</div>
			<div><br/></div>
		</div>
		<div class="col-sm-3">
		<h1> </h1>
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