<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ include file="../includes/header.jsp"%>
<div class="container">
	<h2>회원 관리 페이지</h2>
</div>

<div class="container mt-3">
	<div class="row">
		<div class="col-sm-4">
		<p>Type something in the input field to search the table for first
			names, last names or emails:</p>
			<div class="spinner-border text-danger"></div>
			<div class="spinner-border text-danger"></div>
			<div class="spinner-border text-danger"></div><br>
			<img src="../resources/images/roro.jpg" class="rounded" alt="test" width="100%" /><p></p>
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
	 <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#">사용자 정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">반려동물 정보</a>
	    </li>
	  </ul>
	  <p><br></p>
			<input class="form-control" id="myInput" type="text"
				placeholder="검색어 입력.."> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@mail.com</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@greatstuff.com</td>
					</tr>
					<tr>
						<td>Anja</td>
						<td>Ravendale</td>
						<td>a_r@test.com</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<%@ include file="../includes/footer.jsp"%>