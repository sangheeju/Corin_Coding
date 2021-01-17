<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<%@ include file="./includes/Header.jsp"%>
<%@ include file="./includes/NavTop.jsp"%>



<div class="container-fluid text-center">
	<div class="row content">
		<!-- NavSide -->
		<%@ include file="./includes/NavSide.jsp"%>
		<div class="col-sm-9">
			<h1> 찾아오시는 길<br /></h1>
			<div>
				<p><h4>경기 수원시 팔달구 효원로 241 수원시청 </h4></p>
			</div>
			<div id="map" style="width:500px;height:400px;">
			</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6b519f777d9aadc8a3a816d29f3ac9c"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.263580, 127.028710),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.263580, 127.028710); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div>수원 시청 <br/><a href="https://map.kakao.com/link/to/Suwon City Hall,37.263580, 127.028710" style="color:black" target="_blank"> 길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(37.263580, 127.028710); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
</script>

		</div>
	</div>
</div>
<%@ include file="./includes/Bottom.jsp"%>