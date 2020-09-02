<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ea36f2192f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/wishdetail.css">
    <title>Wishdetail</title>
</head>
<body>
    <container id="container">
        <header>
            <img id="logo" onclick="goIndex()" src="/resources/img/pinklogo.png">
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
        <div id="core">
            <div id="list">
                <div id="headicon">
                    <div class="hicon"><i class="fas fa-arrow-left"></i></div>
                    <div class="hicon"><i class="fas fa-ellipsis-h"></i></div>
                </div>
                <div id="tbox">
                    <div id="tbox1">${list.search_nm}</div>
                    <div id="tbox2">
                        <div class="liInfo">${list.check_in}</div>
                        <div class="liInfo">인원수</div>
                    </div>
                </div>
                <div class="line">――――――――――――――――――――――――――――――――――――――――――――――――</div>
                <div id="ctntTitle">저장된 숙소 ${list.count}개</div>
                <c:forEach var="hinfo" items="${hinfo}">
                <div class="repeat">
                    <div class="flex"> 
                        <div class="imgbox">
                            <div class="non-like"><i class="far fa-heart"></i></div>
                            <div class="like"><i class="fas fa-heart"></i></div>
                            <button class="left"><i class="fas fa-angle-left"></i></button>
                            <button class="right"><i class="fas fa-angle-right"></i></button>
                            <img src="/resources/img/tempimg.png">
                        </div>
                    </div>
                    <li class="htype">${hinfo.b_room}·침대${hinfo.bed_qty}개</li>
                    <li class="room_title">${hinfo.room_title}</li>
                    <li class="fee">${hinfo.fee}/박</li>
                    <li class="eval">${hinfo.avg} ${hinfo.count}</li>
                    <li class="reser">예약하기</li>
                </div>
                </c:forEach>
            </div>
            <div id="map">map</div>
        </div>
    </container>
<script type="text/javascript" src="/resources/js/wishdetail.js"></script>
</body>
</html>