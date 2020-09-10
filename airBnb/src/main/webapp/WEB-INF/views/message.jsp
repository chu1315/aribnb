<%@page import="com.project.aircnc.common.TUserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/message.css">

<title>Message - aircnc</title>
<!-- axios 태그 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<container id="container">
	<header>
		<div>
			<a href="/aircnc"><img id="logo" onclick="goIndex()" src="/resources/img/pinklogo.png"></a>
		</div>
        <div id="menubutton" onclick="myMenu()">
            <div><img id="ham" src="/resources/img/bars-solid.svg"></div>
            <div id="profile">
                <img src="/resources/img/pimg.jpg">
            </div>
        </div>
        <div id="menuctnt">
            <li class="b" onclick="goMsg()">메시지</li>
            <li class="b" onclick="goWish()">저장 목록</li>
            <div class="line">
                ――――――――――――――――
            </div>
            <li>숙소 호스트 되기</li>
            <li>계정</li>
            <div class="line">
                ――――――――――――――――
            </div>
            <li>도움말</li>
            <li>로그아웃</li>
        </div>
	</header>
</container>
<div id="msgContainer">
	<div id="msgDiv">
		<h3>메시지 주고받기</h3>
			<table>
				<tr>
					<th>No</th><!-- 나중에 없애기 mlist도-->
					<th>타이틀</th>
					<!-- <th>작성시간</th> -->
				</tr>
				<c:forEach var="item" items="${msgList}">
					<tr onclick="detail(${item.i_mlist},${item.i_host},${item.host_num})">
						<td>${item.i_mlist}</td>
						<td>${item.ms_title}</td>
						<%-- <td>${item.r_dt}</td> --%>
						<td><a href="/aircnc/delMsg?i_mlist=${item.i_mlist}"><input type="button" value="삭제"></a></td>
					</tr>
				</c:forEach>
			</table>
	</div>
	
	<div id="msgDiv2">
		<h3>세부 내용</h3>
		<iframe name="mdetail"></iframe>
	</div>
</div>
	
<script>
	var userVO ;
	var i_user;
	$(document).ready(function(){
		<% 
		TUserVO uservo = (TUserVO)session.getAttribute("loginUser");
		%>
		
		userVO = <%=uservo.getI_user() %>;
//         sessionStorage.setItem('loginUser', '1');
	});

	function detail(i_mlist,i_host,host_num,i_reser){

		/* //현욱이가 바꿔야할 ID값
		if (userVO != 0) {
			i_user = userVO;
		    alert('현재 i_user = '+i_user); */
			i_user = userVO
		    
			document.mdetail.location='/aircnc/mdetail?i_mlist='+i_mlist
					+'&i_host='+i_host+'&i_user='+i_user
					+'&host_num='+host_num;
		/* }else{
			document.location = '/aircnc';
		} */
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
	
</container>
</body>
</html>