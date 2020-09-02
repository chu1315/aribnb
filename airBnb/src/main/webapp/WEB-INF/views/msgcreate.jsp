<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지만들기 예시</title>
</head>
<body>
방 예약하는 페이지를 표현 -> jsp에 일단 기본적인 정보가 있음
-> 유저번호
, 방번호, 방정보, 사진 .... -> (호스트번호)유저번호
	<div>
		<form id="crtMsg" action="/aircnc/crtMsg" method="POST">
			<div>호스트 번호 : <input type="hidden1" name="host_num" value="1"></div>
			<div>예약 번호: <input type="text" name="i_reser" placeholder="예약번호가 없으면 메세지를 보내지못합니다."></div>
			<div>건물 번호 : <input type="text" name="i_host"></div>
			<div>유저 번호 : <input type="hidden1" name="i_user" value="${loginUser.i_user}"></div>
			<div>톡방 이름 : <input type="text" name="ms_title"></div>
			<div><input type="submit" value="만들기"></div>
		</form>
	</div>
</body>
</html>