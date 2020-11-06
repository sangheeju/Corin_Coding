<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../includes/header.jsp"%>
<!-- top -->
	<%@ include file="../includes/top.jsp"%>

<title>아이디 찾기</title>
<script type="text/javascript">
$(document).ready(function(){
//	    find_userid();

		$('#findId').on('click', function(){
			var mname = $("#mname").val();
		 	var mmail = $("#mmail").val();
		 	
			var reqUrl = "${pageContext.request.contextPath}/member/find_userid2";	
			alert(reqUrl);
 		 	var paramData = {
 		 			"mname": mname  ,
 		 			"mmail" : mmail 
 		 			}; //요청데이터
 		 	
			$.ajax({
				url : reqUrl,
				type : "POST",
			
				data : paramData,
				success : function(result){	
		 			console.log("result 확인용 : "+result);					
					if (result.length < 1) {
						$('#msgdiv').html("<p>아이디가 없습니다.</p>");
					} else {
						$('#msgdiv').html("<p>회원님의 아이디는 "+result+"입니다</p>");
					}
				},
				error: function(data){
		        	console.log("에러가 발생 했습니다."+data);
		        }
			});

			
		});
});

// function find_userid(){
//	var url = "${contextPath}/member/find_userid";	
	
//} //find_userid() END

	</script>	
	
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">아이디를 잊으셨나요? </h3>
              <h5 class="login-heading mb-4">가입하실때 사용 하셨던 이름과 이메일 주소를 입력 해 주시면 로그인 아이디를 확인해 드립니다.</h5>
              <form method="POST">
                <div class="form-label-group">
                  <label for="inputId">이름</label>
                  <input type="text" id="mname" name="mname" class="form-control" placeholder="이름을 입력하세요" required autofocus>
                </div>

                <div class="form-label-group">
                  <label for="email">메일 주소</label>
                  <input type="email" id="mmail" name="mmail" class=" form-control" placeholder="Email주소를 입력하세요" required>
                </div>
<br>
                <button id="findId" class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="button">아이디 확인</button>
                </form>
                <br>
                <div id="msgdiv" class="msgdiv"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	<!-- bottom -->
		<%@ include file="../includes/bottom.jsp"%>
	
	<!-- footer -->
<%@ include file="../includes/footer.jsp"%>