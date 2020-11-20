<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="bottom">
	<hr>
	<h6 class="text-center">
		<button type="button" class="btn btn-link" data-toggle="modal"
			data-target="#personal">개인정보처리방침</button>
		/
		<button type="button" class="btn btn-link" data-toggle="modal"
			data-target="#using">이용약관</button>
		/
		<button type="button" class="btn btn-link" data-toggle="modal"
			data-target="#youth">청소년보호정책</button>
	</h6>
</div>
<div class="modal" id="personal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">개인정보 처리방침</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				1. 개인정보의 처리 목적 주식회사 KOROGOM (‘www.korogom.co.kr’이하 ‘사이트’) 은(는) 다음의
				목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br> - 고객
				가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액
				결제, 물품 또는 서비스의 공급.배송 등 <br> <br> 2. 개인정보처리 위탁<br> ①
				사이트는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br> ② 사이트는
				위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁
				제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게
				처리하는지를 감독하고 있습니다.<br> ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
				처리방침을 통하여 공개하도록 하겠습니다.<br>

			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<div class="modal" id="using">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">이용약관</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">제1조 목적 본 이용약관은 주식회사 KOROGOM의 서비스의 이용조건과
				운영에 관한 제반사항 규정을 목적으로 합니다.</div>
				
			<!-- Modal footer -->
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<div class="modal" id="youth">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">청소년보호정책</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				주식회사 KOROGOM ("회사"라 함)는 청소년이 건전한 인격체로 성장할 수 있도록 하기 위하여 청소년 보호정책을 수립,
				시행하고 있습니다.<br> 회사는 청소년들이 유해정보에 접근할 수 없도록 방지하고 있는 바, 본 청소년 보호정책을
				통하여 회사가 청소년보호를 위해 어떠한 조치를 취하고 있는지 알려드립니다.<br>
				<br> 1. 유해정보에 대한 청소년접근제한 및 관리조치<br> 회사는 청소년이 아무런 제한장치 없이
				청소년 유해정보에 노출되지 않도록 별도의 인증장치를 마련, 적용하며 청소년 유해정보가 노출되지 않기 위한 예방차원의 조치를
				강구합니다.<br>
				<br> 2. 유해정보로부터의 청소년보호를 위한 업무 담당자 교육 시행<br> 회사는 정보통신업무
				종사자를 대상으로 청소년보호 관련 법령 및 제재기준, 유해정보 발견시 대처방법, 위반사항 처리에 대한 보고절차 등을
				교육하고 있습니다.<br>
				<br> 3. 유해정보로 인한 피해상담 및 고충처리<br> 회사는 청소년 유해정보로 인한 피해상담 및
				고충처리를 위한 전문인력을 배치하여 그 피해가 확산되지 않도록 하고 있습니다.<br>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<h6 class="text-center p-3 my-3">Copyright ⓒKorogom All rights reserved.</h6>
</div>
<script>
$(function(){
	CKEDITOR.replace('bcon',{
		filebrowserUploadUrl: '${pageContext.request.contextPath}/adm/fileupload.do'
	});
});
</script>