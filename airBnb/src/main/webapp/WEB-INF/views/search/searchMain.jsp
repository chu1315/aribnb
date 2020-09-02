<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/searchlist.css">
<script src="https://kit.fontawesome.com/ea36f2192f.js" crossorigin="anonymous"></script>
<!--달력 css & js https://www.daterangepicker.com/ 라이브러리  -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- searchlist  js -->
<script type="text/javascript" src="/resources/js/searchlist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>searMain</title>
</head>
<body onload="goMap()">
	
	<div class="container">
	<form action="/search/searchMain" method="get">
		<div class="search">
				위치 		<input 	id="s_addr"		name="addr" 	class="searchin"	type="text" 				value="${sData.addr}"	placeholder="어디로 여행가세요?">
            	체크인	<input 	id="searchin"	name="chin" 	type="text"			value="${sData.chin}"		placeholder="날짜 추가" 	readonly="readonly">
            	체크 아웃	<input 	id="searchout"	name="chout"	type="text" 		value="${sData.chout}"		placeholder="날짜 추가"	readonly="readonly">
            	인원		<button type="button"	onclick="countDw(document.getElementById('dd'))">-</button>
            			<input 	id="dd" 		name="qty"	class="searchin"	type="number"	size="10"	value="${(sData.qty!= 0) ? sData.qty : 0}" >
            			<button type="button" 	onclick="countUp(document.getElementById('dd'))">+</button>
            			<input 	type="submit" 	value="검색">
		</div>
	</form>
	<div class="content">
			<section class="list">
		    	<div>${sData.chin} - ${sData.chout } · 게스트 ${sData.qty}명</div>
				<h2>${sData.addr}숙소 </h2>
				<div>
					<button  onclick="filter_type()">숙소유형</button>
					<button  onclick="filter_fee()">요금</button>
					<button  onclick="filter()">필터 추가하기</button>
				</div>
				<div>예약에 앞서 여행 제한 사항을 확인하세요.정부의 여행 가이드라인을 확인하고 준수하세요.</div>
				
				<c:forEach items="${data}" var="item">
				<a href="/search/detail?i_host=${item.i_host}">
					<section class="m_ctnt">
			            <div class="slideshow">
			            	<div id ="s_${item.i_host}" class="slideshow-container">
									<c:forEach items="${item.list}" var ="item2"> 
										<div class="mySlides fade">
											<img src="${item2.img_url} " style="width:100%">
										</div>
									</c:forEach>
								
								<a class="prev" onclick="plusSlides(-1,${item.i_host})">&#10094;</a>
								<a class="next" onclick="plusSlides(1,${item.i_host})">&#10095;</a>
								
							</div>
						
							<div id="d_${item.i_host}" style="text-align:center">
								<c:set var ="cmtNo" value="1"/>
								<c:forEach items="${item.list}" var ="item2"> 
							  		<span class="dot" onclick="currentSlide(${cmtNo},${item.i_host})"></span> 
							  		<c:set var="cmtNo" value="${cmtNo+1 }"/>
							 	</c:forEach>
							</div>
			            </div>   
			           
			            <div class="sub_ctnt">
			               <div class="ms_ctnt">
			                   <div class="title">${item.room_title}</div>
			                   <i class="fas fa-heart" onclick="like(${item.i_host},${loginUser.i_user})" style="color:${(item.like_user == 0) ? 'gray' : 'red' };"></i>
			               </div>
			               <div class="sub_exp">침실 ${item.b_room}개 . 침대 ${item.bed_qty}개  . 욕실  ${item.bth_room}개 </div>
			               <div class="sub_sfee">
			                   <div class="sub_star">별점</div>
			                   <div class="sub_fee">
			                     <div class="fee"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${item.h_fee}" /></div>
			                     <div class="tt_fee"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${item.tt_fee}" /></div>
			                   </div>
			               </div>
			            </div>
			        </section>
			   </a> 
			     	<hr>
			   </c:forEach>
			</section>
			<iframe class="map" name="map" width="50%" scrolling="no" border="no" maginwidth="0" marginheight="0" frameborder="0"></iframe>
		</div>
	</div>
	<form  action="/search/searchMain" method="get">
		<input type="hidden" name="addr"	value="${sData.addr}">
		<input type="hidden" name="chin"	value="${sData.chin }">
		<input type="hidden" name="chout"	value="${sData.chout}">
		<input type="hidden" name="qty"		value="${sData.qty}">
		
		<div id="myModal" class="modal">
		     <div class="modal-content">
		    	 <span onclick="filter_close()" class="close">&times;</span>
		        <div><h2>필터 추가하기</h2></div>                   
		       <p>침실과 침대</p>
		       
		       <div>
		        <span>침대수</span> 														
		        <button type="button" onclick="searchDw(document.getElementById('bed_qty'))">-</button>
		        	<input type="number" id="bed_qty" name="bed_qty"  size="10" value="${(sData.bed_qty) != null ? sData.bed_qty : 0}" >
		         <button type="button" onclick="searchUp(document.getElementById('bed_qty'))">+</button> 
		       </div>
		      
		       <div>
		        <span>침실수</span> 
		        <button type="button" onclick="searchDw(document.getElementById('b_room'))">-</button>
		        	<input type="number" id="b_room" name="b_room" size="10" value="${(sData.b_room) != null ? sData.b_room : 0}" >
		         <button type="button" onclick="searchUp(document.getElementById('b_room'))">+</button> 
		       </div>
		      
		       <div>
		        <span>욕실수</span> 
		        <button type="button" onclick="searchDw(document.getElementById('bth_room'))">-</button>
		        	<input type="number" id="bth_room" name="bth_room" size="10" value="${(sData.bth_room) != null ? sData.bth_room : 0}" >
		         <button type="button" onclick="searchUp(document.getElementById('bth_room'))">+</button> 
		       </div>
		       <hr>
				<div>
					<h2>편의시설</h2>
					<div><input type="checkbox" class="f_ch" name="cooking" 	value="o" ${(sData.cooking) != null ? 'checked' : ''}>		주방			<input type="checkbox" class="f_ch" name="sampoo" 		value="o" ${(sData.sampoo) != null ? 'checked' : ''}> 		샴푸</div>
					<div><input type="checkbox" class="f_ch" name="hiter" 		value="o" ${(sData.hiter) != null ? 'checked' : ''}> 		난방 			<input type="checkbox" class="f_ch" name="aircon" 		value="o"  ${(sData.aircon) != null ? 'checked' : ''}> 		에어컨</div>
					<div><input type="checkbox" class="f_ch" name="waching" 	value="o" ${(sData.waching) != null ? 'checked' : ''}> 		세탁기 		<input type="checkbox" class="f_ch" name="drying" 		value="o" ${(sData.drying) != null ? 'checked' : ''}> 		건조기</div>
					<div><input type="checkbox" class="f_ch" name="wifi" 		value="o" ${(sData.wifi) != null ? 'checked' : ''}> 		무선 인터넷	<input type="checkbox" class="f_ch" name="breakfast"	value="o" ${(sData.breakfast) != null ? 'checked' : ''}> 	아침식사</div>
					<div><input type="checkbox" class="f_ch" name="in_hiter" 	value="o" ${(sData.in_hiter) != null ? 'checked' : ''}> 	실내 벽난로	<input type="checkbox" class="f_ch" name="hanger" 		value="o" ${(sData.hanger) != null ? 'checked' : ''}> 		옷걸이</div>
					<div><input type="checkbox" class="f_ch" name="iron" 		value="o" ${(sData.iron) != null ? 'checked' : ''}> 		다라미 		<input type="checkbox" class="f_ch" name="hiar_dry" 	value="o" ${(sData.hiar_dry) != null ? 'checked' : ''}> 	헤어드라이어</div>
					<div><input type="checkbox" class="f_ch" name="place_lattop"value="o" ${(sData.place_lattop) != null ? 'checked' : ''}> 노트북 작업 공간 <input type="checkbox" class="f_ch" name="tv" 			value="o" ${(sData.tv) != null ? 'checked' : ''}> 			TV</div>
					<div><input type="checkbox" class="f_ch" name="baby_bad" 	value="o" ${(sData.baby_bad) != null ? 'checked' : ''}> 	아기 침대 		<input type="checkbox" class="f_ch" name="baby_chairs"	value="o" ${(sData.baby_chairs) != null ? 'checked' : ''}> 	유아용 식탁의자</div>
					<div><input type="checkbox" class="f_ch" name="self_checkin"value="o" ${(sData.self_checkin) != null ? 'checked' : ''}> 셀프 체크인 	<input type="checkbox" class="f_ch" name="liviroom" 	value="o" ${(sData.liviroom) != null ? 'checked' : ''}> 	거실</div>
					<div><input type="checkbox" class="f_ch" name="piano" 		value="o" ${(sData.piano) != null ? 'checked' : ''}> 		피아노		<input type="checkbox" class="f_ch" name="carbon_alarm" value="o" ${(sData.carbon_alarm) != null ? 'checked' : ''}>	일산화탄소 경보기</div>
					<div><input type="checkbox" class="f_ch" name="fire_emble"	value="o" ${(sData.fire_emble) != null ? 'checked' : ''}> 	화재 경보기	<input type="checkbox" class="f_ch" name="madic_kit" 	value="o" ${(sData.madic_kit) != null ? 'checked' : ''}>	구급 상자</div>
					<div><input type="checkbox" class="f_ch" name="fire_exting" value="o" ${(sData.fire_exting) != null ? 'checked' : ''}> 	소화기		<input type="checkbox" class="f_ch" name="bad_lock" 	value="o" ${(sData.bad_lock) != null ? 'checked' : ''}>		침실 잠금장치</div>
					
				</div>
				<hr>
				<div>
					<h2>시설</h2>
					<div><input type="checkbox" class="f_ch" name="paking" 	value="o"  ${(sData.paking) != null ? 'checked' : ''}> 	주차장 	<input type="checkbox" class="f_ch" name="gym" 		 value="o" ${(sData.gym) != null ? 'checked' : ''}> 		헬스장</div>
					<div><input type="checkbox" class="f_ch" name="jacuzzi" value="o" ${(sData.jacuzzi) != null ? 'checked' : ''}> 	자쿠지 	<input type="checkbox" class="f_ch" name="swim_pool" value="o" ${(sData.swim_pool) != null ? 'checked' : ''}>	수영장</div>
					<div><input type="checkbox" class="f_ch" name="liviroom"value="o"${(sData.liviroom) != null ? 'checked' : ''}>  거실		
					<div><input type="checkbox" class="f_ch" name="waching" value="o" ${(sData.waching) != null ? 'checked' : ''}> 	세탁기 	<input type="checkbox" class="f_ch" name="drying" 	 value="o" ${(sData.drying) != null ? 'checked' : ''}>		건조기</div>
				</div>
				
				<hr>
				<div>
					<h2>건물 유형</h2>
					<div>
						<input type="checkbox" class="f_ch" name="apt" value="apt" ${(sData.apt) != null ? 'checked' : ''}> 아파트 
						<input type="checkbox" class="f_ch" name="outbuild" value="outbuild" ${(sData.outbuild) != null ? 'checked' : ''}> 별채
					</div>
				</div>
				 <hr>
				<div>
					<h2>숙소 이용규칙</h2>
					<div><input type="checkbox" class="f_ch" name="child_ok"	value="o" ${(sData.child_ok) != null ? 'checked' : ''}>		어린이(2~12세) 숙박에 적합함 	<input type="checkbox" class="f_ch" name="y_ch_ok"	value="o" ${(sData.y_ch_ok) != null ? 'checked' : ''}> 	유아(2세 미만) 숙박에 적합함</div>
					<div><input type="checkbox" class="f_ch" name="smoking"		value="o" ${(sData.smoking) != null ? 'checked' : ''}> 		흡연 가능 여부 				<input type="checkbox" class="f_ch" name="party" 	value="o" ${(sData.party) != null ? 'checked' : ''}> 	행사나 파티 허용</div>
					<div><input type="checkbox" class="f_ch" name="animal_ok" 	value="o" ${(sData.animal_ok) != null ? 'checked' : ''}>	반려 동물동반에 적합함 </div>
				</div>
				 <hr>
		     	<div>
		     		<button type="button" onclick="fiter_del()" >전체 삭제</button> 
		     		<input type="submit" value="숙소보기">
		     	</div>
		     </div>
		   </div>
		</div>
	    <!-- 숙소 유형 태그  -->
	    <div id="fiter_type" class="fiter_type">
		   	<span onclick="type_close()" class="close">&times;</span>
		   	<div>
		   		<p>집 전체</p>
		   		<input type="checkbox" name="all" class="f_tp" value="all" ${(sData.all) != null ? 'checked' : ''}>
		   	</div>
		   	<div>
		   		<p>개인 실</p>
		   		<input type="checkbox" name="single" class="f_tp" value="single" ${(sData.single) != null ? 'checked' : ''}>
		   	</div>
		   	<div>
		   		<p>다인 실</p>
		   		<input type="checkbox" name="share" class="f_tp" value="share" ${(sData.share) != null ? 'checked' : ''}>
		   	</div>
		   	<div>
		   		<button type="button" onclick="type_del()">지우기</button> 
		   		<input type="submit" value="숙소보기">
		   	</div>
		   </div>
		   <!-- 숙소 유형 태그  -->
		<div id="fiter_fee" class="fiter_fee">
		    	<span onclick="fee_close()" class="close">&times;</span>
		   	<div>
		   		<p>1박 평균 요금은 ~ 원 입니다.</p>
		   	</div>
		   	<div>
		   		<input type="range" class="f_fe" id="fee" name="fee" value="${sData.fee}" onchange="fevalue(this)" min="${sData.min_fee}" max="1000000">
		   		<input type="hidden" name="min_fee" value="${sData.min_fee}">
		   	</div>
		   	<hr>
		   	
		   	<div>
		   		<div>
		   			<label>최저 요금 </label>
		   			&nbsp;
		   			<label>최고 요금</label>
		   		</div>
		   		<div>
		   			<span><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sData.min_fee}" /></span>
		   			<span>~</span>
		   			<span id="fee_value">￦10,00,000</span>
		   		</div>
		   		<div>
		   			<label> </label>
		   		</div>
		   	</div>
		   	<div>
		   		<button type="button" onclick="fee_del()">지우기</button> 
		   		<input type="submit" value="숙소보기">
		   	</div>
		   </div>
	</form>
</body>
<script type="text/javascript">
	function goMap(){
		var url = "/search/map?addr="+'${sData.addr}'+"&chin="+'${sData.chin}'+"&chout="+'${sData.chout}'+"&qty="+'${sData.qty}';
		url +="&fire_emble="+'${sData.fire_emble}'+"&carbon_alarm="+'${sData.carbon_alarm}'+"&madic_kit="+'${sData.madic_kit}';
		url +="&fire_exting="+'${sData.fire_exting}'+"&bad_lock="+'${sData.bad_lock}'+"&apt="+'${sData.apt}'+"&outbuild="+'${sData.outbuild}';	
		url +="&all="+'${sData.all}'+"&single="+'${sData.single}'+"&share="+'${sData.share}';	
		url +="&fee="+'${sData.fee}'+"&min_fee="+'${sData.min_fee}'+"&b_room="+'${sData.b_room}'+"&bed_qty="+'${sData.bed_qty}';	
		url +="&bth_room="+'${sData.bth_room}'+"&liviroom="+'${sData.liviroom}';	
		url +="&cooking="+'${sData.cooking}'+"&waching="+'${sData.waching}'+"&drying="+'${sData.drying}';	
		url +="&paking="+'${sData.paking}'+"&gym="+'${sData.gym}'+"&swim_pool="+'${sData.swim_pool}';	
		url +="&jacuzzi="+'${sData.jacuzzi}'+"&child_ok="+'${sData.child_ok}'+"&y_ch_ok="+'${sData.y_ch_ok}';	
		url +="&smoking="+'${sData.smoking}'+"&animal_ok="+'${sData.animal_ok}'+"&party="+'${sData.party}';	
		url +="&requier="+'${sData.requier}'+"&aircon="+'${sData.aircon}'+"&sampoo="+'${sData.sampoo}';	
		url +="&hiter="+'${sData.hiter}'+"&in_hiter="+'${sData.in_hiter}'+"&wifi="+'${sData.wifi}';	
		url +="&breakfast="+'${sData.breakfast}'+"&hanger="+'${sData.hanger}'+"&iron="+'${sData.iron}';	
		url +="&hiar_dry="+'${sData.hiar_dry}'+"&place_lattop="+'${sData.place_lattop}'+"&tv="+'${sData.tv}';	
		url +="&baby_bad="+'${sData.baby_bad}'+"&baby_chairs="+'${sData.baby_chairs}'+"&self_checkin="+'${sData.self_checkin}';	
		url +="&self_bth_room="+'${sData.self_bth_room}'+"&piano="+'${sData.piano}'+"&door="+'${sData.door}';	
		
		document.map.location=url;
		
	}
	
	// 화면 upload시 처음 이미지 표기 
	<c:forEach items="${data}" var="item">
		// /resources/js/list.js파일 함수 호출 합니다. 
		showSlides(slideIndex,"${item.i_host}");
	</c:forEach>
	
</script>
	
	
</html>