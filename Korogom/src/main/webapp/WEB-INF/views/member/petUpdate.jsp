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
		});
	});

	
</script>

<div class="container">

	<h2>반려동물 등록</h2>
	<div class="row">
		<div class="col-sm-4">
<img src="../resources/images/dd.jpg" class="rounded" alt="test" width="100%" />
<hr>
</div>
		<div class="col-sm-8">
<form  method="POST" id="petUp">
		<input type="hidden" id="mno" name="mno" value="${user.mno }"/>
				<div class="form-group">
					<label  for="pdiv">반려동물 종류:</label> 
										<input type="text" class="form-control" id="pdiv" 
								name="pdiv" value="${pet.pdiv}" />
					</div>
						<div class="form-group">
					<table>
						<tr>
							<td><label for="pname">* 반려동물 이름: </label></td>
							<td><input type="text" class="form-control" id="pname" 
								name="pname" value="${pet.pname}" />	
							</td>
							<td><div class="checkId" id="idCheck"><p>* 영문과 한글만 사용가능 합니다.</p></div></td>
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
					<input type="text" class="form-control" id="pdel"
							value="${pet.pnum}" name="pdel" />						
				</div>
				
				<button type="submit" class="submit btn btn-primary">반려동물 정보 수정</button>
				<button  type="button" class="btn btn-success">취소</button>
				
				</form>
			</div>
		</div>
	</div>
	

	<!-- bottom -->
<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>