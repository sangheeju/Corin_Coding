<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../includes/header.jsp" %>
<div class="container">

  <h2>회원가입</h2>
  <div class="row">
  <div class="col-sm-4"> img add </div>
  <div class="col-sm-8">
  <form method="POST">
    <div class="form-group">
      <label for="mid">아이디:</label>
      <input type="text" class="form-control" id="mid" placeholder="ID를 입력하세요" name="mid">
    </div>
    <div class="form-group">
      <label for="mpass">비밀번호:</label>
      <input type="password" class="form-control" id="mpass" placeholder="비밀번호를 입력 해 주세요" name="mpass">
    </div>
<!--     <div class="form-group">
      <label for="mpasscheck">비밀번호 확인:</label>
      <input type="password" class="form-control" id="" placeholder="비밀번호를 한번 더 입력 해 주세요" name="">
    </div> -->
    <div class="form-group">
      <label for="mnick">사용자 이름:</label>
      <input type="text" class="form-control" id="mnick" placeholder="사용자 이름을 입력하세요" name="mnick">
    </div>
    <div class="form-group">
      <label for="mmail">이메일 주소:</label>
      <input type="email" class="form-control" id="mmail" placeholder="메일주소를 입력하세요" name="mmail">
    </div>
    <div class="form-group">
      <label for="mphone">연락처:</label>
      <input type="text" class="form-control" id="mphone" placeholder="번호만 입력 해 주세요" name="mphone">
    </div>
    <div class="form-group">
      <label for="mbirth">생일:</label>
      <input type="text" class="form-control" id="mbirth" placeholder="이벤트 응모를 위해 사용됩니다" name="mbirth">
    </div>
    <div class="form-group">
	  <label for="mdel">성별:</label>
	  <select class="form-control" id="mdel" name="mdel">
	    <option value ="1">남</option>
	    <option value ="2">여</option>
	  </select>
	</div>
    <div class="form-group form-check">
      <label class="form-check-label">
         기재 해 주신 정보는 당 사이트에서 본인 확인이나 이벤트 참여 목적으로 수집되며 그 외 용도로 사용되지 않습니다.<br>
         	해당 내용을 확인 하셨습니까? <br><input class="form-check-input" type="checkbox" name="mclass" id="mclass" value="1"><kbd>확인!</kbd> 
      </label>
    </div>
    <button type="submit" class="btn btn-primary">회원가입</button>
  </form>
</div>
</div>
</div>
<%@ include file="../includes/footer.jsp" %>