<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/joinPost" method="post">
    <input type="email" name="e_mail" placeholder="이메일 주소"><br>
    <input type="text" name="l_nm" placeholder="이름(예:길동)" value=""><br>
    <input type="text" name="f_nm" placeholder="성(예:홍)" value=""><br>
    <input type="password" name="c_pw" placeholder="비밀번호 설정하기"><br>
    <p><b>생일</b></p>
    <p>만 18세 이상의 성인만 회원으로 가입할 수 있습니다. 생일은 다른 에어비앤비 이용자에게 공개되지 않습니다.</p><br>
    <select name="month" id="">
      <option disabled selected >월</option>
      <option value="01">1월</option>
      <option value="02">2월</option>
      <option value="03">3월</option>
      <option value="04">4월</option>
      <option value="05">5월</option>
      <option value="06">6월</option>
      <option value="07">7월</option>
      <option value="08">8월</option>
      <option value="09">9월</option>
      <option value="10">10월</option>
      <option value="11">11월</option>
      <option value="12">12월</option>
    </select>
    <select name="day" id="">
      <option disabled selected >일</option>
      <option value="01">1일</option>
      <option value="02">2일</option>
      <option value="03">3일</option>
      <option value="04">4일</option>
      <option value="05">5일</option>
      <option value="06">6일</option>
      <option value="07">7일</option>
      <option value="08">8일</option>
      <option value="09">9일</option>
      <option value="10">10일</option>
      <option value="11">11일</option>
      <option value="12">12일</option>
      <option value="13">13일</option>
      <option value="14">14일</option>
      <option value="15">15일</option>
      <option value="16">16일</option>
      <option value="17">17일</option>
      <option value="18">18일</option>
      <option value="19">19일</option>
      <option value="20">20일</option>
      <option value="21">21일</option>
      <option value="22">22일</option>
      <option value="23">23일</option>
      <option value="24">24일</option>
      <option value="25">25일</option>
      <option value="26">26일</option>
      <option value="27">27일</option>
      <option value="28">28일</option>
      <option value="29">29일</option>
      <option value="30">30일</option>
      <option value="31">31일</option>
    </select>
    <select name="year" id="">
      <option disabled selected >년</option>
      <option value="2020">2020년</option>
      <option value="2019">2019년</option>
      <option value="2018">2018년</option>
      <option value="2017">2017년</option>
      <option value="2016">2016년</option>
      <option value="2015">2015년</option>
      <option value="2014">2014년</option>
      <option value="2013">2013년</option>
      <option value="2012">2012년</option>
      <option value="2011">2011년</option>
      <option value="2010">2010년</option>
      <option value="2020">2020년</option>
      <option value="2019">2019년</option>
      <option value="2018">2018년</option>
      <option value="2017">2017년</option>
      <option value="2016">2016년</option>
      <option value="2015">2015년</option>
      <option value="2014">2014년</option>
      <option value="2013">2013년</option>
      <option value="2012">2012년</option>
      <option value="2011">2011년</option>
      <option value="2010">2010년</option>
      <option value="2009">2009년</option>
      <option value="2008">2008년</option>
      <option value="2007">2007년</option>
      <option value="2006">2006년</option>
      <option value="2005">2005년</option>
      <option value="2004">2004년</option>
      <option value="2003">2003년</option>
      <option value="2002">2002년</option>
      <option value="2001">2001년</option>
      <option value="2000">2000년</option>
      <option value="1999">1999년</option>
      <option value="1998">1998년</option>
      <option value="1997">1997년</option>
      <option value="1996">1996년</option>
      <option value="1995">1995년</option>
      <option value="1994">1994년</option>
      <option value="1993">1993년</option>
      <option value="1992">1992년</option>
      <option value="1991">1991년</option>
      <option value="1990">1990년</option>
    </select>
    <p>에어비앤비의 회원 전용 할인, 추천 여행 정보, 프로모션 및 정책 변경사항을 이메일로 보내드립니다. 계정 관리의 환경설정 또는 프로모션 알림에서 언제든지 메시지 수신을 거부할 수 있습니다.</p>
    <div><label><input type="checkbox">에어비앤비에서 보내는 마케팅 메시지를 받고 싶지 않습니다.</label></div>
    <input type="submit" value="가입하기">
    왜지
  </form>
</body>
</html>