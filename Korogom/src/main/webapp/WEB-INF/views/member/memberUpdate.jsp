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

	<h2>회원 정보 수정</h2>
	<div class="row">
		<div class="col-sm-4">
			<div class="profile-img">
                <img src="../resources/images/dd.jpg" alt="test" class="rounded" width="100%"/>
               <div class="col-sm-12 file btn btn-sm btn-info">
                    Change Photo
                    <input type="file" name="file"/>
                </div>
            </div>
		</div>
		<div class="col-sm-8">                    
			<form id="upForm"  method="POST">
			<input type="hidden" id="mno" name="mno" value="${member.mno }"/>               
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mid">* 아이디:</label></td>
							<td>
							<input  type = "text" class = "form-control" id = "mid"
								name = "mid" value="${member.mid}"  readonly="readonly" /> 
								</td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mpass">비밀번호:</label></td>
							<td><input type="password" class="form-control" id="mpass"
								name="mpass" value="********" /> 
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mnick">* 별명:</label></td>
							<td><input  type="text" class="form-control" id="mnick"
								name="mnick"  value="${member.mnick}" readonly="readonly"/> 								
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mname">이름:</label></td>
							<td><input type="text" class="form-control" id="mname"
								 name="mname" value="${member.mname}" /> 
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label for="mmail">* 이메일 주소:</label> 
					<input  type="email"
						class="form-control" id="mmail" 
						name="mmail" value="${member.mmail}" />
				</div>
				<div class="form-group">
					<label for="mphone">* 연락처:</label> <input type="text"
						class="form-control" id="mphone" 
						name="mphone"  value="${member.mphone}" />
				</div>
				<div class="form-group">
					<label for="mbirth">생일:</label> <input  type="text"
						class="form-control" id="mbirth"
						name="mbirth" value="${member.mbirth}"/>						
				</div>
				
				
				<div class="form-group">
					<label for="mdel">성별:</label> 
					<input type="text" class="form-control" id="mdel" 
						name="mdel" value="${member.mdel}" />
						
				</div>			
				<button  type="submit" class="btn btn-primary">회원정보 수정</button>
				<button  type="button" class="btn btn-success">취소</button>
		</form>

		</div>
	</div>

</div>
<script>
	$(function(){
		//목록으로 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href= "myPage?mno=" + ${member.mno};
		});
	})
	</script>
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>