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
</script>
<div class="container">

	<h2>반려동물 정보확인</h2>
	<div class="row">
		<div class="col-sm-3">
			<img id="profilePic" src="${contextPath}/upload/display?fileName='${photoDao.uploadPath }+'/'+${photoDao.uuid }+'_'+${photoDao.fileName }" class="rounded" alt="test"
				width="100%" />
			<hr>
		</div>
		<div class="col-sm-9">
			<input type="hidden" id="mno" name="mno" value="${petdetail.mno }" />
			<input type="hidden" id="pno" name="pno" value="${petdetail.pno }" />
			<div class="form-group">
				<table>
					<tr>
						<td><label for="pdiv">반려동물 종류:</label></td>
						<td><input type="text" class="form-control" id="pdiv"
							value="<c:choose><c:when test="${petdetail.pdiv eq '1'}">개</c:when><c:when test="${petdetail.pdiv eq '2'}">고양이</c:when></c:choose>" name="pdiv" readonly="readonly" /></td>
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
							id="pdel" readonly="readonly" value="<c:choose><c:when test="${petdetail.pdel eq '1'}">여아 </c:when><c:when test="${petdetail.pdel eq '2'}"> 남아 </c:when><c:when test="${petdetail.pdel eq '3'}"> 중성화 한 여아 </c:when><c:when test="${petdetail.pdel eq '4'}"> 중성화 한 남아 </c:when></c:choose>" name="pdel" />					
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