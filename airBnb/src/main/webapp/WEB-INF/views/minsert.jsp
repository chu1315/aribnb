<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<img id="logo" onclick="goIndex()" src="/resources/img/pinklogo.png">
		</div>
        <div id="menubutton" onclick="myMenu()">
            <div><img id="ham" src="/resources/img/bars-solid.svg"></div>
            <div id="profile">
                <img src="/resources/img/pimg.jpg">
            </div>
        </div>
        <div id="menuctnt">
            <li class="b">메시지</li>
            <li class="b">저장 목록</li>
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
	<h3>메시지 주고받기</h3>
	<table>
		<tr>
			<th>No</th><!-- 나중에 없애기 mlist도-->
			<th>타이틀</th>
			<th>작성시간</th>
		</tr>
		<c:forEach var="item" items="${msgList}">
			<tr onclick="detail(${item.i_mlist},${item.i_reser},${item.i_host})">
				<td>${item.i_mlist}</td>
				<td>${item.ms_title}</td>
				<td>${item.r_dt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<iframe name="mdetail" style="width: 100%; height: 400px; border: 0"></iframe>
	<%-- src="/aircnc/mdetail?i_mlist=${msgVo.i_mlist}&i_reser=${msgVo.i_reser}&i_host=${msgVo.i_host}" --%>
	
<script>

	function detail(i_mlist,i_reser,i_host){ 
		document.mdetail.location='/aircnc/mdetail?i_mlist='+i_mlist+'&i_reser='+i_reser+'&i_host='+i_host;
	}

	document.oncontextmenu = function (e) {
		   alert("오른쪽버튼을 이용할 수 없습니다...");
		   return false;
	}



</script>
	
</container>
<script type="text/javascript" src="/resources/js/wishlists.js"></script>
</body>
</html>