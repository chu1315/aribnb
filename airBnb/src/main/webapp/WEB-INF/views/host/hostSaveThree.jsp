<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
	<p>${loginUser.nm } 숙소 등록 4단계</p>
	<div>게스트가 어떤 공간을 사용할 수 있나요?</div>
	<form action="/host/hostSaveFour" method="post">
		<input type="hidden" name="i_host" value="${i_host}">
		<input type="hidden" name="i_user" value="${loginUser.i_user}">
		<input type="checkbox" name="liviroom" value="o" >단독 사용하는 거실
		<input type="checkbox" name="cooking" value="o" >주방
		<input type="checkbox" name="waching" value="o" >세탁 공간 - 세탁기
		<input type="checkbox" name="drying" value="o" >세탁 공간 - 건조기
		<input type="checkbox" name="paking" value="o" >주차
		<input type="checkbox" name="gym" value="o" >헬스장
		<input type="checkbox" name="swim_pool" value="o" >수영장
		<input type="checkbox" name="jacuzzi" value="o" >자쿠지
		
		<input type="submit" value="다음">
	</form>

</body>
</html>