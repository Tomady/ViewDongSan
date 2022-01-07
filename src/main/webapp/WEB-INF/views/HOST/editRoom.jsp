<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소정보 수정 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

.left_part {
	float: left;
	width: 400px;
	margin-left: 150px;
	margin-right: 50px;
}

th {
	text-align: left;
	margin-bottom: 15px;
	height: 35px;
}

input[type="text"] {
	width: 300px;
	height: 30px;
	background-color: rgb(236, 233, 233);
	border: none;
	margin-left: 20px;
}

tr {
	height: 6px;
}

button {
	border: 1px solid navy;
	color: navy;
	background-color: rgb(252, 249, 245);
	width: 60px;
	height: 25px;
	border-radius: 15px;
	font-weight: bold;
}

.btnbox {
	margin-left: 100px;
	margin-bottom: 50px;
}

.upload_sub {
	display: flex;
	margin-top: 65px;
}

.upload_sub p:first-child {
	font-weight: bold;
}

#btn3 {
	margin-left: 50px;
}
</style>
</head>
<body>
	<fieldset>
		<form id="frm" method="post" enctype="multipart/form-data">
			<legend id="legend">Edit My Room</legend>
			<div class="left_part">
				<h2>룸아이디 ${room.roomId}</h2>
				<input type="hidden" value="${room.roomId }" name="roomId">

				<table>
					<tr>
						<th>대표사진</th>
						<td><input type="file" id="file" name="file"
							value="${room.roomImg}"></td>
					</tr>
					<tr>
						<th>숙소명</th>
						<td><input type="text" id="roomname" name="roomName"
							value="${room.roomName}"></td>
					</tr>
					<tr>
						<th>숙소 소개</th>
						<td><input type="text" id="roomsubject" name="roomSubject"
							value="${room.roomSubject }"></td>
					</tr>
					<tr>
						<th>1박 비용</th>
						<td><input type="text" id="roomprice" name="roomPrice"
							value="${room.roomPrice }"></td>
					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" id="roomaddress" name="roomAddress"
							value="${room.roomAddress }"></td>
					</tr>
				</table>
				<br> <br>
				<div class="btnbox">
					<button type="button" id="saveBtn">저 장</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" id="btn2">취 소</button>
				</div>
			</div>
		</form>

		<form id="mulfrm" action="multi_fileUpload.do" method="post" enctype="multipart/form-data">
			<div class="right_part">
				<div class="upload_sub">
					<p>숙소 이미지 등록</p>
					&nbsp;
					<p>(최대 5개)</p>
				</div>
				<input type="hidden" value="${room.roomId }" name="roomId">
				<input type="file" name="files" multiple /> <br> <br>
				<button type="button" id="multi_upload">업로드</button>
			</div>
		</form>
	</fieldset>

	<script type="text/javascript">
		$(function() {
			$("#saveBtn").click(function() {
				frm.action = "roomUpdate.do";
				frm.submit();
			});
			
			$("#btn2").click(function() {
				location.href = "hostMain.do";
			});
			
			$("#multi_upload").click(function() {
				mulfrm.submit();
			});
		});
	</script>
</body>
</html>