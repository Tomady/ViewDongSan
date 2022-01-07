<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sidemenu {
	border: 2px solid grey;
	border-radius: 10px;
	height: 500px;
}

.row, #profile, #pictureUpload {
	margin-top: 20px;
}

#menu {
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 17px;
}

#mypagecontent {
	font-size: 30px;
}
.single-input{
	font-size: 20px;
}
#label{
	color:rgb(248, 144, 25);
	font-weight: bold;
}
#menu:hover{
	color:rgb(248, 144, 25);
	font-weight: bold;
	cursor:pointer;
}
#drop{
	color:red;
}
#drop:hover{
	font-weight: bold;
	cursor:pointer;
}
#saveBtn{
	float:right;
}
.file-label{
	margin-top:10px;
	color:gray;
	font-weight: bold;
	text-align:center;
}
.file-label:hover{
	cursor: pointer;
	color:white;
	font-weight: bold;
	background-color:rgb(248, 144, 25);
}
.file{
	display:none;
}
#uploadBtn{
	background-color:white;
	border:white 1px solid;
	color:gray;
	font-weight: bold;
}
#uploadBtn:hover{
	background-color:rgb(248, 144, 25);
	border:white 1px solid;
	color:white;
	font-weight: bold;
}
#imgfile{
	width:250px;
	height:250px;
}
#icon{
	width:30px;
	height:30px;
}

</style>
<script type="text/javascript">
	function test() {
		let guestid = $("#guestid").val();
		var form = new FormData();
		form.append("file",$("#chooseFile")[0].files[0]);
		form.append("id",guestid);
		console.log("ffff");
		
		$.ajax({
			url : "AjaxProfileUpload.do",
			type: "post",
			enctype : "multipart/form-data",
			cache : false,
			processData : false,
			contentType : false,
			data : form, 
			success : function(data){
				console.log(data);
				$("#imgfile").attr("src",data);
				$("#imgView").show();
			},
			error : function() {
				console.log("fail");
			}
		})
	}
	
	$("#chooseFile").change(function(){
		let guestid = $("#guestid").val();
		var form = new FormData();
		form.append("file",$("#chooseFile")[0].files[0]);
		form.append("id",guestid);
		console.log("dddd");
		
		$.ajax({
			url : "AjaxProfileUpload.do",
			type: "post",
			processData : false,
			contentType : false,
			data :form,
			success : function(data){
				console.log(data);
				$("#imgfile").attr("src",data);
				$("#imgView").show();
			},
			error : function() {
				console.log("fail");
			}
		})
	})
	
	//정보수정
	function saveFnc(){
		let guestid = $("#guestid").val();
		let guestPw = $("#guestpw").data("pw");
		let guestName = $("#guestname").data("name");
		let guestTel = $("#guesttel").data("tel");
		let guestAddr = $("#guestaddr").data("addr");
		
		if($("#guestpw").val() != ""){
			guestPw = $("#guestpw").val();
		}
		if($("#guestname").val() != ""){
			guestName = $("#guestname").val();
		}
		if($("#guesttel").val() != ""){
			guestTel = $("#guesttel").val();
		}
		if($("#guestaddr").val() != ""){
			guestAddr = $("#guestaddr").val();
		}
		
		$.ajax({
			url:"AjaxMyinfoUpdate.do",
			type:"POST",
			data:{
				id:guestid,
				pw:guestPw,
				name:guestName,
				tel:guestTel,
				addr:guestAddr
			},
			dataType : "json",
			success:function(data){
				alert("회원정보 수정이 완료되었습니다.");
				location.href="myPage.do";
			},
			error:function(){
				alert("회원정보 수정이 실패하였습니다.");
			}
		});
	}
	
	//회원탈퇴
	function dropFnc(){
		let guestid = $("#guestid").val();
		var answer = confirm("정말 탈퇴하실건가요...?");
		if(answer){
			$.ajax({
				url:"AjaxDropGuest.do",
				type:"POST",
				data:{
					id:guestid
				},
				dataType: "text",
				success:function(data){
					if(data=="DeleteOK"){
						alert("탈퇴..성공적... bye..★");
						location.href="guestMain.do";
					}
				}
			})
		}else{
			alert("감사합니다! 저희가 더 잘할게요 0_<-★");
		}
	}
	
	//위시리스트 가기
	function toWishFnc(){
		location.href="toWishList.do";
	}
	
</script>
</head>
<body>
	<!-- sidebar : 예약내역,위시리스트,내가작성한후기 -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-3 col-md-4 mt-sm-30">
						<div class="single-element-widget">
							<h1>My Page</h1><br>
							<div class="img-fluid" id="imgView">
								<img id="imgfile" src="upload/${guest.gimg}" class="img-fluid">
							</div>
								<label class="file-label" for="chooseFile">📷 프로필 선택</label>
								<input class="file" id="chooseFile" type="file">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="uploadBtn" onclick="test()">
									<img src="img/icon/업로드.png" id="icon">UP
								</button>
							<h1>&nbsp;-</h1>				
							<span id="menu" onclick="location.href='guestReservationMove.do'">&nbsp;&nbsp;&nbsp;예약내역</span><br>
							<span id="menu" onclick="toWishFnc()">&nbsp;&nbsp;&nbsp;위시리스트</span><br>
							<h1>&nbsp;-</h1>
							<span id="drop" onclick="dropFnc()">&nbsp;&nbsp;&nbsp;회원탈퇴</span><br>
						</div>
					</div>
					<div class="col-lg-8 col-md-8">
						<br><br><br><br>
						<h3 class="mb-30">MY INFO</h3>
							<div class="mt-10">
								<span id="label">ID</span>
								<input type="text" name="first_name" class="single-input"
									   id="guestid" value="${guest.guestId}" readonly>
							</div>
							<div class="mt-10">
								<span id="label">PW</span>
								<input type="password" name="last_name" class="single-input" 
									   id="guestpw" value="${guest.gpassword}" 
									   placeholder="비밀번호"  data-pw="${guest.gpassword}">
							</div>
							<div class="mt-10">
								<span id="label">NAME</span>
								<input type="text" name="last_name" class="single-input" 
									   id="guestname" value="${guest.gname}" 
									   placeholder="이름"  data-name="${guest.gname}">
							</div>
							<div class="mt-10">
								<span id="label">TEL</span>
								<input type="text" name="tel" class="single-input"
									   id="guesttel" value="${guest.gtel}" 
									   placeholder="전화번호"  data-tel="${guest.gtel}">
							</div>
							<div class="mt-10">
								<span id="label">ADDRESS</span>
								<input type="text" name="address" class="single-input"
									   id="guestaddr" value="${guest.gaddress}" 
									   placeholder="주소"  data-addr="${guest.gaddress}">
							</div>
						<br>
						<br> 
						<button class="genric-btn primary-border circle" id="saveBtn" onclick="saveFnc()">SAVE</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>