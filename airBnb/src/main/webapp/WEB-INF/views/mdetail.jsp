<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지창</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.sender{
	 background-color: #bcbcbc;
	 text-align: left;
	}
	
	.reciver{
	background-color: rgb(252, 242, 40);
	text-align: right;
	}
</style>
</head>
<body>
	<!-- <div><a href="/aircnc/message">돌아가기</a></div> -->
	<table>
		<tr>
			<th>내용</th>
			<th>시간</th>
			<th>글쓴이</th>
			<th>i_mlist</th>
		</tr>
		<c:forEach var="item" items="${msgDetailList}">
			<c:if test="${item.i_user == loginUser.i_user}">
				<tr class="sender">
			</c:if>
		
			<c:if test="${item.i_user != loginUser.i_user}">
				<tr class="resiver">
			</c:if>
				<td>${item.cmt}</td>
				<td>${item.m_dt}</td>
				<td>${item.i_user}</td><!-- 여기서 i_user의 값이 나의 loginUser의 i_user값이 아닌경우 왼쪽 맞으면 오른쪽 -->
				<td>${item.i_mlist}</td>
				<td>${item.host_num}</td>
			</tr>
		
		</c:forEach>
	</table>
			<div>
				<form id="sendMsg" action= "/aircnc/mdetail" method="POST">
					<div><input type="text" name="cmt"><button onclick ="return chk()">전송</button></div>
				</form>
			</div>
	
	
<script>
function chk(){
	if(sendMsg.cmt.value == '' || sendMsg.cmt.value.length == 0){
		alert('메시지를 입력해주세요')
		return false;
	}
}


</script>
</body>
</html>