<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>${loginUser.nm } 숙소 등록 3단계 </p>
	<form action="/host/hostSaveThree" method="post">
	<p>어떤 편의시설을 제공하시나요?</p>
	<input type="hidden" name="i_host" value="${i_host}">
	<input type="hidden" name="i_user" value="${loginUser.i_user}">
	<input type="checkbox" name="requier" value="o" checked="checked"> 필수 품목(수건, 침대 시트, 비누, 화장지, 베개)
	<input type="checkbox" name="wifi" value="o"> 무선인터넷
	<input type="checkbox" name="tv" value="o"> TV
	<input type="checkbox" name="hiter" value="o"> 난방
	<input type="checkbox" name="aircon" value="o"> 에어컨
	<input type="checkbox" name="iron" value="o"> 다리미
	<input type="checkbox" name="sampoo" value="o"> 샴푸
	<input type="checkbox" name="hiar_dry" value="o"> 헤어 드라이어
	<input type="checkbox" name="breakfast" value="o"> 조식(커피,차)
	<input type="checkbox" name="place_lattop" value="o"> 업무 가능 공간
	<input type="checkbox" name="in_hiter" value="o"> 벽난로
	<input type="checkbox" name="hanger" value="o"> 옷장/서랍장
	<input type="checkbox" name="door" value="o"> 게스트 전용 출입문
	<input type="checkbox" name="baby_bad" value="o"> 유아용 침대
	<input type="checkbox" name="baby_chairs" value="o"> 유아용 의자
	<input type="checkbox" name="self_checkin" value="o"> 셀프 체크인
	<input type="checkbox" name="self_bth_room" value="o"> 욕실 단독 사용
	
	<p>안전 시설</p>
	<input type="checkbox" name="fire_emble" value="o"> 화재 감지기
	<input type="checkbox" name="carbon_alarm" value="o"> 일산화탄소 감지기
	<input type="checkbox" name="madic_kit" value="o"> 구급상자
	<input type="checkbox" name="fire_exting" value="o"> 소화기
	<input type="checkbox" name="bad_lock" value="o"> 침실문 잠금장치
	
	<input type="submit" value="다음">
	</form>
</body>
</html>