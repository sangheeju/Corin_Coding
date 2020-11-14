<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
<%@ include file="../includes/top.jsp"%>
<script>

$(function(){
	//회원정보 수정을 눌렀을 때 처리
	$(".btn-primary").click(function(){
		location.href="petUpdate?pno=" + ${petdetail.pno};
	});
	//회원 탈퇴 버튼을 눌렀을 때 처리
	$(".btn-danger").click(function(){
		location.href="petDelete?pno=" + ${petdetail.pno};
	});
	//목록으로 버튼을 눌렀을 때 처리
	$(".btn-success").click(function(){
		location.href="petInfo";
	});
})

	$(document).ready(function(e){
		
		//파일 확장자 및 사이즈 확인
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf|txt|hwp|xlsx|doc)$");
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
		
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log("files로그 :"+files);		
			
			//add filedate to formdata
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name,files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);			
			console.log("로그 :"+formData);	
			}
			$(".uploadResult").show();
			$.ajax({
				url: "${contextPath}/upload/uploadAjaxAction",
				processData: false,
				contentType: false,
				data: formData,
					type:'POST',			
					success: function(result){
						console.log(result);	
						showUploadResult(result); //업로드 결과 처리 함수
					//	$(".uploadDiv").html(cloneObj.html());
				}
			}); // $.ajax		
		});
		
		
		$(".uploadResult").on("click","button",function(e){
			console.log("delete file");
			$(".uploadResult").hide();
			var targetFile = $(this).data("file");
			var type = $(this).data("type");			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '${contextPath}/upload/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
					success: function(result){
						alert(result);
						targetLi.remove();					 
					}
			}); //ajax end
		});		//end of delete	
	}); //end of document ready
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr||uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			//image type
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<style> .uploadResult{  border: 1px solid gray; background-color: lightgrey;} </style>";
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str += "><div>";
				str += "<span>" + obj.fileName + "</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times' styke='color:black'></i></button><br>";
				str += "<img src='${contextPath}/upload/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</li>";
			} else{
				var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid'"+obj.uuid+'"data-fileName="'+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span>"+ obj.fileName+"</span>"
				str += "<button type='button' data-type=\'"+fileCallPath+"\'data-type='file' "
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='${contextPath}/resources/images/attachment.png'></a>";
				str += "</div>";
				str += "</li>";	
			}
		});	
		
		uploadUL.append(str);	
		
		$(".btn-light").on("click", function(e){
			$(uploadResultArr).each(function(i, obj){
		 	var fileName = obj.fileName;
		 	var uuid = obj.uuid;
			var uploadPath = obj.uploadPath;
		 	var fileType = 1;
			var fileCallPath = encodeURIComponent(uploadPath+"/s_"+uuid+"_"+fileName);
//			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		 	var pno = $("#pno").val();
		 	
			var reqUrl = "${pageContext.request.contextPath}/member/insertPic";	
			
			var hideDiv = $(".uploadResult").hide();
 		 	var paramData = {
 		 			"uploadPath": uploadPath  ,
 		 			"uuid" : uuid ,
 		 			"fileName" : fileName ,
 		 			"fileType" : fileType ,
 		 			"pno" : pno  		 			
 		 			}; //요청데이터
 		 			
			$.ajax({
				url : reqUrl,
				type : "POST",
				dataType: 'text',
				data : paramData,
				success : function(upresult){	
					hideDiv;
					$("#profilePic").attr("src", "${contextPath}/upload/display?fileName="+fileCallPath);
													   
				},
				error: function(upresult){
		        	alert("파일 업로드에 문제가 있습니다.");
		        }
			});
			});	
			});
	}	
</script>
<div class="container">

	<h2>반려동물 정보확인</h2>
	<div class="row">
		<div class="col-sm-3">
			<img id="profilePic" src="../resources/images/dd.jpg" class="rounded" alt="test"
				width="100%" />
			<hr>
			
			<!-- 사진 업로드 구간 -->
<div class="panel panel-default">
	<div class="panel-heading">File Attach</div>
	<!--  /.panel-heading -->
	<div class="panel-body">
		<div class="form-group uploadDiv">
			<input type="file" name='uploadFile' multiple />
		</div>
		<div class='uploadResult' >
			<ul>
				
			</ul>
		</div>		
		<button style="float: right" type="button" class="btn btn-light">Save</button>
	</div>
</div> <!-- end of Panel -->

		</div>
		<div class="col-sm-9">
			<input type="hidden" id="mno" name="mno" value="${petdetail.mno }" />
			<input type="hidden" id="pno" name="pno" value="${petdetail.pno }" />
			<div class="form-group">
				<table>
					<tr>
						<td><label for="pdiv">반려동물 종류:</label></td>
						<td><input type="text" class="form-control" id="pdiv"
							value="${petdetail.pdiv}" name="pdiv" readonly="readonly" /></td>
					</tr>
				</table>
			</div>
			<div class="form-group">
				<table>
					<tr>
						<td><label for="pname">* 반려동물 이름: </label></td>
						<td><input type="text" class="form-control" id="pname"
							value="${petdetail.pname}" name="pname" readonly="readonly"
							/></td>
					</tr>
				</table>
			</div>
			<div class="form-group">
				<label for="pbirth">생일:</label> <input type="date"
					class="form-control" id="pbirth" readonly="readonly"
					value="${petdetail.pbirth}" name="pbirth">
			</div>
			<div class="form-group">
				<table>
					<tr>
						<td><label for="pnum"> 등록번호:</label></td>
						<td><input type="text" class="form-control"
							id="pnum" readonly="readonly" value="${petdetail.pnum}" name="pnum" /></td>
					</tr>
				</table>
			</div>
			<div class="form-group">
				<label for="pdel">반려동물 성별:</label> 		
				<input type="text" class="form-control"
							id="pdel" readonly="readonly" value="${petdetail.pdel}" name="pdel" />					
			</div>
			<button type="submit" class="btn btn-primary">반려동물 정보 수정</button>
			  <!-- Trigger the modal with a button -->
  				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">반려동물 삭제</button>
			  <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h4 class="modal-title">반려동물 삭제</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        <div class="modal-body">
				          <p>반려동물을 삭제합니다<br/>
				          	반려동물 삭제시 사용 이력도 같이 삭제됩니다. </p>
				        </div>
				        <div class="modal-footer">
				          <button type="button"  id="delete" name="delete" class="btn btn-danger" data-dismiss="modal">반려동물 삭제</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				        </div>
				      </div>
	
		</div>
	</div>
	<button type="button" id="tothelist" name="tothelist" value="tothelist" class="btn btn-success">펫 목록</button>
</div>
</div>
</div>

<!-- bottom -->
<%@ include file="../includes/bottom.jsp"%>

<!-- footer -->
<%@ include file="../includes/footer.jsp"%>