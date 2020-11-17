<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>
<script>
		$(document).ready(function(e){
			
		$(function(){
			//목록으로 버튼을 눌렀을 때 처리
			$(".btn-success").click(function(){
				location.href= "petPage?pno=" + ${pet.pno};
			});		
//			$(".btn-primary").click(function(){
	//			location.href= "petUpdate";
		//	});		
		});
		
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
	}); //end of document ready
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr||uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var formfile = $("#filedata");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			//image type
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				$("#profilePic").attr("src", "${contextPath}/upload/display?fileName="+fileCallPath);
				$("#profilePic").attr("data-path", obj.uploadPath);
				$("#profilePic").attr("data-uuid", obj.uuid);
				$("#profilePic").attr("data-fileName", obj.fileName);
				$("#profilePic").attr("data-type", obj.image);
				str += "<input type='hidden' name='uuid' value='"+obj.uuid+"'>";
				str += "<input type='hidden' name='uploadPath' value='"+obj.uploadPath+"'>";
				str += "<input type='hidden' name='fileName' value='"+obj.fileName+"'>";
				str += "<input type='hidden' name='fileType' value='"+obj.image+"'>";
				formfile.append(str);
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
	}	
</script>

<div class="container">

	<h2>반려동물 종류 수정</h2>
	<div class="row">
		<div class="col-sm-4">
			<div class="bigPictureWrapper">
				<c:choose>
					<c:when test="${profilePic.uuid == null}">
						<img id="profilePic" data-path="" data-uuid="" data-fileName="" data-type="" src="../resources/images/dd.jpg" class="rounded" alt="test"
							width="100%" />
					</c:when>
					<c:when test="${profilePic.uuid != null}">
						<img id="profilePic" src='"${contextPath}/upload/display?fileName="+fileCallPath' class="rounded" alt="test"
								width="100%" />
					</c:when>
				</c:choose>		
			</div>
			<hr>${profilePic.uuid }
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
				</div>
			</div> <!-- end of Panel -->

		</div>
		<div class="col-sm-8">	
			<input type="hidden" id="uuid" name="uuid" value="${profilePic.uuid }"/>  
		<form action="petUpdate" method="POST" id="petUp">
			<input type="hidden" id="mno" name="mno" value="${user.mno }" />
			<input type="hidden" id="pno" name="pno" value="${pet.pno }" />
				<div class="form-group">
					<label  for="pdiv">반려동물 종류:</label> 
						<input type="hidden" class="form-control" id="pdiv" name="pdiv" value="${pet.pdiv }"/>
						<c:choose>
							<c:when test="${pet.pdiv eq '1'}" >개</c:when>
							<c:when test="${pet.pdiv eq '2'}">고양이</c:when>
						</c:choose>
					</div>
						<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="pname">* 반려동물 이름: </label>
								<input type="text" class="form-control" id="pname" name="pname" value="${pet.pname}" />	* 영문과 한글만 사용가능 합니다.
							</td>
						</tr>
					</table>
					</div>
					<div class="form-group">
					<label for="pbirth" >생일:</label> <input type="date"
						class="form-control" id="pbirth" value="${pet.pbirth}"
						name="pbirth">
						</div>
				<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="pnum"> 등록번호:</label> 
							</td>
							<td>
								<input type="text" 
									class="form-control" id="pnum"
									value="${pet.pnum}" name="pnum" />						
							</td>					
							<td><p>* 숫자만 사용가능 합니다. </p></td>
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label  for="pdel">반려동물 성별:</label> 
					<input type="hidden" class="form-control" id="pdel"value="${pet.pdel}" name="pdel" />
					<select class="form-control" id="pdel" name="pdel">
						<option value="1">암컷</option>
						<option value="2">수컷</option>
						<option value="3">암컷 중성화 완료</option>
						<option value="4">수컷 중성화 완료</option>
					</select>				
				</div>
				<div id ="filedata"></div>
				<button type="submit" class="btn btn-primary">정보 수정</button>				
				<button type="button" class="btn btn-success">취소</button>
				</form>
				
			</div>
		</div>
	</div>
	

	<!-- bottom -->
<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>