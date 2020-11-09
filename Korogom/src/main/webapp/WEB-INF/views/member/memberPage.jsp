<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>
<div class="container">
	<h2>회원 관리 페이지</h2>
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
  <form action="">
    <p>Custom file:</p>
    <div class="custom-file mb-3">
      <input type="file" class="custom-file-input" id="customFile" name="filename">
      <label class="custom-file-label" for="customFile">Choose file</label>
    </div>
    
    <p>Default file:</p>
    <input type="file" id="myFile" name="filename2">
  
    <div class="mt-3">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>

  </div>
		</div>
		<div class="col-sm-9">
	 <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="#">사용자 정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="${pageContext.request.contextPath}/member/petInfo">반려동물 정보</a>
	    </li>
	  </ul>
	  			<input class="form-control" id="myInput" type="text" style="margin: 10px"
				placeholder="필터하실 단어를 입력 해 주세요.."> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Nick Name</th>
						<th>Name</th>
						<th>Email Address</th>
						<th>Phone Number</th>
						<th>Birthday</th>
						<th>Class</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="MemberDAO" items="${mylist }">
					 	<tr>
						 	<td><a href="myPage?mno=${MemberDAO.mno}">${MemberDAO.mid } </a></td>
						 	<td>${MemberDAO.mnick }</td>
						 	<td>${MemberDAO.mname }</td>
						 	<td>${MemberDAO.mmail }</td>
						 	<td>${MemberDAO.mphone }</td>
						 	<td>${MemberDAO.mbirth }</td>
						 	<td>${MemberDAO.mclass }</td>
					 	</tr>
					</c:forEach>
				</tbody>
			</table>
							<input class="btn btn-success" type="button" value="메인으로" id="main" />
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

//Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
var fileName = $(this).val().split("\\").pop();
$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
</script>	
<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>