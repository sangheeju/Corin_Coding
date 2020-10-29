<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">어서오세요! </h3>
              <form method="POST">
                <div class="form-label-group">
                  <input type="text" id="mid" name="mid" class="form-control" placeholder="아이디를 입력하세요" required autofocus>
                  <label for="inputId">아이디</label>
                </div>

                <div class="form-label-group">
                  <input type="password" id="mpass" name="mpass" class=" form-control" placeholder="비밀번호를 입력하세요" required>
                  <label for="pwd2">비밀번호</label>
                </div>

                <div class="custom-control custom-checkbox mb-3">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">아이디 저장</label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">로그인</button>
                
                <div class="text-center">
                 <!--  <a class="small" href="find_userid" >아이디 찾기</a> /<a class="small" >비밀번호 찾기</a>  -->
                   <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#myModal">
    아이디/비밀번호 찾기
  </button>
</div>
  <!-- The Modal -->
  <script type="text/javascript">
$(document).ready(function(){
	find_userid();

		$("#findId").on('click', function(){
			var mname = $("#mname").val();
		 	var mmail = $("#mmail").val();
		 	
			var url = "${contextPath}/member/find_userid?";	
 		 	var paramData = {
 		 			"mname": mname  ,
 		 			"mmail" : mmail 
 		 			}; //요청데이터

			$.ajax({
				url : url,
				type : "POST",
				dataType : "json",				
				data : paramData,
				success : function(result){		
				
				if (result != null) {					
					$("#msgdiv").text(+mname+"회원님의 정보로 등록된 아이디는 : "+mid+" 입니다.");
					$("#msgdiv").css('color','red');
					$("#msgdiv").show();

				} else if (result == null) {
					$("#msgdiv").text("<h3>아이디가 없습니다.</h3>");
					$("#msgdiv").show();
				}
			},
				error: function (result){
		        	alert("에러가 발생 했습니다."+result);
		        	}
			});
		});
});

	</script>	

  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
  <form method="POST">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">아이디를 잊으셨나요? </h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold "	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold " for="search_2">비밀번호 찾기</label>
				</div>
       <h6 class="login-heading mb-4">가입하실때 사용 하셨던 이름과 이메일 주소를 입력 해 주시면 로그인 아이디를 확인해 드립니다.</h6>
                <div class="form-label-group">
                  <label for="inputId">이름</label>
                  <input type="text" id="mname" name="mname" class="form-control" placeholder="이름을 입력하세요" required autofocus>
                </div>
                <div class="form-label-group">
                  <label for="email">메일 주소</label>
                  <input type="email" id="mmail" name="mmail" class=" form-control" placeholder="Email주소를 입력하세요" required>
                </div>
					<br>
                <button id="findId" class="submit btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">아이디 확인</button>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form><br>
         <div id="msgdiv">
      </div>
    </div>
  </div>
                    </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%@ include file="../includes/footer.jsp"%>