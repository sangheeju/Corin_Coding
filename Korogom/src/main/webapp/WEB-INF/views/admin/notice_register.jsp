<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />

<div class="row">
	<div class="col-lg-12">
		<h2>Notice Board Register</h2>
	</div>
</div>
<div class="row">
	<div class="col-lg-2">
		<div id='navi' class="cnav">
      		<ul>
        		<li><a href="/member/memberPage">회원 관리</a></li>
        		<li><a href="/admin/reservation_list">예약 목록</a></li>
        		<li><a href="/admin/notice_board">공지사항 등록</a></li>
        		<li><a href="/admin/qna_board">Q&A 등록</a></li>
        		<li><a href="/admin/room_register">객실 등록</a></li>
      		</ul>
    	</div>
	</div>
	<div class="col-lg-10">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<div class="panel-body">
				<form role="form" action="/admin/notice_register" method="post">
					<div class="form-group">
						<label>제목</label><input class="form-control" name="btitle">
    					<input type="hidden" name="bscore" value="0">
    				</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="bcon"></textarea>
					</div>
					<div class="form-group">
						<label>비고</label><input class="form-control" name="betc">
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" name="bsort" value="3">
						<input type="hidden" class="form-control" name="mno" value="0">
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger">초기화</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일 첨부</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
<script>
$(document).ready(function() {

	var formObj = $("form[role='form']");
	
	  $("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });
	  
	  $("button[type='reset']").on("click", function(e){
			var off = $(".star_rating a");
			$(off).parent().children("a").removeClass("on");
			$("input[name=bscore]").val(0);
		});
	  
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
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
					str += "<i class='fa fa-times'></i></button><br><img src='/resources/img/Attach.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			});
			uploadUL.append(str);
		}
	$(".uploadResult").on("click","button",function(e){
		console.log("delete file");
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile,type:type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert("삭제 완료");
				targetLi.remove();
			}
		});
	});
});
</script>
</body>
</html>