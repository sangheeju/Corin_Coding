<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- Header -->
<%@ include file="../includes/Header.jsp"%>
<!-- NavTop -->
<%@ include file="../includes/NavTop.jsp"%>
<style>
div {
  text-align: left;
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	replylist()
	
	// 댓글 쓰기
	$(document).on('click', '#replyBtn', function(){
		var rememo = $("#rememo").val();
		var rewriter = $("#rewriter").val();
		
		var url = "${contextPath}/board/addreply";  // controller
		var paramData = {
				"rewriter" : rewriter,
				"rememo" : rememo,
				"bno" : '${board.bno}'
		};
		$.ajax({
			type : "POST",
			url : url,
			data : paramData,
			dataType : 'json',
			
			success : function(result){
				replylist();
				
				$("#rememo").val('');
				$("#rewriter").val('');
			},
			error : function(data){
				console.log(data);
				alert("에러가 발생했습니다."+data)
			}
			
		});
		
	}); // 댓글 쓰기 end
});
function replylist(){
	var reqUrl = "${contextPath}/board/listreply"
	var paramData = {"bno":"${board.bno}"};
	
	$.ajax({
		url : reqUrl,
		data : paramData,
		dataType : 'json',
		type : 'POST',
		success : function(result){
			var htmls = "";
			if (result.length < 1){
				htmls = htmls + ("<h4>등록된 댓글이 없습니다.</h4>")
			} else {
				$(result).each(function(){
					htmls = htmls + '<div class="" id="reno'+this.reno+'">';
					htmls += '<span class="d-block">';
					htmls += this.reno + ' - ';
					htmls += '<strong class"text-gray-dark">' + this.rewriter + '</strong>';
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';
					htmls += '<a href="javascript:void(0)" onclick="fn_editReply('+this.reno+',\''+this.rewriter+'\',\''+this.rememo+'\')" style="padding-right:5px">수정</a>';
					htmls += '<a href="javascript:void(0)" onclick="fn_delReply('+this.reno+')">삭제</a>';
					htmls += '</span>';
					htmls += '</span><br />';
					htmls += this.rememo;
					htmls += '</p>';
					htmls += '</div>';
				});
			$("#replylist").html(htmls);
			}
		},
		error : function(data){
			alert("에러가 발생했습니다."+data)
		}
	});
} //replylist() end
function fn_editReply(reno, rewriter, rememo){ // 수정할 내용 불러오기
	var htmls = "";
	htmls = htmls + '<div class="" id="reno'+reno+'">';
	htmls += '<span class="d-block">';
	htmls += reno + ' - ';
	htmls += '<strong class"text-gray-dark">' + rewriter + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_editReply('+reno+',\''+rewriter+'\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onclick="replylist()">취소</a>';
	htmls += '</span>';
	htmls += '</span><br />';
	htmls += '<textarea name="editmemo" id="editmemo" class="form-control" rows="3">'
	htmls += rememo;
	htmls += '</textarea>';
	htmls += '</p>';
	htmls += '</div>';
	
	$('#reno'+reno).replaceWith(htmls);
	$('#reno'+reno+'#editmemo').focus();
} //fn_editReply end;

function fn_updateReply(){}

</script>

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
						<input type='hidden' name='mid' value=' ${user.mid }' />
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
				$(function() {
					//메인 버튼을 눌렀을 때 처리
					$(".btn-success").click(function() {
						location.href = "../";
					});
					//목록 버튼을 눌렀을 때 처리
					$(".btn-primary").click(function() {
						location.href = "${contextPath}/board/boardList";
					});
					//삭제 버튼을 눌렀을 때 처리
					$(".btn-danger").click(function() {
						location.href = "${contextPath}/board/delete?bno=" + ${board.bno};
					});
					//수정 버튼을 눌렀을 때 처리
					$(".btn-warning").click(function() {
						location.href = "${contextPath}/board/update?bno=" + ${board.bno};
					});		
				})
			</script>
			<div class="box-body">
				<table>
						<tr>
							<td rowspan="2" width="80%">
								<textarea name="rememo" id="rememo" placeholder="댓글을 입력하세요" class="form-control"></textarea>

							</td>
							<td><br/></td>
							<td>
								<input type="text" name="rewriter" id="rewriter" value='${user.mid}' readonly >

							</td>
						</tr>
						<tr>
							<td><br/></td>
							<td>
								<button type="button" id="replyBtn">저장</button>
							</td>
						</tr>
				</table>
			</div>	
			<hr>
			<div id="replylist"></div>	
		</div>
	</div>
</div>
<%@ include file="../includes/Bottom.jsp"%>