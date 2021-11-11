<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#map {
	width: 81%;
	height: 700px;
	border: 1px solid gray;
	left: 18%;
	top: 14%;
	margin: 100px 0px;
}

#mapList {
	position: absolute;
	left: 43px;
	top: 220px;
	background: white;
	border-radius: 2px;
	width: 300px;
	border: 1px solid #ddd;
	height: 701px;
	opacity: 0.8;
	font-size: 0.8rem;
}

.searchstore {
	height: 60px;
	line-height: 40px;
	font-size: 1.5rem;
	text-align: center;
	padding-top: 10px;
}

#searched>li {
	height: 80px;
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
#searched{
	height: 518px;
    overflow: auto;
}
input[type="text"] {
	width: 90%;
	height: 30px;
	border: none;
	border-radius: 2%;
}

.searchInput {
	height: 60px;
	border: 1px solid gray;
	line-height: 55px;
	font-size: 0.9rem;
}

.searchResult {
	font-size: 1em;
}

.searchInput img {
	position: absolute;
	top: 60px;
	right: 0px;
}
</style>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJSzwXGvvtIypU1a6qlp-Vw0hY-4ZQ_I0&callback=initMap">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	// https://cloud.google.com/maps-platform/
	// https://maps.googlepis.com/
	//위도, 경도
	var latitude = 37.5010689;
	var longitude = 127.0430285;
	var resultedMap;
	function initMap() {
		var myCenter = new google.maps.LatLng(latitude, longitude);
		// 지도를 그릴 때 필요한  기타점을 JSON형식의 데이터로 생성한다.							
		var mapProperty = {
			center : myCenter,
			zoom : 14,//0~21까지의 값을 사용한다. 숫자가 클수록 확대된다.
			mapTypeId : google.maps.MapTypeId.ROADMAP
		//지도종류(ROADMAP, HYBRID, STEELITE, TERRAIN)
		};
		//지도를 표시할 곳	
		var map = new google.maps.Map(document.getElementById("map"), mapProperty);
		//마커표시
		 var geocoder = new google.maps.Geocoder();

           
        console.log('submit 버튼 클릭 이벤트 실행');

        // 여기서 실행
        geocodeAddress(geocoder, map);

        function geocodeAddress(geocoder, resultMap) {
            console.log('geocodeAddress 함수 실행');
     	resultedMap= resultMap;
                // 주소 설정
//                 var address = document.getElementById('address').value;
     	mapList();
                
	}
		}
	function mapList(searchMap){
		$.ajax({
	    	//데이터베이스에서 주소 목록을 가져온다.
		url: '/myapp/map',
		data: {search:searchMap},
		success:function(e){
			
			var tag="";
			
	      	for(var i in e){
	      		var lat = Number(e[i].lat);
	      		var lon = Number(e[i].lon);
	      		var darwin = new google.maps.LatLng(lat, lon);
			        // 맵 마커
		        var marker = new google.maps.Marker({
                      map: resultedMap,
                      position: {lat:lat,lng:lon},
                      title:e[i].fc_name
                });
		        marker.addListener("click", (event) => {
		        	resultedMap.setZoom(15);
		        	resultedMap.setCenter(event.latLng);
		        });
					tag += "<li>"+e[i].fc_name+"<br /> "+e[i].fc_addr+"<br /></li> ";
	            };
				
				$('#searched').append(tag);
				$('#searchResult').text("(검색 결과 "+e.length+"개)");
			}, error:function(){
				console.log("error");
			}
		});
		
}
</script>
<script type="text/javascript">
$(()=>{
   $('#searchMap').keyup(function(){
	   $('#searched').html("");
	   mapList($('#searchMap').val());
   });
});


</script>
</head>
<body>
	<%@ include file="/inc/top.jspf"%>
	<div id='map'></div>
	<div id='mapList'>
		<ul>
			<li class="searchstore">매장 찾기</li>
			<li class="searchInput"><input type="text" id="searchMap" name="searchMap" placeholder="매장명 또는 주소 입력"><img src="img/searchBtn.png"></li>
			<li id = "searchResult" class="searchstore searchResult">(검색 결과 0개)</li>
			<li>
				<ul id="searched">
					
				</ul>
			</li>
		</ul>
	</div>
	<%@ include file="/inc/bottom3.jspf"%>
</body>
</html>