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
	$(document).ready(function(e){
		var formObj = $("form[role='form']");
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			
			var str = "";
			$(".uploadResult ul li").each(function(i,obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
				console.log("나오나?"+str)
			});
			formObj.append(str).submit();
		});
		
		//업로드시 필요한 코드
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
		});
	});
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr||uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			//image type
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
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
	}	
	
	
</script>

<div class="container">

	<h2>반려동물 등록</h2>
	<div class="row">
		<div class="col-sm-4">
<img src="../resources/images/dd.jpg" class="rounded" alt="test" width="100%" />
<hr>

<!-- 사진 업로드 구간 -->
<div class="panel panel-default">
	<div class="panel-heading">File Attach</div>
	<!--  /.panel-heading -->
	<div class="panel-body">
		<div class="form-group uploadDiv">
			<input type="file" name='uploadFile' multiple>
		</div>
		<div class='uploadResult'>
			<ul>
				
			</ul>
		</div>		
	</div>
</div> <!-- end of Panel -->
</div>
		<div class="col-sm-8">
<form:form modelAttribute="petDAO" method="POST" id="pregister" name="pregister">
		<input type="hidden" id="mno" name="mno" value="${user.mno }"/>
				<div class="form-group">
					<label  for="pdiv">반려동물 종류:</label> 
					<form:select path="pdiv" class="form-control" id="pdiv" name="pdiv">
						<form:option value="1">견(Dog)</form:option>
						<form:option value="2">묘(Cat)</form:option>
					</form:select>
					</div>
						<div class="form-group">
					<table>
						<tr>
							<td><label for="pname">* 반려동물 이름: </label></td>
							<td><form:input type="text" class="form-control" id="pname" path="pname"
								name="pname" placeholder="ID를 입력하세요" size="20" maxlength="20"/>	
							</td>
							<td><div class="checkId" id="idCheck"><p>* 영문과 한글만 사용가능 합니다.</p><form:errors path="pname" /></div></td>
						</tr>
					</table>
					</div>
					<div class="form-group">
					<form:label for="pbirth" path="pbirth">생일:</form:label> <input type="date"
						class="form-control" id="pbirth" placeholder="이벤트 응모를 위해 사용됩니다"
						name="pbirth">
						</div>
				<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="pnum"> 등록번호:</label> 
							</td>
							<td>
								<form:input type="text" path="pnum"
									class="form-control" id="pnum"
									placeholder="등록 번호를 입력하세요." name="pnum" />						
							</td>					
							<td><p>* 숫자만 사용가능 합니다. </p></td>
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label  for="pdel">반려동물 성별:</label> 
					<form:select path="pdel" class="form-control" id="pdel" name="pdel">
						<option value="1">암컷</option>
						<option value="2">수컷</option>
						<option value="3">암컷 중성화 완료</option>
						<option value="4">수컷 중성화 완료</option>
					</form:select>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> * 기재 해 주신 정보는 당 사이트에서 본인
						확인과 이벤트 참여 목적으로만 수집되며 그 외 용도로는 사용되지 않습니다. 해당 내용을 확인 하셨습니까?
						<br>
					<input class="form-check-input" type="checkbox" value="1" id="petc" name="petc" required /><br />
					<kbd>확인!</kbd>					
					</label>
				</div>
				
				<form:button type="submit" class="submit btn btn-primary">반려동물 등록하기</form:button>
				</form:form>
			</div>
		</div>
	</div>
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>