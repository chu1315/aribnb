<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<link rel="stylesheet" href="/resources/css/dropzone.css" />
<link rel="stylesheet" href="/resources/css/hostSave.css">
<script src="/resources/js/dropzone.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYMK6J-N5yiDhf8Z3Bipzewlm5bOzs_iU"
  type="text/javascript"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <style type="text/css">
 
 .chooseNum{
 width : 30px;
 }
 
 </style>
<title>에어비앤비 호스트가 되세요</title>
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

<div id="container2">
	<div id="containerOne">
		<h2>${loginUser.nm} 님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</h2>
		<br>
		<div><h3>등록하시려는 숙소의 유형과 사진을 선택하세요.</h3></div>
		
		<br>
		<form action="/host/hostSave" method="post" onsubmit="goHST()">
			<input type="hidden" name="i_user" value="${loginUser.i_user}">
		
			<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />
		
			<br/>
		
			<input type="text" id="address" name="addr" placeholder="주소" style="width:240px;" readonly/>
		
			<input type="text" id="address_etc" name="addrDetail" placeholder="상세주소" style="width:200px;"/>
			
			
			<div>
				<select name="r_vastion">
					<c:forEach var="i" begin="1" end="16">
						 <option value="${i}" >최대 ${i}명 숙박 가능</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<select name="b_room">
					<c:forEach var="i" begin="1" end="50">
						 <option value="${i}" >객실 ${i}개</option>
					</c:forEach>
				</select>
			</div>
			
			<div>
				<p><h4>게스트가 사용할 수 있는 침대는 몇 개인가요?</h4></p>
				<p>침대</p>
				<button type="button"	onclick="countDw(document.getElementById('bed_qty'))">-</button>
	     			<input class="chooseNum"	id="bed_qty" 	name="bed_qty"		type="number"	size="10"	value="1" >
	        	<button type="button" 	onclick="countUp(document.getElementById('bed_qty'))">+</button>
			</div>
			
			<div>
				<p>욕실수</p>
				<button type="button"	onclick="countDw(document.getElementById('bth_room'))">-</button>
	     			<input class="chooseNum"	id="bth_room" 	name="bth_room"		type="number"	size="10"	value="1" >
	        	<button type="button" 	onclick="countUp(document.getElementById('bth_room'))">+</button>
			</div>
			
			<div>
				<p>숙소 제목</p>
				<input type="text" name="room_title" value="" placeholder="숙소 제목">
			</div>
			
			<div>
				<p>은행</p>
				<select name="acc_bank">
					<option value="국민은행">국민은행</option>
					<option value="농협">농협</option>
					<option value="신한은행">신한은행</option>
				</select>
				<p>계좌</p>
				<input type="text" name="acc" value="" placeholder="계좌">
				<p>예금주</p>
				<input type="text" name="acc_owner" value="${loginUser.nm}" placeholder="예금주">
			</div>
			<br>
			<br>		
				<input type="submit" value="다음">
		</form>
		
	</div>
	
	<div id="containerTwo">
		<img src="/resources/img/mustBeHost.png">
	</div>
</div>

</body>

<script>
function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete:function(data) {
			jQuery("#zonecode").val(data.zonecode);
			jQuery("#address").val(data.address);
			jQuery("#address_etc").focus();
			console.log(data);
		}
	}).open();
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
	location.href = '/wishlists';
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



	function countUp(d) {
	    d.value = parseInt(d.value) + 1;
	}
	
	function countDw(d) {
	    d.value = parseInt(d.value) - 1;
	    if(d.value < 1) {
	        d.value = 1;
	    }
	}
	

</script>
</html>