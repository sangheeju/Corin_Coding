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
<header>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".rcancle").on("click", function(){
				location.href = "${contextPath}/";
			})
			$(".removeAll").on("click", function(){
				location.href = "${contextPath}/member/mregister";
			})
			$(".submit").on("click", function(){
				var idChkVal = $("#midCheck").val();	//아이디 중복확인 클릭 여부
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").midCheck();
				}
			});
		});
	
		
		function fn_idChk(){
			$.ajax({
				url : "${contextPath}/member/midCheck",
				type : "post",
				dataType : "json",
				data : {"mid" : $("#mid").val()},
				success : function(data){
					if(data == 1){
						alert("이미 사용중인 아이디입니다.");
					}else if(data == 0){
						$("#midCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}

		function nicheck(){
			$.ajax({
				url : "${contextPath}/member/mnickCheck",
				type : "post",
				dataType : "json",
				data : {"mnick" : $("#mnick").val()},
				success : function(result){
					if(result == 1){
						alert("이미 사용중인 별명입니다.");
					}else if(result >= 2){
						alert("관리자에게 문의 해 주세요");
					}else if(result == 0){
						$("#mnickCheck").attr("value", "Y");
						alert("사용가능한 별명입니다.");
					}
				}
			})
		}
		</script>
</header>
<div class="container">

	<h2>회원가입</h2>
	<div class="row">
		<div class="col-sm-3">
			<img src="../resources/images/dd.jpg" class="rounded" alt="test"
				width="100%" />
		</div>
		<div class="col-sm-9">
			<form:form modelAttribute="memberDAO" method="POST"
				action="${ pageContext.servletContext.contextPath }/member/mregister"  id="regForm">
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mid">* 아이디:</label></td>
							<td>
							<form:input path = "mid" type = "text" class = "form-control" id = "mid"
								name = "mid" placeholder = "ID를 입력하세요" /> 
								</td>
							<td>
								<form:button type="button" id="midCheck" value="N" class="midCheck"
									onclick="fn_idChk();">중복체크</form:button>
							</td>
							<td><h6>
										<small>* 영문, 숫자로 5~10글자 내외
										<form:errors class="text-danger" path="mid" />
										</small>
									</h6></td>
						</tr>
						<tr>
							<td><div class="checkId" id="idCheck">		
								</div></td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mpass">* 비밀번호:</label></td>
							<td><form:input path="mpass" type="password" class="form-control" id="mpass"
								placeholder="비밀번호를 입력하세요" name="mpass" /> 
								<td><h6 >
									<small>* 영문, 숫자, 특수문자로 8~10자 내외. (사용 가능 특수문자 !@#$%^&+=)
									<form:errors class="text-danger" path="mpass"/></small>
								</h6></td>	
						</tr>
						<tr>	
							
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mnick">* 별명:</label></td>
							<td><form:input path="mnick" type="text" class="form-control" id="mnick"
								placeholder="별명을 입력하세요." name="mnick" /> 
								</td>
							<td>
								<button id="mnickCheck" class="mnickCheck" type="button"
									onclick="nicheck();">중복체크</button>
							</td>
							<td>
								<h6>
									<small> * 한글, 영문, 숫자로 2~8자 내외
									<form:errors class="text-danger" path="mnick" /></small>	
								</h6>
							</td>
						</tr>
						<tr>
							
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mname">* 이름:</label></td>
							<td><form:input path="mname" type="text" class="form-control" id="mname"
								placeholder="이름을 입력하세요." name="mname" /> 
								<td><h6>
									<small>* 한글 2~6글자 내외<form:errors class="text-danger" path="mname" /></small></h6></td>
								
						</tr>
						<tr>
						
						</tr>
					</table>
				</div>
				<div class="form-group">
					<label for="mmail">* 이메일 주소:</label> 
					<form:input path="mmail" type="email"
						class="form-control" id="mmail" placeholder="메일주소를 입력하세요"
						name="mmail" />
					<h6><small><form:errors  class="text-danger" path="mmail" /></small></h6>
				</div>
				<div class="form-group">
					<label for="mphone">* 연락처:</label> <form:input path="mphone" type="text"
						class="form-control" id="mphone" placeholder="-없이 번호만 입력 해 주세요"
						name="mphone" />
					<div><h6>
									<small>* 숫자만 입력 해 주세요. <form:errors class="text-danger" path="mphone" /></small></h6></div>
				</div>
				<div class="form-group">
					<label for="mbirth">생일:</label> <form:input path="mbirth" type="text"
						class="form-control" id="mbirth" placeholder="이벤트 응모를 위해 사용됩니다"
						name="mbirth" />						
				</div>
				<div><h6><small><form:errors class="text-danger" path="mbirth" /></small></h6></div>
				
				<div class="form-group">
					<label for="mdel">성별:</label> <form:select class="form-control"
						id="mdel" name="mdel" path="mdel">
						<form:option value="1">남</form:option>
						<form:option value="2">여</form:option>
					</form:select>
				</div>
				<div><h6><small><form:errors class="text-danger" path="mdel" /></small></h6></div>
				<div class="form-group form-check">
					<label class="form-check-label"> * 기재 해 주신 정보는 당 사이트에서 본인
						확인과 이벤트 참여 목적으로만 수집되며 그 외 용도로는 사용되지 않습니다. 해당 내용을 확인 하셨습니까? <br>
						<input class="form-check-input" type="checkbox" name="mclass"
						id="mclass" value="1" > <br/><kbd>확인!</kbd>

					</label>
				</div>
				<button type="submit" class="submit btn btn-primary">회원가입</button>
				<button class="removeAll btn btn-info" type="button">내용
					지우기</button>
				<button class="rcancle btn btn-danger" type="button">메인으로</button>
		</form:form>
		</div>
	</div>

</div>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>