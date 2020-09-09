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
			<img id="srcImg" src='/resources/img/host/${i_host}/${item.pic_nm}'>
		</c:forEach>
	</div>
	
	<br>
	
	<table  style="border:1px solid #ccc" class="board_list">
		<tr>
			<th>제목</th>
			<td>${detailData.room_title}</td>
			<th>작성자 </th>
			<td>${writer.nm}</td>
			<th>작성자 이메일</th>
			<td>${writer.e_mail }</td>
		</tr>
	</table>


	<br>
	주 소 : ${detailData.addr}
	<br>
	숙소에 들어갈 수 있는 적정 인원 수 : ${detailData.r_vastion }
	<br>
	방의 개수 : ${detailData.b_room}
	<br>
	침대의 개수 : ${detailData.bed_qty }
	<br>
	욕실의 개수 : ${detailData.bth_room }
	<br>
	입금 계좌 : ${detailData.acc_bank }
	<br>
	계좌 번호 : ${detailData.acc }
	<br>
	예금주 : ${detailData.acc_owner }
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