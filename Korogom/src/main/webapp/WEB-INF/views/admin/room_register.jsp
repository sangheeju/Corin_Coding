<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<div class="row">
	<div class="col-lg-12">
		<h2>Room Register</h2>
	</div>
</div>
<div class="row">
	<div class="col-lg-1">
		Slide
	</div>
	<div class="col-lg-10">
		<form role="form" action="/admin/room_register" method="post">
            <div class="form-group">
              <label for="roomno">호수</label>
              <input type="text" class="form-control" placeholder="Enter Roomno" name="roomno" required="required">
            </div>
            <div class="form-group" id="street">
              <label for="roomprice">가격</label>
              <input type="text" class="form-control" placeholder="Enter Roomprice" name="roomprice" required="required">
            </div>
            <div class="form-group">
            	<label for="roomtype">타입</label>
              	<input type="radio" name="roomtype" value="1">동반
              	<input type="radio" name="roomtype" value="2">개
             	<input type="radio" name="roomtype" value="3">고양이
            </div>
            <div class="form-group">
            	<label for="roomcontent">설명</label>
            	<textarea rows="5" cols="30" name="roomcontent"></textarea>
            </div>
            <div class="form-group">
            	<label for="roomcnt">숙박가능 동물 수</label>
            	<input type="text" class="form-control" placeholder="Enter count" name="roomcnt" required="required">
            </div>
            <div class="form-group">
            	<label for="roometc">비고</label>
            	<input type="text" class="form-control" placeholder="Enter etc" name="roometc">
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-danger">초기화</button>
         </form>
         <div class="form-group">
            	<label for="roomphoto">사진</label>
            	<input type="file" name="roomphoto" multiple><p style="font-size:8px">이미지 파일만 등록하세요</p>
            	<div class="uploadResult">
            		<ul>
            			
            		</ul>
            	</div>
        </div>
	</div>
	<div class="col-lg-1">
		Slide
	</div>
</div>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			str += "<input type='hidden' name='imglist["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      	str += "<input type='hidden' name='imglist["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      	str += "<input type='hidden' name='imglist["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		});
		formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
	var maxSize = 10485760; //10MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='roomphoto']");
		var files = inputFile[0].files;
		for(var i = 0; i <files.length; i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		$.ajax({
			url: '/imguploadAjaxAction',
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
				if(obj.image){
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					
					str += "<li data-path='"+obj.uploadPath+"'";
					str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'><div>";
					str += "<span> "+obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-danger'>";
					str += "<i class='fa fa-times'></i></button><br><img src='/display?fileName="+fileCallPath+"'>";
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