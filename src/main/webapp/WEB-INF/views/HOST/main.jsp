<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOST MAIN</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 이미지 슬라이드 -->
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&display=swap" rel="stylesheet">
<!-- 달력 -->
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/ko.js'></script>

<style>
.visual img {
	width: 600px;
	height: 400px;
	padding-left: 110px;
}

.visual {
	position: relative;
	width: 800px;
}

.visual button {
	position: absolute;
	z-index: 10;
	top: 40%;;
	transform: translateY(-50%);
	border: none;
}

.visual button:before {
	font-family: 'xeicon';
	color: navy;
	font-size: 40px;
}

.visual button.slick-prev {
	left: 0;
	font-size: 0;
	color: transparent;
}

.visual button.slick-prev:before {
	content: "\e93d";
}

.visual button.slick-next {
	right: 0;
	font-size: 0;
	color: transparent;
}

.visual button.slick-next:before {
	content: "\e940";
}

.roomlist_title, .room_info, .calendar_title {
	margin-left: 110px;
}

#calendar {
	width: 800px;
	margin-left: 110px;
}

.btn {
	width: 110px;
	display: flex;
	margin-left: 350px;

}

.roomlist_title p, .calendar_title p {
	font-family: 'Amiri', serif;
	font-size: 40px;
	margin-bottom: 20px;
	margin-top: 20px;
	color: navy;
}
.hover1, .hover2{
	border: 1px solid navy;
    color: navy;
    background-color: rgb(252, 249, 245);
    width: 75px;
    height: 35px;
    border-radius: 15px;
    font-weight: bold;
    display: inline-block;
    cursor: pointer;
}
#roomimg{
	width:
}
</style>
</head>

<body>
	<div class="roomlist_title">
		<p>${id }'s Rooms List</p>
	</div>
	<section class="visual">
		<c:forEach items="${rooms }" var="room">
			<div class="real">
				<img src="upload/${room.roomImg }" id="roomimg">
				<div class="room_info">
					<h3>${room.roomName }</h3>${room.roomAddress }</div>
				<div class="btn">
					<input type="button" class="hover1" onclick="location.href='editRoom.do?roomId=${room.roomId}'" value="수정">&nbsp;&nbsp; 
					<input type="button" class="hover2" onclick="roomDelete('${room.roomId}')" value="삭제">
				</div>
			</div>
		</c:forEach>
	</section>

	<br>
	<div class="calendar_title">
		<p>Monthly Reservation</p>
	</div>
	<div id='calendar'></div>
	<br>

	<script type="text/javascript">
		console.log("dd" + '${result}');
	
		function roomDelete(roomId) {
			console.log(roomId);
			$.ajax({
				url : "roomDelete.do",
				type : "post",
				data : {
					roomid : roomId
				},
				dataType : "text",
				success : function(data) {
					if (data == "true") {
						alert("삭제 완료");
						location.href = "hostMain.do";
					}
				},
				error : function() {
					alert("삭제 실패");
				}
			})
		}
	</script>
	<script type="text/javascript">
		$('.visual').slick({});
	</script>
	<script>
	// $(document).ready(function(){}) 이걸 써도 된다..
	 document.addEventListener('DOMContentLoaded', function() {
		 	
		 	let eData = [];
		 	<c:forEach items="${calrv}" var="item">
		 		console.log('${item.checkIn}');
		 		var info = {
		 				title: '${item.roomName}',
		 				start: '${item.checkIn}',
		 				end: '${item.checkOut}'
		 		}
		 		eData.push(info);

		 	</c:forEach>
		 	
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialDate: '2021-12-12',
		      locale: 'ko',
		      editable: true,
		      selectable: true,
		      businessHours: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: eData
		    });

		    calendar.render();
		  });


    </script>
</body>
</html>