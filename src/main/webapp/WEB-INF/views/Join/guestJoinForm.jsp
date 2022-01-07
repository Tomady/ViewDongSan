<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
body {
	background-repeat: no-repeat;
	background-image: url('img/dy/event_bg.png');
	background-repeat: no-repeat;                                    
	background-size: auto;
}

p {
	display: inline-block;
}
</style>
</head>
<body>
	<script type="text/javascript">
		function CheckEmail(str) {	<!-- email 정규식 -->
			var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(!reg_email.test(str)) {
				return false;
			} else {
				return true;
			}
		}
		
		function idCheck() {
			var id = $('#guestId').val();
			
			if(!CheckEmail(id)) {
				alert('Email을 입력하세요.');
				$('#guestId').val("");
				$('#guestId').focus();
				return;
			}
		
			$.ajax({
				url: "ajaxIdCheck.do",
				type: "post",
				data: {chkId: id},
				dataType: "text",
				success: function(data) {
					console.log(data);
					
					if(data == 'true') {
						alert(id + "는 사용할 수 있는 아이디 입니다.");
						$('#idChk').val('Yes');
						$('#idChk').attr('disabled',true);
						$('#guestId').attr('readonly',true);
						
						$('#gpassword').focus();
					} else {
						alert(id + "는 이미 존재하는 아이디 입니다.");
						$('#guestId').val("");
						$('#guestId').focus();
					}
				},
				error: function() {
					console.log("실패");
				}
			});		
		}
		
		function formCheck() {
			if($('#idChk').val() != 'Yes') {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if($('#gpassword').val() != $('#gpasswordChk').val()) {
				alert("비밀번호가 일치 하지 않습니다.");
				$('#gpassword').val("");
				$('#gpasswordChk').val("");
				$('#gpassword').focus();
				
				return false;
			}
			
			if($("#gaddress").val() == null|| $("#gtel").val() == null|| $("#guestId").val() == null 
					|| $("#gpassword").val() == null || $("#gpasswordChk").val() == null || $("#gname").val() == null ) {
				alert("모든 항목은 필수입력항목입니다.");
				location.href="guestJoinForm.do";
			}else{
			$('#frm').submit();
			}
			
		}
	</script>

	<div style="float: left; width: 50%;" align="center">
		<div style="color: white; margin-top: 80px;">
			<h1>View DongSan</h1>
		</div>
		<div style="color: white">
			<h3>회 원 가 입</h3>
		</div>
	</div>
	<div style="float: left; width: 50%;" align="center">
		<div align="left" style="background-color: white; padding: 10px; width: 350px; margin-top: 80px;">
			<div align="center" style="color: orange">
				<h2>게스트 회원가입</h2>
			</div>
			
			<form id="frm" action="memberInsert.do" method="post">
				<div>
					<span>아이디</span>
					<p style="color: red;">*</p><br>
					<c:if test="${kakaoid eq null }">  <input id="guestId" name="guestId" type="text" size="46px" required="required" placeholder="email을 입력하세요."></c:if>
					<c:if test="${kakaoid ne null }">  <input id="guestId" name="guestId" type="text" size="46px" required="required" value='${ kakaoid}' style="background-color: rgba(150, 205, 235, 0.521);"readonly></c:if>
					<c:if test="${kakaoid eq null }"><button type="button" id="idChk" onclick="idCheck()" value="No">중복체크</button></c:if>
				</div>
				<div>
					<span>비밀번호</span>
					<p style="color: red;">*</p>
					<span style="margin-left: 100px">비밀번호 확인</span>
					<p style="color: red;">*</p><br>
					<input type="password" id="gpassword" name="gpassword" required="required" placeholder="비밀번호를 입력하세요.">
					<input type="password" id="gpasswordChk" name="gpasswordChk" required="required" placeholder="비밀번호를 입력하세요.">
				</div>
				<div>
					<span>이 름</span>
					<p style="color: red;">*</p><br>
					
					<c:if test="${kakaoid ne null }"><input type="text" id="gname" name="gname" size="46px" required="required" value="${kakaoname }" ></c:if>
					<c:if test="${kakaoid eq null }"><input type="text" id="gname" name="gname" size="46px" required="required" placeholder="이름을 입력하세요."></c:if>
				</div><br>
				<div>
					<span>주 소</span>
					<p style="color: red;">*</p><br>
					<input type="text" id="gaddress" name="gaddress" size="46px" required="required" style="margin-top: 15px;" placeholder="주소를 입력하세요.">
				</div><br>
				<div>
					<span>전화번호</span>
					<p style="color: red;">*</p><br>
					<input type="text" id="gtel" name="gtel" size="46px"  required="required" style="margin-top: 15px;" placeholder="전화번호를 입력하세요.">
				</div>
				<div>
					<input type="hidden" id="author" name="author" value="guest">
				</div>
				<div align="center" style="margin-top: 50px;">
					<button id="join" onclick="formCheck()">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset">취 소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>