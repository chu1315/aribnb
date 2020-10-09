<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/hostSaveTwo.css">
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<link rel="stylesheet" href="/resources/css/dropzone.css" />
<script src="/resources/js/dropzone.js"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
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
		<h2>멋진 사진으로 숙소가 돋보이게 해주세요.</h2>
			<br>
			<div>
				<h5>휴대전화나 카메라를 사용하여 사진을 찍으세요.<br>
					숙소를 등록하려면 1장 이상의 사진이 필요합니다.<br> 
					사진을 첨부하시는 순간 바로 등록됩니다.<br>
					그 점에 주의하시고 올려주세요<br>
					사진 업로드가 완료되시면 바로 등록이 됩니다.</h5>
			</div>
			<br>
		<!-- 리스트에 뿌려질 썸네일 이미지 -->
		<div class="dropzone dz-clickable" id="myDropTwo" action="./thumUpload">
		    <div class="dz-default dz-message" data-dz-message="">
		    	<input type="hidden" name="i_host" value="${i_host}">
				<input type="hidden" name="i_user" value="${loginUser.i_user}">
		        <span><h4>리스트에 보여질 썸네일 이미지를 선택해주세요.</h4></span>
		    </div>
		</div>
		
		<script>
			$(document).on(function(){
				var Dropzone = $('div#myDropTwo').Dropzone({
				});
				Dropzone.autoDiscover = false;
				Dropzone.options.myAwesomeDropzone = false;
			});
		</script>
			
			
		
		<!-- 상세보기에 뿌려질 리스트 사진들 -->
		<div class="dropzone dz-clickable" id="myDrop" action="./upload">
		    <div class="dz-default dz-message" data-dz-message="">
		    	<input type="hidden" name="i_host" value="${i_host}">
				<input type="hidden" name="i_user" value="${loginUser.i_user}">
		        <span><h4>사진을 드래그해주시거나 선택해주세요</h4></span>
		    </div>
		</div>
		
		<script>

		
			$(document).on(function(){

				
				var Dropzone = $('div#myDrop').Dropzone({
				});
				

				Dropzone.autoDiscover = false;
				Dropzone.options.myAwesomeDropzone = false;
				
			});
		</script>
		
	</div>
	
	
	<div id="containerTwo">
		<img src="/resources/img/mustBeHost.png">
	</div>
</div>
<script>
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
</script>
</body>
</html>