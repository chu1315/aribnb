<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd639228a089ed8335d3b598cb34620b&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd639228a089ed8335d3b598cb34620b&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd639228a089ed8335d3b598cb34620b&libraries=services,clusterer,drawing"></script>
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/wishlists.css">

<title>Wishlists - AirCnC</title>
<!-- axios 태그 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<container id="container">
		<header>
			<div>
				<a href="/aircnc"><img id="logo" src="/resources/img/pinklogo.png"></a>
			</div>
	        <div id="menubutton" onclick="myMenu()">
	            <div><img id="ham" src="/resources/img/bars-solid.svg"></div>
	            <div id="profile">
	                <img src="/resources/img/pimg.jpg">
	            </div>
	        </div>
	        <div id="menuctnt">
	      	 <c:if test="${loginUser == null }">
	         	<li class="b" onclick="popupJoin()">회원가입</li>
	         </c:if>
	         <c:if test="${loginUser.i_user == null}">
			 	<li class="b" onclick="popupLogin()">로그인</li>
			 </c:if>
			 <c:if test="${loginUser.i_user != null}">
			 	<a href="/logout"><li class="b">로그아웃</li></a>
			 </c:if>
	         <li class="b" onclick="goMsg()">메시지</li>
	         <li class="b" onclick="goWish()">저장 목록</li>
	         <div class="line">――――――――――――――――</div>
	         <c:if test="${loginUser.i_user != null}">
	         <li class="b" onclick="goHost()">숙소 호스트 등록</li>
	         </c:if>
	         <li>계정</li>
	         <div class="line">――――――――――――――――</div>
	         <li>도움말</li>
	      </div>
		</header>
	</container>
	
	
	<div class="containerPa">
		<div class="containerTwo">
			<table>
				<c:forEach var="item" items="${wishData}">
					<tr id="hoverSelected" onclick="moveToDetail(${item.i_host}, ${item.i_user})">
						<td><input type="hidden" value="${item.i_host}"></td>
						<td><img id="srcImg" src='/resources/img/thum/${item.pic_nm}'></td>
						<td id="tds">${item.room_title}</td>
						<td id="tds">${item.r_dt}</td>
						<td>
							<c:if test="${loginUser.i_user != null}">
								<a href="/wish/wishDelete?i_host=${item.i_host}"><input type="button" value="찜삭제"></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		<div class="containerThree">
			<div id="map" style="width:600px;height:600px;"></div>
		</div>
	</div>
	
</body>
<script>
function moveToDetail(i_host,i_user) {
	location.href='/search/searchDetail?i_host='+i_host+'&i_user='+i_user;
}


function goHost(i_user){
	location.href='/host/hostSave';
}

//메시지 화면 이동
function goMsg() {
	location.href = '/aircnc/message';
}
//메뉴-저장 목록으로 이동
function goWish() {
	location.href = '/wish';
}

function goHST(){
	location.href='/host/hostSaveTwo';
}


//dropDown 메뉴 함수 
function myMenu() {
	display = document.getElementById("menuctnt").style.display;
	if(display == 'block'){
		document.getElementById("menuctnt").style.display='none';
	}else{
		document.getElementById("menuctnt").style.display='block';
	}
}
// 위도경도 따는 중
$(document).on(function(){
	var latitude; // 위도
	var longitude; // 경도
	
	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		      alert(position.coords.latitude + ' ' + position.coords.longitude);
		      latitude = position.coords.latitude;
		      longitude = position.coords.logitude;
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
		}
		getLocation();
		
});
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.8734599181973, 128.60100811064228), //지도의 중심좌표.
			level: 4 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 
		
		var markerPosition  = new kakao.maps.LatLng(35.8734599181973, 128.60100811064228); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

</script>
</body>
</html>