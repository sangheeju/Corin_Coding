<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3873d5480326c0a2b8ce192bd0478be3&libraries=services"></script>
<style>
#center {
	width: 100%;
}

#intro {
	text-align: left;
	font-size: 15px;
	padding: 20px;
}
</style>
<!-- header -->
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
	<div class="frame">

		<!-- container -->
		<div class="container">
			<div class="row" style="margin-top: 20px;">
				<div class="col-lg-2">
				</div>
				<div class="col-lg-10">
					<h2>애완동물 동반 가능 카페 / 공원 소개</h2>
					<p id="intro">KOROGOM 주변 애완동물과 같이 이용할 수 있는 카페와 공원입니다.</p>
				</div>
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div id="map"
						style="width: 100%; height: 400px; align: center; margin-top: 20px;"></div>
				</div>
				<div class="col-lg-1"></div>
			</div>
		</div>
	</div>

	<!-- 카카오맵 -->
	<script>
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('영화동 카페', placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	</script>

	<!-- bottom -->

	<!-- footer -->
	<jsp:include page="${contextPath}/WEB-INF/views/includes/footer.jsp" />
</body>
</html>