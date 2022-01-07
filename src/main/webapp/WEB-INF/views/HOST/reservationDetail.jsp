<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소별 예약 상세</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=Do+Hyeon&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>


<style>
	#legend {
		font-family: 'Amiri', serif;
		font-size: 40px;
		color: navy;
	}
	
	fieldset {
		border: 2px solid navy;
		font-family: 'IBM Plex Sans KR', sans-serif;
		color: navy;
		width: 1000px;
	}
	.tb{
		width: 800px;
		padding-left: 200px;	
	}
	.tb td{
		text-align: center;
		
	}
	#backbtn{
		margin-left: 470px;
		margin-top: 40px;
		margin-bottom: 20px;
		background-color: rgb(252, 249, 245);
		color: navy;
		border: 2px solid navy;
		cursor: pointer;
	}
	#roomimg{
		margin-left: 200px;
		margin-bottom: 30px;
		float:left;
		width: 420px;
	}
	#roomname p{
		padding-top: 95px;
		font-size: 45px;
		font-family: 'Do Hyeon', sans-serif;
	}
	
</style>
</head>
<body>
	<fieldset>
		<legend id="legend">Reservation Status</legend>
		<div>
		<div id="roomimg">
			<img src="upload/${rdlist[0].roomImg }" width="400px">
		</div>
		<div id="roomname">
			 <p>${rdlist[0].roomName }</p>
		</div>
			<input type="hidden" value="${rdlist[0].roomId }" name="roomId">
			<table class="tb">
				<thead>
					<tr>
						<th>ROOM ID</th>
						<th>GUEST ID</th>
						<th>CHECK IN</th>
						<th>CHECK OUT</th>
						<th>STATUS</th>
						<!-- <th>STATUS</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rdlist }" var="rd">
						<tr onmouseover="this.style.background='wheat';"
							onmouseleave="this.style.background='rgb(252, 249, 245)';">
							<td>${rd.roomId }</td>
							<td>${rd.guestId }</td>
							<td>${rd.checkIn }</td>
							<td>${rd.checkOut }</td>
							<td>${rd.status }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		<button type="button" onclick="location.href='reservation.do'" id="backbtn">예약목록</button>
	</fieldset>

</body>
</html>