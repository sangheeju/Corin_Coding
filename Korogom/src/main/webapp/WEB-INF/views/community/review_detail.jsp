<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />

<div class="row">
	<div class="col-lg-12">
		<h2>Review Board detail</h2>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<div class="panel-body">
				<form role="form" action="/review_modify" method="post">
					<div class="form-group">
						<label>번호</label>
						<input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly">
						<label>별점</label>
						<p class="star_rating">
    						<a href="#" id='1'>★</a>
    						<a href="#" id='2'>★</a>
    						<a href="#" id='3'>★</a>
    						<a href="#" id='4'>★</a>
    						<a href="#" id='5'>★</a>
    					</p>
    					<input type="hidden" name="bscore" value='<c:out value="${board.bscore }"/>'>
					</div>
					<div class="form-group">
						<label>회원번호</label>
						<input class="form-control" name="mno" value='<c:out value="${board.mno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="btitle" value='<c:out value="${board.btitle }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="bcon" readonly="readonly"><c:out value="${board.bcon }"/></textarea>
					</div>
					<div class="form-group">
						<label>비고</label>
						<input class="form-control" name="betc" value='<c:out value="${board.betc }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" name="bsort" value="1">
					</div>
				</form>
					<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
			  	 	<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			   	 	<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
				<form role="form" action="modifyPage" method="post">
						<input type='hidden' name='bno' value="${board.bno }">
						<input type='hidden' name='page' value="${cri.page }">
						<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
						<input type='hidden' name='searchType' value="${cri.searchType }">
						<input type='hidden' name='keyword' value="${cri.keyword }">
				</form>
			</div>
		</div>
	</div>
</div>
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
		
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<!--  panel -->
		<div class="panel panel-default">
			<div class="panel-heading">Files</div>
			<div class='panel-body'>
				<div class='uploadResult'>
					<ul>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<!--  panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
			 <i class="fa fa-comments fa-fw"></i> 댓글 목록
			 	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			 
			 
			<!-- panel-heading -->
			<div class="panel-body">
				<ul class="chat" style="list-style: none; padding-left: 0px;">
					<!-- Start reply -->
					<!-- End reply -->
				</ul>
			</div>
			<!-- panel-footer -->
			<div class="panel-footer"></div>
		</div>
	</div>
</div>
<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name='rewriter' value='rewriter'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<input class="form-control" name='recon' value='recon'>
					</div>
					<div class="form-group">
						<label>작성일</label>
						<input class="form-control" name='regdate' value=''>
					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button id='modalClassBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/community/review_modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/community/review_remove");
		formObj.submit();
	});
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/community/review_board");
		formObj.submit();
	});
});
</script>
<script>
$(document).ready(function(){
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
		showList(1);
		
	function showList(page2){
		console.log("show list "+page);
		
		replyService.getList({bno:bnoValue,page: page|| 1},function(replyCnt,list){
			
				console.log("replyCnt : "+replyCnt);
				console.log("list : "+list);
				console.log(list);
				
				if(page2 == -1){
					page = Math.ceil(replyCnt/10.0);
					showList(page);
					return;
				}
			
			var str="";
			if(list == null || list.length == 0){
				return;
			}
			for(var i = 0,len = list.length || 0; i<len;i++){
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="<div><div class='header'><strong class='primary-font'>"+list[i].rewriter+"</strong>";
				str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].regdate)+"</small></div>";
				str +="<p>"+list[i].recon+"</p></div></li><hr>";
			}
				replyUL.html(str);
				showReplyPage(replyCnt);
		});
	}
	var page = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(page / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt){
			next = true;
		}
		var str = "<ul class='bpaging'>";
		
		if(prev){
			str += "<li class='pbutton'><a class='pnum' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = page == i? "_active":"";
			str += "<li class='pbutton'><a class='pnum"+active+"' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str += "<li class='pbutton'><a class='pnum' href='"+(endNum+1)+"'>Next</a></li>'";
		}
		str += "</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log(page);
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : "+targetPageNum);
		page = targetPageNum;
		showList(page);
	});

	var modal = $(".modal");
	var modalInputRecon = modal.find("input[name='recon']");
	var modalInputRewriter = modal.find("input[name='rewriter']");
	var modalInputRegdate = modal.find("input[name='regdate']")
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    });
	$("#addReplyBtn").on("click",function(e){
		modal.find("input").val("");
		modalInputRegdate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal('show');	
		
	});
	modalRegisterBtn.on("click",function(e){
			var reply = {
					recon: modalInputRecon.val(),
					rewriter:modalInputRewriter.val(),
					bno:bnoValue
			};
		replyService.add(reply, function(result){
			alert("댓글이 등록되었습니다.");
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1);
	});
});
	$(".chat").on("click","li",function(e){
		
		var rno = $(this).data("rno");
		console.log(rno);
		
		replyService.get(rno, function(reply){
			console.log(reply.recon);
			modalInputRewriter.val(reply.rewriter);
			modalInputRecon.val(reply.recon);
			modalInputRegdate.val(replyService.displayTime(reply.regdate)).attr("readonly","readonly");
			modal.data("rno",reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal('show');
		});
	});
	modalModBtn.on("click",function(e){
		var reply = {rno:modal.data("rno"),rewriter:modalInputRewriter.val(),recon:modalInputRecon.val()};
		
		replyService.update(reply,function(result){
			alert("수정 완료");
			modal.modal("hide");
			showList(page);
		});
	});
	modalRemoveBtn.on("click", function (e){
	  	  var rno = modal.data("rno");
	  	console.log(rno);
	  	  
	  	  replyService.remove(rno, function(result){
	  	      alert("삭제 완료");
	  	      modal.modal("hide");
	  	      showList(page);
	  	  });  	  
	});
});
</script>
<script>
$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/reservation/getAttachList",{bno: bno}, function(arr){
			console.log("file")
			console.log("arr : "+arr);
			var str = "";
			
			$(arr).each(function(i, attach){
				if(attach.fileType){
					var fileCallPath = encodeURIComponent( attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<a>'"+attach.fileName+"'</a>";
					str += "</div>";
					str += "</li>";
					
				}
			});
			$(".uploadResult ul").html(str);
		});
	})();
});
</script>
<script>
// 이미지 확대 축소
	$(".uploadResult").on("click","li",function(e){
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			//file download
			self.location = "/download?fileName="+path
		}
		function showImage(fileCallPath){
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%',height:'100%'},1000);
		}
	});
	$(".bigPictureWrapper").on("click",function(e){
		$(".bigPicture").animate({width:'0%',height:'0%'}, 1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		}, 1000);
	});
</script>
<script>
	$( document ).ready(function() {
		var bscore = '<c:out value="${board.bscore}"/>';
		var score = $(".star_rating").find("#"+bscore);
		$(score).addClass("on").prevAll("a").addClass("on");
		console.log(bscore+"점");
	});
</script>
<script>
$(function(){
	CKEDITOR.replace('bcon',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/adm/fileupload.do'
	});
});
</script>
</body>
</html>