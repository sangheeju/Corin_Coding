<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<style>
div.buttonclass {
  margin: 10px 0;
}
</style>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>
<div class="container">
	<h2>반려동물 관리 페이지</h2>
</div>

<div class="container mt-3">
	<div class="row">
		<div class="col-sm-3">
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
		<div class="col-sm-9">
	 <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link" href="${pageContext.request.contextPath}/member/memberPage">사용자 정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link active" href="${pageContext.request.contextPath}/member/petInfo">반려동물 정보</a>
	    </li>
	  </ul>
	  <div class="buttonclass float-right" style="margin: 10px">
	  <form action="${pageContext.request.contextPath}/member/pregister" method="GET">
		 <button class="btn btn-info" type="submit" > 반려동물 등록하기</button>	
	  </form>
	  </div>
			<input class="form-control" id="myInput" type="text"
				placeholder="검색어 입력.."> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Pet NO</th>
						<th>Member NO</th>
						<th>Division</th>
						<th>Pet Name</th>
						<th>Pet Birthday</th>
						<th>Pet Registered Number</th>
						<th>Gender</th>
						<th>Etc</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="PetDAO" items="${petList }">
				 	<tr>
					 	<td><a href="petPage?pno=${PetDAO.pno}">${PetDAO.pno } </a></td>
					 	<td>${PetDAO.mno }</td>
					 	<td>${PetDAO.pdiv }</td>
					 	<td>${PetDAO.pname }</td>
					 	<td>${PetDAO.pbirth }</td>
					 	<td>${PetDAO.pnum }</td>
					 	<td>${PetDAO.pdel }</td>
					 	<td>${PetDAO.petc }</td>
				 	</tr>
				</c:forEach>
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
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>