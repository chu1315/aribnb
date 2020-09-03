<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</container>

</body>
</html>