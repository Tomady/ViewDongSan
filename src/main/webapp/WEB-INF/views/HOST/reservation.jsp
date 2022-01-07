<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
td>img {
	width: 400px;
	height: 250px;
	cursor: pointer;
}

.tb {
	margin-left: 200px;
	padding-left: 50px;
	padding-right: 50px;
}

.tb:not(:last-of-type) {
	border-bottom: 2px solid wheat;
}

.tb:not(:first-of-type) {
	padding-top: 50px;
}

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

td {
	text-align: center;
}

#roomname h2 {
	margin-bottom: 5px;
}

#roomaddress h3 {
	margin-top: 5px;
}
</style>


</head>
<body>
	<div class="wrap">
		<fieldset>
			<legend id="legend">Reservation List</legend>
			<c:forEach items="${rooms }" var="room">
				<table class="tb">
					<tr>
						<td rowspan="3"><img src="upload/${room.roomImg }"
							onclick="location.href='rvDetail.do?roomId=${room.roomId}'"></td>
						<td width="100" height="30"><h3>예약대기</h3></td>
						<td><h3 id="rvw" data-roomid="${room.roomId }"></h3></td>
					</tr>
					<tr>
						<td height="40"><h3>예약완료</h3></td>
						<td><h3 id="rvd" ></h3></td>
					</tr>
					<tr>
						<td height="40"><h3>예약취소</h3></td>
						<td><h3 id="rvc"></h3></td>
					</tr>
					<tr id="roomname">
						<td colspan="3"><h2>${room.roomName }</h2></td>
					</tr>
					<tr id="roomaddress">
						<td colspan="3"><h3>${room.roomAddress }</h3></td>
					</tr>
				</table>
			</c:forEach>
		</fieldset>
	</div>
	<!-- end of wrap -->
	<script type="text/javascript">
	for(let i=0; i<rvw.length; i++){
		let roomid = rvw[i].getAttribute("data-roomid");
		console.log(roomid);
		$.ajax({
			url:"selectListRv.do",
			type:"post",
			data:{
				"roomId": roomid
			},
			dataType: "text",
			success: function(data) {
				let array = data.split(",");
				
				array.forEach(function(val, ind) {
					console.log(val);
					let colon = val.indexOf(":");
					let sumNum = val.substring(colon+1);
					
					if(val[0] == 'w' ){
						rvw[i].innerHTML = sumNum + "팀";
					}else if(val[0] == 'c'){		
						rvc[i].innerHTML = sumNum + "팀";
					}else if(val[0] == 'd'){
						rvd[i].innerHTML = sumNum + "팀";
					}
						
				});	
			},
			error: function() {
				console.log("에러");
			}
		});
	
	 } 
	
</script>
</body>
</html>