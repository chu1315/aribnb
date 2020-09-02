<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/host/hostSave" method="post">
		<input type="submit" value="숙소 등록">
		<input type="hidden" name="i_user" value="${loginUser.i_user}">
	</form>
	
	<div>예약</div>
	
</body>
</html>