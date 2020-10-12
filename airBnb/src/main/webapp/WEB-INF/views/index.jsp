<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 파비콘 404  -->
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="https://kit.fontawesome.com/ea36f2192f.js" crossorigin="anonymous"></script>
<!--달력 css & js https://www.daterangepicker.com/ 라이브러리  -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="https://kit.fontawesome.com/ea36f2192f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/index.css">
<script type="text/javascript" src="/resources/js/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>



<title>Document</title>
</head>
<body>
   <container id="container">
   <div id="join">
      <div class="flex">
         <div class="popup">
            <div class="joinTitle">
               <div class="joinClose" onclick="joinClose()">
                  <i class="fas fa-times"></i>
               </div>
               회원 가입
            </div>
            <div class="joinCore" id="showJoin">
               <div class="mailJoin" onclick="mailJoin()">
                  <i class="far fa-envelope"></i> 이메일로 회원 가입
               </div>
               <div class="line">――――――――――――――――――――――――――――――――――</div>
               <div class="joinFooter">
                  이미 에어비앤비 계정이 있나요? <span class="jToL" onclick="javascript:joinClose();popupLogin();"> 로그인</span>
               </div>
            </div>

				<div class="joinCore" id="joinSubmit">
					
						<div class="joinCtnt">
								<div class="joinBox">
									<div><input type="hidden" id="checkE_mail" value="2"></div>
									<div>
										<input id="bubu" type="text" name="e_mail" placeholder="이메일 주소">
										<div>
										    <button type="button" onclick="return chkE_mail()" style="float: left;"></button>
											<div id="duplicationE_mailMsg"></div>
										</div>
									
										<div>
											<input id="nm" type="text" name="nm" placeholder="이름 (예: 홍길동)">
										</div>
										<div>
											<input id="c_pw" type="password" name="c_pw" placeholder="비밀번호 설정하기">
										</div>
									</div>
								
								<div id="birthTitle">생일</div>
								<div class="birthCtnt">만 18세 이상의 성인만 회원으로 가입할 수 있습니다. 생일은
									다른 에어비앤비 이용자에게 공개되지 않습니다.</div>
								<div class="joinBox">
									<input type="text" name="bir_day" id="bir_day"
										placeholder="생년월일 (예: 19900315)">
								</div>
								<div class="birthCtnt">
									에어비앤비의 회원 전용 할인, 추천 여행 정보, 프로모션 및 정책 변경사항을 이메일로 보내드립니다. 계정 관리의
									환경설정 또는 프로모션 알림에서 언제든지 메시지 수신을 거부할 수 있습니다.
									<div>
										<label><input type="checkbox"> 에어비앤비에서 보내는 마케팅
											메시지를 받고 싶지 않습니다.</label>
									</div>
								</div>
								<input onclick="chk()" type="button" class="mailJoin" value="가입하기">
							</div>
						</div>

				</div>
			</div>
		</div>
	</div>
	
   <div id="login">
      <div class="flex">
         <div class="popup">
            <div class="joinTitle">
               <div class="joinClose" onclick="loginClose()">
                  <i class="fas fa-times"></i>
               </div>
               로그인
            </div>
            <div class="joinCore">
               <form name="loginSubmit" action="/login" method="post">
                  <div class="joinCtnt">
                     <input type="text" name="e_mail" placeholder="이메일 주소"> 
                     <input type="password" name="c_pw" placeholder="비밀번호">
                     <input type="submit" class="mailJoin" value="로그인">
                  </div>
               </form>
               <div class="line">――――――――――――――――――――――――――――――――――</div>
               <div>
                  에어비앤비 계정이 없으세요? <span class="jToL" onclick="javascript:loginClose();popupJoin();">회원 가입</span>
               </div>
            </div>
         </div>
      </div>
   </div>


<nav id="core">
      <div>
         <a href="/aircnc"><img id="logo" src="/resources/img/mainlogo.png"></a>
      </div>
      <div id="menu">
         <li class="menuli">숙소</li>
         <li class="menuli">월 단위 숙박</li>
         <li class="menuli">체험</li>
         <li class="menuli">온라인 체험</li>
      </div>
      <div id="menubutton" onclick="myMenu()">
         <div>
            <img id="ham" src="/resources/img/bars-solid.svg">
         </div>
         <div id="profile">
            <img src="/resources/img/pimg.jpg">
         </div>
      </div>
      
      <div id="menuctnt">
      	 <c:if test="${loginUser == null }">
         	<li class="b" onclick="popupJoin()">회원가입</li>
         </c:if>
         <c:if test="${loginUser.i_user == null}">
		 	<li class="b" onclick="popupLogin()">로그인</li>
		 </c:if>
		 <c:if test="${loginUser.i_user != null}">
		 	<a href="/logout"><li class="b">로그아웃</li></a>
		 </c:if>
         <li class="b" onclick="goMsg()">메시지</li>
         <li class="b" onclick="goWish()">저장 목록</li>
         <div class="line">――――――――――――――――</div>
         <c:if test="${loginUser.i_user != null}">
         <li class="b" onclick="goHost()">숙소 호스트 등록</li>
         </c:if>
         <li>계정</li>
         <div class="line">――――――――――――――――</div>
         <li>도움말</li>
      </div>
      <div id="search">
         <li class="sli"><label>위치
               <div>
                  <input id="s_addr" class="searchin" type="text" onkeyup="goAddr()" placeholder="어디로 여행가세요?" />
               </div>
         </label></li>
         <li class="sli"><label>체크인
               <div>
                  <input id="searchin" class="searchin" type="text" value=""
                     placeholder="날짜 추가" readonly="readonly">
               </div>
         </label></li>
         <li class="sli"><label>체크아웃
               <div>
                  <input id="searchout" class="searchin" type="text" value=""
                     placeholder="날짜 추가" readonly="readonly">
               </div>
         </label></li>
         <li class="sli"><label>인원
               <div>
                  <button onclick="countDw(document.getElementById('dd'))">-</button>
                  <input id="dd" class="searchin" type="number" size="10" value="0">
                  <button onclick="countUp(document.getElementById('dd'))">+</button>
               </div>
         </label></li>
         	<li id="sbutton" onclick="goSearch()"><i class="fas fa-search"></i></li>
    </div>
</nav>
</container>
<script>
</script>

</body>
</html>