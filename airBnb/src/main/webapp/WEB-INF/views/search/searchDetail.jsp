<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/searchDetail.css">
<title></title>
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
	
<div id="detailContainer">
	<div id="picContainer">
		<c:forEach var="item" items="${hostPic}">
			<img onclick="picDetail(${i_host},${item.pic_nm})" 
			style="padding:10px;" id="srcImg" 
			src='/resources/img/host/${i_host}/${item.pic_nm}'>
		</c:forEach>
	</div>

<div id="flexContainer">
	<div id="detailDes">
		<div>
			<h2>${writer.nm}님이 호스팅 하는 숙소 ${detailData.room_title}</h2>
			<h4>최대인원 ${detailData.r_vastion}명 · 침대 ${detailData.bed_qty}개  · 욕실${detailData.bth_room }개</h4>
		</div>
		<div class="line">――――――――――――――――――――――――――――――</div>
		<h4>${detailData.addr}</h4>
		<h4>방의 개수 : ${detailData.b_room}</h4>
		<br>
		<h4>입금 계좌 : ${detailData.acc_bank }</h4>
		<h4>계좌 번호 : ${detailData.acc }</h4>
		<h4>예금주 : ${detailData.acc_owner }</h4>
	</div>
	<hr>
	<div id="msgContainer">
		<h2>호스트에게 더 궁금하신 사항이 있으신가요?</h2>
		<h4>아래 버튼을 누르시면 호스트에게 메시지를 보낼 수 있게되고<br> 페이지가 이동합니다.</h4>
		<div class="line">――――――――――――――――――――――――――――――</div>
		<div id="msgAli">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-danger" value="호스트에게 메세지 보내기" onclick="crtMsg(${i_host}, '${detailData.room_title}', ${detailData.i_user})">
		</div>
	</div>
</div>	
	
</div>	
	
<script>
function crtMsg(i_host, room_title, i_user) {
	/*i_user -> 글쓴이 유저번호, i_host -> 등록된 건물 PK, room_title -> 방 제목으로 만들거임  */
	location.href='/aircnc/crtMsg?i_host='+i_host+'&room_title='+room_title+'&i_user='+i_user;
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
</script>
</body>
</html>