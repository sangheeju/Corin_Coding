<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Reservation Board</title>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h2>Reservation Board</h2>
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
                  		<td><a class='move' href='/reservation/resv_detail${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno}'><c:out value="${board.btitle }"/></a></td>
                  		<td><c:out value="${board.mno }"/></td>
                  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.bdate }"/></td>
                  		<td><c:out value="${board.bcnt}"/></td>
                  	</tr>
                  </c:forEach>
	</table>
	<div>            
    	<a href='/reservation/resv_register' onClick='fn_write()' class="btn btn-success">글쓰기</a>
    </div>
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
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목 OR 내용</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용 OR 회원번호</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목 OR 내용 OR 회원번호</option>
		</select>
		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
		<button id='searchBtn'>Search</button>
	</div>
    <div class='text-center'>
    	<ul class="pagination">
    		<c:if test="${pageMaker.prev }">
    			<li class="paginate_button previous"><a href="resv_board${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
    			</li>
    		</c:if>
    		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
    			<li class="paginate_button" <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
    				<a href="resv_board${pageMaker.makeSearch(num)}">${num}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li class="paginate_button next" ><a href="resv_board${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    		</c:if>
    	</ul>
    	
    </div>
    </div>
</div>
<script>
	$(document).ready(function(){
		$('#searchBtn').on("click",function(event){
			self.location = "resv_board"
			+'${pageMaker.makeQuery(1)}'
			+"&searchType="
			+$("select option:selected").val()
			+"&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
<!-- 
    	<form id='actionForm' action="/reservation/resv_board/" method='get'>
    		<input type='hidden' name='page' value='${pageMaker.cri.page}'>
    		<input type='hidden' name='perPageNum' value='${pageMaker.cri.perPageNum}'>
    	</form>
    	 -->
<!-- 
<script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>
 -->
<!-- Modal -->
<!-- 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-tilte" id="myModalLabel">Modal tilte</h4> 
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
    <script>
    $(document).ready(function(){
    	var result = '<c:out value="${result}"/>';
    	
    	checkModal(result);
    	
    	function checkModal(result){
    		if(result === ''){
    			return;
    		}
    		if(parseInt(result)>0){
    			$(".modal-body").html("게시글 "+ parseInt(result) +"번이 등록되었습니다.");
    		}
    		$("#myModal").modal("show");
    	}
    });
    </script>
     -->
</body>
</html>