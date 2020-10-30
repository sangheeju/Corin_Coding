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
							<h3 class="login-heading mb-4">어서오세요!</h3>
							<form method="POST">
								<div class="form-label-group">
									<input type="text" id="mid" name="mid" class="form-control"
										placeholder="아이디를 입력하세요" required autofocus> <label
										for="inputId">아이디</label>
								</div>

								<div class="form-label-group">
									<input type="password" id="mpass" name="mpass"
										class=" form-control" placeholder="비밀번호를 입력하세요" required>
									<label for="pwd2">비밀번호</label>
								</div>

								<div class="custom-control custom-checkbox mb-3">
									<input type="checkbox" class="custom-control-input"
										id="customCheck1"> <label class="custom-control-label"
										for="customCheck1">아이디 저장</label>
								</div>
								<button
									class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
									type="submit">로그인</button>

								<div class="text-center">
									<!--  <a class="small" href="find_userid" >아이디 찾기</a> /<a class="small" >비밀번호 찾기</a>  -->
									<!-- Button to Open the Modal -->
									<button type="button" class="btn btn-outline-info"
										data-toggle="modal" data-target="#myModal">아이디/비밀번호
										찾기</button>
										<%@ include file="./find_userid.jsp"%>
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