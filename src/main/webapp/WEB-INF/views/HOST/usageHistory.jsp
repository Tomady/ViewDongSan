<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.about_img{
	width: 450px;
	float:left;
}
.row{
	width: 420px;
	display: inline-block;
	margin-left: 50px;
}
</style>
</head>

<body>
	<fieldset>

		<legend id="legend">Usage History</legend>
		<c:forEach items="${usageHistory }" var="history">
			<div class="row" data-roomId="${roomId}">

				<div class="about_img">
					<img src="upload/${history.roomImg }" width="400px">
				</div>
				<br>
				<div class="about_text">
					<h2 class="roomName" style="cursor: pointer;" onclick="move(this)">${history.roomName }</h2>
					<h5>${fn:substring(history.checkIn,0,10 ) } ~
						${fn:substring(history.checkOut,0,10) }</h5>
					
					<p>이용게스트 : ${history.guestId }</p>
				</div>
			</div> <!-- end of row-->
		</c:forEach>

	</fieldset>
</body>
</html>