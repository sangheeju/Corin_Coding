<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ include file="../includes/header.jsp"%>


<div class="container">

	<h2>반려동물 등록</h2>
	<div class="row">
		<div class="col-sm-4">
<img src="../resources/images/dd.jpg" class="rounded" alt="test" width="100%" />
<div class="form-group">
    <div class="input-group mb-3">
      <div class="custom-file">
        <input type="file" class="custom-file-input" id="inputGroupFile02">
        <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
      </div>
      <div class="input-group-append">
        <span class="input-group-text" id="">Upload</span>
      </div>
    </div>
  </div>
</div>
		<div class="col-sm-8">

			<form:form method="POST" modelAttribute="petDAO" action="${ pageContext.servletContext.contextPath }/member/pregister">
				<div class="form-group">
				<input type="hidden" name="mid" value="${user.mid }" />
					<label for="pdiv">반려동물 종류:</label> <select class="form-control" id="pdiv" name="pdiv">
						<option value="1">견(Dog)</option>
						<option value="2">묘(Cat)</option>
					</select>
					</div>
						<div class="form-group">
					<table>
						<tr>
							<td><label for="pname">* 반려동물 이름: </label></td>
							<td><form:input path="pname" type="text" class="form-control" id="pname"
								name="pname" placeholder="반려동물 이름을 입력하세요" />	
							</td>
							<td><h6><small>* 영문과 한글만 사용가능 합니다.* 영문, 숫자로 5~10글자 내외
										<form:errors class="text-danger" path="pname" />
										</small>
									</h6></td>
						</tr>
					</table>
					</div>
					<div class="form-group">
					<label for="pbirth">생일:</label> <input type="date"
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
								<input type="text"
									class="form-control" id="pnum"
									placeholder="등록 번호를 입력하세요." name="pnum">						
							</td>					
							<td><p>* 숫자만 사용가능 합니다. </p></td>
						</tr>						
					</table>
				</div>
				<div class="form-group">
					<label for="pdiv">반려동물 성별:</label> <select class="form-control" id="pdiv" name="pdiv">
						<option value="1">암컷</option>
						<option value="2">수컷</option>
						<option value="3">암컷 중성화 완료</option>
						<option value="4">수컷 중성화 완료</option>
					</select>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> * 기재 해 주신 정보는 당 사이트에서 본인
						확인과 이벤트 참여 목적으로만 수집되며 그 외 용도로는 사용되지 않습니다. 해당 내용을 확인 하셨습니까?
						<br>
					<input class="form-check-input" type="checkbox" value="1" required>
					<kbd>확인!</kbd>					
					</label>
				</div>
				
				<button type="submit" class="submit btn btn-primary">반려동물 등록하기</button>
				</form:form>
			</div>
		</div>
	</div>

<%@ include file="../includes/footer.jsp"%>