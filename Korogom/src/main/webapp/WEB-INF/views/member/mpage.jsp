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
                <div class="file btn btn-lg btn-primary">
                    Change Photo
                    <input type="file" name="file"/>
                </div>
            </div>
		</div>
		<div class="col-sm-9">
		<div class="col-md-10"></div>
		<div class="col-md-2">
<input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                    </div>
			<form:form modelAttribute="memberDAO" method="POST"
				action="${ pageContext.servletContext.contextPath }/member/mregister"  id="regForm">
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mid">* 아이디:</label></td>
							<td>
							<form:input path = "mid" type = "text" class = "form-control" id = "mid"
								name = "mid" placeholder = "ID를 입력하세요" value="${myinfo.mid}"  readonly="readonly" /> 
								</td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mpass">* 비밀번호:</label></td>
							<td><form:input path="mpass" type="password" class="form-control" id="mpass"
								placeholder="비밀번호를 입력하세요" name="mpass" value="${myinfo.mpass}" readonly="readonly" /> 
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mnick">* 별명:</label></td>
							<td><form:input path="mnick" type="text" class="form-control" id="mnick"
								placeholder="별명을 입력하세요." name="mnick"  value="${myinfo.mnick}" readonly="readonly"/> 								
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mname">* 이름:</label></td>
							<td><form:input path="mname" type="text" class="form-control" id="mname"
								placeholder="이름을 입력하세요." name="mname" value="${myinfo.mname}" readonly="readonly" /> 
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label for="mmail">* 이메일 주소:</label> 
					<form:input path="mmail" type="email"
						class="form-control" id="mmail" placeholder="메일주소를 입력하세요"
						name="mmail" readonly="readonly" value="${myinfo.mmail}" />
				</div>
				<div class="form-group">
					<label for="mphone">* 연락처:</label> <form:input path="mphone" type="text"
						class="form-control" id="mphone" placeholder="-없이 번호만 입력 해 주세요"
						name="mphone" readonly="readonly" value="${myinfo.mphone}" />
				</div>
				<div class="form-group">
					<label for="mbirth">생일:</label> <form:input path="mbirth" type="text"
						class="form-control" id="mbirth" placeholder="이벤트 응모를 위해 사용됩니다"
						name="mbirth" readonly="readonly" value="${myinfo.mbirth}"/>						
				</div>
				
				
				<div class="form-group">
					<label for="mdel">성별:</label> <form:select class="form-control" readonly="readonly"
						id="mdel" name="mdel" path="mdel" value="${myinfo.mdel}">
						<form:option value="1">남</form:option>
						<form:option value="2">여</form:option>
					</form:select>
				</div>				
				<button type="submit" class="submit btn btn-primary">회원가입</button>
				<button class="removeAll btn btn-info" type="button">내용
					지우기</button>
				<button class="rcancle btn btn-danger" type="button">메인으로</button>
		</form:form>
		</div>
	</div>

</div>
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>