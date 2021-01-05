<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- Header -->
<%@ include file="../includes/Header.jsp"%>
<!-- NavTop -->
<%@ include file="../includes/NavTop.jsp"%>
<div class="container-fluid text-center">
	<div class="row content">
		<!-- NavSide -->
		<%@ include file="../includes/NavSide.jsp"%>
		<div class="col-sm-9">
			<section class="content">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">상세보기</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${board.btitle}" readonly="readonly" />
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${board.bcon}</textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${board.mid}" readonly="readonly" />
				</div>
				<input type='hidden' name='mno' value='${board.mno}' />
			</div>

		</div>
		<div class="box-footer">
			<button class="btn btn-success">메인</button>
			<button class="btn btn-warning">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
			<button class="btn btn-info">댓글작성</button>
		</div>

	</section>
	<script>
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href="../";
		});
		//목록 버튼을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="${contextPath}/board/boardList";
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-danger").click(function(){
			location.href="${contextPath}/board/delete?bno=" + ${board.bno};
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-warning").click(function(){
			location.href="${contextPath}/board/update?bno=" + ${board.bno};
		});
		//댓글작성 버튼을 눌렀을 때 처리
		//$(".btn-info").click(function() {
		//	location.href = "reply?bno=" + ${board.bno};
		//});
	})
	</script>
		</div>
	</div>
</div>

<%@ include file="../includes/Bottom.jsp"%>