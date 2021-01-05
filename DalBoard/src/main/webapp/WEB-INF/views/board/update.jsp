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
				<form role="form" method="post">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">글 수정하기</h3>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label>제목</label> <input type="text" name="btitle"
									class="form-control" value="${board.btitle}">
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea name="bcon" rows="5" class="form-control">${board.bcon}</textarea>
							</div>

							<div class="form-group">
								<label>작성자</label> <input type="text" name="mid" readonly
									class="form-control" value="${board.mid}" />
							</div>
						</div>

					</div>
							<input type='hidden' name='mno' value='${board.mno}' />					
							<input type='hidden' name='bno' value='${board.bno}' />
					<div class="box-footer">
						<button class="btn btn-warning" type="submit">수정</button>
				</form>
			</section>
						<button class="btn btn-primary">목록</button>
					</div>
			<script>
				$(function() {
					//등록 버튼을 눌렀을 때 처리
//					$(".btn-warning").click(function() {
//						location.href = "${contextPath}/board/update";
//					});
					//목록 버튼을 눌렀을 때 처리
					$(".btn-primary").click(function(){
						location.href="${contextPath}/board/boardList";
					});	
				})
			</script>
		</div>
	</div>
</div>

<%@ include file="../includes/Bottom.jsp"%>