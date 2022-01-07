<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn1").click(function(){
			frm.action = "roomUpdate.do";
			frm.submit();
		});
		$("#btn2").click(function(){
			frm.action="hostMain.do";
			frm.submit();
		});
	});
</script>
</head>
<body>
	<div><h1>숙소 정보 수정</h1></div>
	<div class="outerwrap">
	<form id="frm" method="post" enctype="multipart/form-data">
	
	<div class="innerwrap">
		
		<table>
			<tr>
				<th>룸아이디</th>
				<td><p>${room.roomId}</p></td>
			</tr>
			<tr>
				<th>대표사진</th>
				<td><input type="file" id="file" name="file" value="${room.roomImg}"></td>
			</tr>
			<tr>
				<th>숙소명</th>
				<td><input type="text" id="roomname" name="roomname" value="${room.roomName}"></td>
			</tr>
			<tr>
				<th>숙소 소개</th>
				<td><input type="text" id="roomsubject" name="roomsubject" value="${room.roomSubject }"></td>
			</tr>
			<tr>
				<th>1박 비용</th>
				<td><input type="text" id="roomprice" name="roomprice" value="${room.roomPrice }"></td>
			</tr>
			<tr>
				<th>위치</th>
				<td><input type="text" id="roomaddress" name="roomaddress" value="${room.roomAddress }"></td>
			</tr>
			
		</table>
		
	</div> <!-- end of innerwrap -->

	<br>
	<div>
		<button type="button" id="btn1">저 장</button>&nbsp;&nbsp;&nbsp;
		<button type="button" id="btn2">취 소</button>
	</div>
	</form>
	</div> <!-- end of outerwrap -->
</body>
</html>