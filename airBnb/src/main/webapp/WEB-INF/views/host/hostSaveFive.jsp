<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>6단계 ${loginUser.nm}님 게스트가 지켜야 할 숙소 이용규칙을 정하세요</p>
	<form action="#" method="post">
		<div>
			어린이(2~12세) 숙박에 적합함
			<input type="checkbox" name="child_ok" value="o"> 
		</div>
		
		<div>
			유아(2세 미만) 숙박에 적합함
			<input type="checkbox" name="y_ch_ok" value="o"> 
		</div>
		
		<div>
			반려동물 동반에 적합함
			<input type="checkbox" name="smoking" value="o"> 
		</div>
		
		<div>
			흡연 가능
			<input type="checkbox" name="animal_ok" value="o"> 
		</div>
		
		<div>
			반려 동물동반에 적합함
			<input type="checkbox" name="party" value="o"> 
		</div>
		
		<div>
			행사나 파티 허용
			<input type="checkbox" name="child_ok" value="o"> 
		</div>
	</form>
</body>
</html>