<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
	</script>
	</header>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<div class="container">

	<h2>회원가입</h2>
	<div class="row">
		<div class="col-sm-4">
<img src="../resources/images/dd.jpg" class="rounded" alt="test" width="100%" />
</div>
		<div class="col-sm-8">
			<form method="POST" id="regForm" >
				<div class="form-group">
					<table>
						<tr>
							<td><label for="mid">* 아이디:</label></td>
							<td><input type="text" class="form-control" id="mid"
								name="mid" placeholder="ID를 입력하세요" required>
							</td>
							<td>
								<button type="button" id="midCheck" value="N" class="midCheck" onclick="fn_idChk();" >중복체크</button>
							</td>
							<td><p>* 영문과 숫자만 사용가능 합니다.</p></td>
						</tr>
						<tr>
							<td>
								<div class="check_font" id="MidCheck"></div> <!-- 중복이나 형식이 맞지 않을 경우 경고문이 들어갈 자리 -->
							</td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="mpass">* 비밀번호:</label> 
							</td>	
							<td>
								<input type="password"
									class="form-control" id="mpass" placeholder="비밀번호를 입력하세요"
									name="mpass" required>
							</td>
							<td><p>* 영문과 숫자만 사용가능 합니다.</p></td>
						</tr>
						<tr><td><div class="check_font" id="passcheck"></div> <!-- 형식이 맞지 않을 경우 경고문이 들어갈 자리 --></td></tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="mnick">* 별명:</label> 
							</td>
							<td>
								<input type="text"
									class="form-control" id="mnick"
									placeholder="별명을 입력하세요." name="mnick" required>						
							</td>
							<td>
								<button id="mnickCheck" class="mnickCheck" type="button" onclick="nicheck();">중복체크</button>
							</td>
							<td><p>* 한글, 영문, 숫자만 사용가능 합니다.</p></td>
						</tr>
						<tr>
							<td>
								<div class="check_font" id="MnickCheck"></div>
								<!-- 중복이나 형식이 맞지 않을 경우 경고문이 들어갈 자리 -->
							</td>
						</tr>
					</table>
				</div>
				<div class="form-group">
					<table>
						<tr>
							<td>
								<label for="mname">* 이름:</label> 
							</td>
							<td>
								<input type="text"
									class="form-control" id="mname"
									placeholder="이름을 입력하세요." name="mname" required>						
							</td>
							<td>
								<button id="duplicate_check" type="button" onclick="namecheck();">본인인증??</button>
							</td>
							<td><p>* 한글만 사용가능 합니다.</p></td>
						</tr>
						<tr></tr>
					</table>
				</div>
				<div class="form-group">
					<label for="mmail">* 이메일 주소:</label> <input type="email"
						class="form-control" id="mmail" placeholder="메일주소를 입력하세요"
						name="mmail" required>
					<div class="check_font" id="email_check"></div>
					<!-- 중복이나 형식이 맞지 않을 경우 경고문이 들어갈 자리 -->
				</div>
				<div class="form-group">
					<label for="mphone">* 연락처:</label> <input type="text"
						class="form-control" id="mphone" placeholder="-없이 번호만 입력 해 주세요"
						name="mphone" required>
					<div class="check_font" id="num_check"></div>
					<!-- 중복이나 형식이 맞지 않을 경우 경고문이 들어갈 자리 -->
				</div>
				<div class="form-group">
					<label for="mbirth">생일:</label> <input type="text"
						class="form-control" id="mbirth" placeholder="이벤트 응모를 위해 사용됩니다"
						name="mbirth">
				</div>
				<div class="form-group">
					<label for="mdel">성별:</label> <select class="form-control"
						id="mdel" name="mdel">
						<option value="1">남</option>
						<option value="2">여</option>
					</select>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> * 기재 해 주신 정보는 당 사이트에서 본인
						확인과 이벤트 참여 목적으로만 수집되며 그 외 용도로는 사용되지 않습니다. 해당 내용을 확인 하셨습니까?
						<br>
					<input class="form-check-input" type="checkbox" name="mclass"
						id="mclass" value="1" required>
					<kbd>확인!</kbd>
						
					</label>
				</div>
				<button type="submit" class="submit btn btn-primary">회원가입</button>
				<button class="removeAll btn btn-info" type="button" >내용 지우기</button>
				<button class="rcancle btn btn-danger" type="button">메인으로</button>
			</form>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp"%>