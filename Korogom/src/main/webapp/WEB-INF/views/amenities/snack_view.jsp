<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- header -->
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<style>
#center {
	width: 100%;
}
#intro {
	text-align:left;
	font-size: 15px;
	padding:20px;
}
</style>
	<div class="frame">

		<!-- container -->
		<div class="container">
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-12">
					<h2>호텔 내 동물편의점 상품 안내</h2>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/dog_food.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						상품명: 오리젠 오리지날 독<br>
						용량: 2 kg<br>
						섭취 가능 동물: 강아지<br>
						가격: 35000 원<br>
						설명: 자연에는 합성 첨가물이 없기 때문에, 개와 늑대는 먹이감 동물의 여러 부위를 먹어서 필요한 영양소들을 천연적으로 완전하게 섭취합니다.<br>
그 때문에 오리젠 반려견 식품에는 합성 성분이 거의 없습니다. <br>
신선한 가금 살코기, 내장육과 연골을 영양이 가득한 비율로 사용하고 신선한 통 생선 및 통 계란을 더하여, 오리젠은 반려견의 성장에 필요한 사실상 모든 영양분을 천연으로 제공합니다.<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/cat_food.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						상품명: 오리젠 캣 앤 키튼<br>
						용량: 1.8 kg<br>
						섭취 가능 동물: 고양이<br>
						가격: 38000 원<br>
						설명: 오직 3가지 보충물만 첨가 – 아연, 구리, 콜린<br>
자연에는 합성 첨가물이 없으며, 고양이는 먹이감 동물의 여러 부위를 먹음으로써 필요한 천연 영양소들을 완전하게 자연적으로 섭취합니다.<br>
그래서 오리젠 반려묘 식품은 합성 첨가물을 거의 함유하고 있지 않습니다. <br>
신선한 살코기, 내장육과 연골을 영양소가 가득한 비율로 사용하고 신선한 통 생선 및 신선한 통 계란을 더하여, 고양이에게 필요한 사실상 모든 영양소를 천연으로 제공합니다.<br>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
</body>
</html>