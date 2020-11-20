<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOROGOM</title>

<!-- header -->
<jsp:include page="../includes/header.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3873d5480326c0a2b8ce192bd0478be3&libraries=services"></script>
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
</head>
<body>

	<!-- top -->
	<jsp:include page="<%=request.getContextPath()%>/includes/top.jsp" />
	<div class="frame">

		<!-- container -->
		<div class="container">
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2">
					<img id="center" class="img-thumbnail" alt="center" src="${contextPath }/resources/images/roro.jpg">
				</div>
				<div class="col-lg-10">
					<p id="intro">
						요것이 센터 소개다~~~ 이말이여~!!!
					</p>
				</div>
				<div class="col-lg-1">
				</div>
				<div class="col-lg-10">
					<div id="map" style="width:100%;height:400px;align:center;margin-top:20px;"></div>
				</div>
				<div class="col-lg-1">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 카카오맵 -->
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('경기 수원시 장안구 정조로 940-1', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">KOROGOM</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>

	<!-- bottom -->
	<jsp:include page="<%=request.getContextPath()%>/includes/bottom.jsp" />

	<!-- footer -->
	<jsp:include page="../includes/footer.jsp" />
</body>
</html>