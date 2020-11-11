<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
	width:100%
	background-color:gray;
}
.uploadResult ul {
	display:flex;
	flex-flow:row;
	justify-content: center;
	align-items:center;
}
.uploadResult ul li {
	list-style: none;
	padding: 2px;
}
.uploadResult ul li img{
width: 100px;
}

</style>
</head>
<body>

아작스
<div class="uploadDiv"> 
	<input type="file" name="uploadFile" multiple>
</div>
<div class='uploadResult'>
<ul>
</ul>
</div>
<button id="uploadBtn">Upload</button>

<script src="http://code.jquery.com/jquery-3.3.1.min.js" 
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
crossorigin="anonymous"> </script>

<script>
$(document).ready(function(){
	
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(function(i, obj){
					if (!obj.image) {
						
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						str += "<li> <a href='${pageContext.request.contextPath}/upload/download?fileName="+fileCallPath+"'>"
								+"<img src='${pageContext.request.contextPath}/resources/images/attachment.png'>"
							+ obj.fileName + "</a></li>"				
					} else {
						//str +="<li>"+obj.fileName + "</li>";
						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid+"_"+obj.fileName);
						str += "<li><img src='${pageContext.request.contextPath}/upload/display?fileName="+fileCallPath+"'></li>";
					}
		});
		uploadResult.append(str);
	}
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB

	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		console.log("files로그 :"+files);		
		
		//add filedate tp formdata
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);			
		console.log("로그 :"+formData);	
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/upload/uploadAjaxAction",
			processData: false,
			contentType: false,
			data: formData,
				type:'POST',
		
				success: function(result){
					console.log(result);	
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html());
			}
		}); // $.ajax		
	});
});
</script>
</body>
</html>