<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>


<div class="container">

	<h2>반려동물 등록</h2>
	<div class="row">
		<div class="col-sm-4">
<img src="../resources/images/dd.jpg" class="rounded" alt="test" width="100%" />
<hr>
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