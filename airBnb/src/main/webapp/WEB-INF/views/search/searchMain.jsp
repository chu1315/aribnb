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

<style>
html, body{
    margin: 0;
    padding: 0;
    height: 100%;
    background-color: white;
}


</style>

</head>
<body onload="goMap()">
	
	<div class="container">
		<form action="/search/searchMain" method="get">
			<div class="search">
					위치 <input id="s_addr" name="addr" class="searchin"type="text" value="${sData.addr}" placeholder="어디로 여행가세요?">
	            	   <input type="submit" value="검색">
			</div>
		</form>
	</div>
	
</body>

<script>
	
</script>
</html>