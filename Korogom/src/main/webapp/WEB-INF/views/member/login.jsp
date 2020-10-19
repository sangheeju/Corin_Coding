<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
  <h2>로그인</h2>
  <form class="form-inline" method="POST">
    <label for="email2" class="mb-2 mr-sm-2">아이디:</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="mid" placeholder="Enter email" name="mid">
    <label for="pwd2" class="mb-2 mr-sm-2">비밀번호:</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="mpass" placeholder="Enter password" name="mpass">
    <div class="form-check mb-2 mr-sm-2">
      <label class="form-check-label">
        <input type="checkbox" class="form-check-input" name="remember"> Remember me
      </label>
    </div>    
    <div id="textbox" >
    </div>
    <button type="submit" class="btn btn-primary mb-2">로그인</button>
  </form>
</div>


<%@ include file="../includes/footer.jsp"%>