<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Libre+Barcode+39+Extended+Text&display=swap" rel="stylesheet">
<style>

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	text-align: center;
	width: 5em;
	
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: tomato;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: tomato;
}

.txt {
	width: 800px;
}
.title p{
	font-family: 'Libre Barcode 39 Extended Text', cursive;
	font-size: 70px;
	color: black;
	margin-top: 100px;
	margin-bottom: 20px;
}
.imgbox{
	width: 450px;
	margin-left: 360px;
	margin-right: 50px;
	float:left;
}
.titleheart{
	float: left;
	height: 320px;
	
}
.heartbox{
	padding-left: 20px;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="imgbox">
		<img src="https://www.hanbit.co.kr/data/editor/20200212093954_xwiqafed.jpg" width="400px">
	</div>
	<div class="titleheart">
		<div class="title">
			<p>REVIEW</p>
		</div><br>
		<div class="heartbox">
			<div class="star-rating space-x-4 mx-auto">
				<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
				<label for="5-stars" class="star pr-4">❤</label>
				<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" />
				<label for="4-stars" class="star">❤</label>
				<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" />
				<label for="3-stars" class="star">❤</label>
				<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" />
				<label for="2-stars" class="star">❤</label>
				<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				<label for="1-star" class="star">❤</label>
			</div>
			<input type="hidden" id="roomId" value="${roomId }">
		</div>
	</div>

	<div class="txtbox" align="center">
		<textarea class="txt" name="message" id="message" cols="30" rows="9"
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = 'Enter Message'"
			placeholder='Enter Message'>
		</textarea>
		<br>	
		<br>
		<button type="button" class="button button-contactForm btn_1" onclick="save()">저장하기</button>
		<br>
		<br>
	</div>
	
	<script type="text/javascript">
		function save() {
			let message = document.getElementById("message").value;
			let rate = $('input[name=rating]:checked').val();
			let roomId = $('#roomId').val();

			$.ajax({
				url: "ajaxWrite.do",
				type: "post",
				data: {
					message: message,
					rate: rate,
					roomId: roomId
				},
				dataType: "text",
				success: function(data) {
					if(data == "true") {
						alert("리뷰 작성이 완료되었습니다.");
						location.href = "guestMain.do";
					}
				},
				error: function() {
					aleart("(오류) 리뷰 작성 실패!\n관리자에게 문의하세요.");
				}
			});
		}
	</script>
</body>
</html>