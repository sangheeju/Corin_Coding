<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<div class="row">
	<div class="col-lg-12">
		<h2>Notice Board detail</h2>
	</div>
	
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default"> q	
			<div class="panel-heading">Board Read Modify</div>
			<div class="panel-body">
				<form role="form" action="/admin/notice_modify" method="post">
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
						<input class="form-control" name="btitle" value='<c:out value="${board.btitle }"/>'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="bcon"><c:out value="${board.bcon }"/></textarea>
					</div>
					<div class="form-group">
						<label>비고</label>
						<input class="form-control" name="betc" value='<c:out value="${board.betc }"/>'>
					</div>
					<div class="form-group">
						<input type="hidden" name="bsort" value="1">
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
						<input type="hidden" name="searchType" value="${cri.searchType }">
						<input type="hidden" name="keyword" value="${cri.keyword }">						
					</div>
				</form>
					<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info">게시판 이동</button>
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
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
				<div class='uploadResult'>
					<ul>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {

	var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/admin/notice_remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/admin/notice_board").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
      }
  
	    formObj.submit();
	  });

});
</script>
<script>
// 첨부파일
$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/introduce/getAttachList",{bno: bno}, function(arr){
			console.log("file")
			console.log("arr : "+arr);
			var str = "";
			
			$(arr).each(function(i, attach){
				if(attach.fileType){
					// image type
					var fileCallPath = encodeURIComponent( attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span> "+attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-danger'>";
					str += "<i class='fa fa-times'></i>X</button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					str += "<span> "+attach.fileName+"</span><br>";
					str += "<a>'"+attach.fileName+"'";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-danger'>X</button>";
					str += "<img src='/resources/img/Attach.png'></a>"
					str += "</div>";
					str += "</li>";
					
				}
			});
			$(".uploadResult ul").html(str);
		});
		$(".uploadResult").on("click","button", function(e){
			console.log("delete file");
			
			if(confirm("파일을 삭제하시겠습니까? ")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
	})();
});
</script>
<script>
$(document).ready(function(e){
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880 //5MB;
	
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
	
	for(var i = 0; i <files.length; i++){
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}
		formData.append("uploadFile",files[i]);
	}
	$.ajax({
		url: '/uploadAjaxAction',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		dataType:'json',
		success: function(result){
			console.log(result);
			showUploadResult(result);
		}
	});
});
function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			// image type
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'><div>";
				str += "<span> "+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-danger'>";
				str += "<i class='fa fa-times'></i></button><br><img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</li>";
			}else{
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span> "+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-danger'>";
				str += "<i class='fa fa-times'></i></button><br><img src='/resources/img/eagle.jpg'></a>";
				str += "</div>";
				str += "</li>";
			}
		});
		uploadUL.append(str);
	}
});
</script>
<script>
	$( document ).ready(function() {
		var bscore = '<c:out value="${board.bscore}"/>';
		var score = $(".star_rating").find("#"+bscore);
		$(score).addClass("on").prevAll("a").addClass("on");
		console.log(bscore+"점");
		$( ".star_rating a" ).click(function() {
			var getId=$(this).attr("id");
	    	$(this).parent().children("a").removeClass("on");
	   		$(this).addClass("on").prevAll("a").addClass("on");
	    	console.log(getId);
	    	$("input[name=bscore]").val(getId);
	    	console.log(getId+"점");
	    	return false;
		});
	});
</script>
</body>
</html>