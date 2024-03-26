<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/main.css">
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

#map {
	width: 1500px;
	height: 500px;
	margin: auto;
}

#hallTable {
	margin: auto;
	width: 1200px;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

</style>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div>
		<div id="map"></div>
		<br>
		<br>
		<br>
		<table id="hallTable" class="table table-hover table-borderless">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">공연장</th>
					<th scope="col">주소</th>
					<th scope="col">수용인원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mList }" var="map" varStatus="i">
					<tr id="mapTr" onClick="panTo(${map.hallX }, ${map.hallY });">
						<td>${map.hallNo }</td>
						<td><a style="color:black;" href='javascript:void(0);'
							onclick="panTo(${map.hallX }, ${map.hallY });">
								${map.hallName } </a></td>
						<td>${map.hallAddress }</td>
						<td>약 ${map.hallPeople }명</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" style="text-align: center;"><c:if
							test="${pi.startNavi ne '1' }">
							<a href="/map.do?page=${pi.startNavi - 1 }">[이전]</a>
						</c:if> <c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<a href="/map.do?page=${p }">${p }</a>
						</c:forEach> <c:if test="${pi.endNavi ne pi.naviTotalCount }">
							<a href="/map.do?page=${pi.endNavi + 1 }">[다음]</a>
						</c:if></td>
				</tr>
			</tfoot>
		</table>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df1f9dc399edf02b72dc0ce8a03a3ef9"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5408621, 127.0024870), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		//마커를 표시할 위치와 title 객체 배열입니다 
		/* var positions = [ {
			title : '카카오',
			latlng : new kakao.maps.LatLng(33.450705, 126.570677)
		}, {
			title : '생태연못',
			latlng : new kakao.maps.LatLng(33.450936, 126.569477)
		}, {
			title : '텃밭',
			latlng : new kakao.maps.LatLng(33.450879, 126.569940)
		}, {
			title : '근린공원',
			latlng : new kakao.maps.LatLng(33.451393, 126.570738)
		} ]; */
		
		let positions = [];
		<c:forEach items="${mList }" var="map" varStatus="i">
			positions.push({
				title : '${map.hallName }',
				address : '${map.hallAddress }',
				hallPeople : '${map.hallPeople }',
				latlng : new kakao.maps.LatLng('${map.hallX }', '${map.hallY }')
			});
		</c:forEach>
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		
		for (let i = 0; i < positions.length; i++) {

			// 마커를 생성합니다
			let marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			//image : markerImage // 마커 이미지 
			});
			
		
			
// 			// 인포윈도우를 생성합니다
// 			var infowindow = new kakao.maps.InfoWindow({
// 				content : "<div style='width: 200px; height: 200px; padding:5px;'><span class='info-title'>" + positions[i].title + "<br>" + positions[i].address + "<br>" + positions[i].hallPeople + "명</span></div>"
// 			});

// 			(function(marker, infowindow) {
// 				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
// 				kakao.maps.event.addListener(marker, 'mouseover', function() {
// 					infowindow.open(map, marker);
// 				});

// 				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
// 				kakao.maps.event.addListener(marker, 'mouseout', function() {
// 					infowindow.close();
// 				});
// 			})(marker, infowindow);

			let content = document.createElement('div');
            content.innerHTML = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
                        positions[i].title + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">'+positions[i].address+'</div>' + 
            '                <div class="jibun ellipsis">수용인원: '+ positions[i].hallPeople +'명</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';
            let overlay = new kakao.maps.CustomOverlay({
                content: content,
              	map: map,
                position: marker.getPosition()       
            });
            const closeBtn = document.createElement('div'); 
//             	<div class="close" title="닫기"></div>
            closeBtn.className = 'close';
            closeBtn.setAttribute('title', '닫기');
            closeBtn.onclick = function () {
                overlay.setMap(null);
            };
            content.querySelector(".title").appendChild(closeBtn);
            overlay.setContent(content);
            
            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
            });
            
            
            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            /* function closeOverlay() {
                overlay.setMap(null);     
            }; */
 		}
		
		
		function panTo(x, y) {
			// 이동할 위도 경도 위치를 생성합니다
			var moveLatLon = new kakao.maps.LatLng(x, y); 
			// 지도 중심을 부드럽게 이동시킵니다 
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다 
			map.panTo(moveLatLon); 
		};
	</script>
</body>
</html>