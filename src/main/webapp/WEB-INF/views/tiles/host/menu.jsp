<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Side</title>
<style>
#menuList {
	padding-left: 25px;
	margin-top: 20px;
	margin-bottom: 50px;
}

#menuList li {
	list-style: none;
	font-size: 20px;
	color: gray;
}

#menuList li:hover {
	color: coral;
	cursor: pointer;
}


</style>
</head>
<body>
	
	<div id="menu_wrap" name="menu_wrap">

		<ul id="menuList" name="menuList">
			<li onclick="location.href='hostMain.do'">Host Main</li>
			<br>
			<li onclick="location.href='addRoom.do'">Hosting Room</li>
			<br>
			<li onclick="location.href='reservation.do'">Reservation</li>
			<br>
			<li onclick="location.href='hostSales.do'">Sales</li>
			<br>
			<li onclick="location.href='hostUsageHistory.do'">History</li>
			<br>
			<li onclick="location.href='hostMyPage.do'">Mypage</li>
			<br>
			<li>──────</li>
			<br>
			<li onclick="location.href='guestMain.do'" id="homebtn">Home</li>
			<br>
			<li onclick="location.href='logout.do'" id="logout">Logout</li>
		</ul>
	</div>

</body>
</html>