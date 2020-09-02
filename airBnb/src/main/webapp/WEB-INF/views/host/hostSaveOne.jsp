<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>${loginUser.nm}</div>
	<form action="/host/hostSaveTwo" method="post">
		<input type="hidden" name="i_user" value="${loginUser.i_user}">
		<input type="hidden" name="i_host" value="${i_host}">
		<div>2단계 등록하실 숙소 종류는 무엇인가요? </div>
		<div>
			<p>건물 유형을 선택하세요</p>
			<select name="typ">
				<option value="" >하나를 선택하세요.</option>
				<option value="apt" selected="selected">아파트</option>
				<option value="outbuild" >별채</option>
			</select>
		</div>
		<div>
			<p>게스트가 묵게 될 숙소 유형을 골라주세요.</p>
			<input type="radio" name="live_type" value="all" checked="checked"> 집 전체
			<input type="radio" name="live_type" value="single" >개인실
			<input type="radio" name="live_type" value="share">다인실
		</div>
		
		<input type="submit" value="다음">
	</form>
</body>
</html>