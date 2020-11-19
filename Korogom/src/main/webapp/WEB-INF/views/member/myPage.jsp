<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>
	
<div class="container">

	<h2>회원 정보</h2>
	<div class="row">
		<div class="col-sm-3">
			<div class="profile-img">
                <img src="../resources/images/dd.jpg" alt="test" class="rounded" width="100%"/>
               <div class="col-sm-12 file btn btn-sm btn-info">
                    Change Photo
                    <input type="file" name="file"/>
                </div>
            </div>
		</div>
		<div class="col-sm-9">
		<ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#">사용자 정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href='${pageContext.request.contextPath}/member/petMine?mno=${myinfo.mno}'>반려동물 정보</a>
	    </li>
	  </ul>                         
			<input type="hidden" id="mno" name="mno" value="${myinfo.mno }"/>        
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mid">* 아이디:</label></td>
							<td>
							<input  type = "text" class = "form-control" id = "mid"
								name = "mid" value="${myinfo.mid}"  readonly="readonly" /> 
								</td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mpass">* 비밀번호:</label></td>
							<td><input type="password" class="form-control" id="mpass"
								name="mpass" value="********" readonly="readonly" /> </td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mnick">* 별명:</label></td>
							<td><input  type="text" class="form-control" id="mnick"
								name="mnick"  value="${myinfo.mnick}" readonly="readonly"/> </td>								
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mname">* 이름:</label></td>
							<td><input type="text" class="form-control" id="mname"
								 name="mname" value="${myinfo.mname}" readonly="readonly" /> </td>
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label for="mmail">* 이메일 주소:</label> 
					<input  type="email"
						class="form-control" id="mmail" 
						name="mmail" readonly="readonly" value="${myinfo.mmail}" />
				</div>
				<div class="form-group">
					<label for="mphone">* 연락처:</label> <input type="text"
						class="form-control" id="mphone" 
						name="mphone" readonly="readonly" value="${myinfo.mphone}" />
				</div>
				<div class="form-group">
					<label for="mbirth">생일:</label> <input  type="text"
						class="form-control" id="mbirth"
						name="mbirth" readonly="readonly" value="${myinfo.mbirth}"/>						
				</div>								
				<div class="form-group">
					<label for="mdel">성별:</label> 
					<input type="text" class="form-control" id="mdel" 
						name="mdel" readonly="readonly" value="${myinfo.mdel}" />						
				</div>							
				<button type="submit" id="update" name="update" value="update" class="btn btn-primary">회원정보 수정</button>
				  <!-- Trigger the modal with a button -->
  				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">회원 탈퇴 </button>
			  <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h4 class="modal-title">회원 탈퇴 확인</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        <div class="modal-body">
				          <p>회원에서  탈되 하시겠습니까?<br/>
				          	기존 사용 하셨던 아이디는 관리자 확인 이후에 삭제되어 바로 사용 할 수 없는점 참고 바랍니다. </p>
				        </div>
				        <div class="modal-footer">
				          <button type="button"  id="delete" name="delete" class="btn btn-dark" data-dismiss="modal">회원 탈퇴</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				        </div>
				      </div>
				    </div>
				  </div>
				  <c:if test="${user.mclass == 3 }">
				<button type="button" id="tolist" name="tolist" value="tolist" class="btn btn-success">회원 목록</button>
				</c:if>				
		</div>
	</div>
</div>
<script>
	$(function(){
		//회원정보 수정을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="memberUpdate?mno=" + ${myinfo.mno};
		});
		//회원 탈퇴 버튼을 눌렀을 때 처리
		$(".btn-dark").click(function(){
			location.href="memberDelete?mno=" + ${myinfo.mno};
		});
		//목록으로 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href="memberPage";
		});
	})
	</script>
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>