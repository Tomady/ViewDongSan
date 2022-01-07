<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script type="text/javascript">
		function login() {
			var id = document.querySelector('#id');
			var pw = document.querySelector('#pw');

			if (id.value == "" || pw.value == "") {
				alert("로그인 할 수 없습니다.");
				location.href = "Login.do";
			}else if (id.value == "" && pw.value == "") {
				alert("로그인 할 수 없습니다.");
				location.href = "Login.do";
			}

		}
	</script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: "Noto Sans KR", sans-serif;
		}

		body {
			max-width: 100%;
			height: auto;
			background-image: url('resources/image/login.PNG');
			background-repeat: no-repeat;
			background-size: cover;
		}

		a {
			text-decoration: none;
			color: black;
		}

		li {
			list-style: none;
		}

		.wrap {
			top: 30px;
			width: 100%;
			height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			background: rgba(0, 0, 0, 0.1);
		}

		.login {
			position: absolute;
			width: 30%;
			height: 600px;
			background: rgba(204, 191, 191, 0.753);
			border-radius: 20px;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}

		h2 {
			color: white;
			top: 20px;
			white-space: nowrap;
			font-size: 2em;
			width: 100%;
		}

		h4 {
			color: rgb(65, 64, 64);
			top: 20px;
			white-space: nowrap;
		}

		.login_id {
			margin-top: 20px;
			width: 80%;
		}

		.login_id input {
			width: 100%;
			height: 50px;
			border-radius: 30px;
			margin-top: 10px;
			padding: 0px 20px;
			border: 1px solid lightgray;
			outline: none;
		}

		.login_pw {
			margin-top: 20px;
			width: 80%;
		}

		.login_pw input {
			width: 100%;
			height: 50px;
			border-radius: 30px;
			margin-top: 10px;
			padding: 0px 20px;
			border: 1px solid lightgray;
			outline: none;
		}

		.submit {
			margin-top: 50px;
			width: 80%;
		}

		#loginfo {
			width: 40%;
			height: 40px;
			border: 0;
			outline: none;
			border-radius: 40px;
			background: linear-gradient(to left, rgba(96, 187, 247, 0.349),
					rgba(154, 252, 192, 0.404));
			color: white;
			font-size: 1.2em;
			letter-spacing: 2px;
		}

		#userinsert {
			width: 40%;
			height: 40px;
			border: 0;
			outline: none;
			border-radius: 40px;
			background: linear-gradient(to left, rgba(96, 187, 247, 0.349),
					rgba(154, 252, 192, 0.404));
			color: white;
			font-size: 1.2em;
			letter-spacing: 2px;
		}

		#kakao {
			border: 0;
			width: 100%;
			height: 0px;
			display: inline-block;
		}

		.kakao-img {
			width: 100%;
		}

		#Mainpage {
			border: 0;
			width: 300px;
			height: 40px;
				border: 0;
			outline: none;
			border-radius: 40px;
			background: linear-gradient(to left, rgba(96, 187, 247, 0.349),
					rgba(154, 252, 192, 0.404));
			color: white;
			font-size: 1.2em;
			letter-spacing: 2px;
		}

		.mainpage {
			width: 100%;
		}
	</style>
</head>



<body>
	<form action="main.do" method="post" name="">
		<input type="hidden" name="login_ok" value="1" />
		<div class="wrap">
			<div class="login">
				<h2 align="center">LOGIN 또는 회원가입</h2>
				<div class="login_sns"></div>
				<div class="login_id">
					<h4>ID</h4>
					<input type="ID" name="id" id="id" placeholder="ID" required="required">
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" name="pw" id="pw" placeholder="Password" required="required">
				</div>
				<div class="submit">
					<input type="submit" value="로그인" id="loginfo" onclick="login()" style="float: left;">
					<input type="button" value="회원가입" id="userinsert" onclick="location.href='joinForm.do'" style="float: right;">
					<br>
					<br> <br>
				</div>
				<div>
				<input type="button" value="Main" id="Mainpage" onclick="location.href='guestMain.do'">
					

				</div>
				<br>
				<div>
					<button type="button" id="kakao" onclick=kakaoLogin()>
						<img class="kakao-img" src="resources/image/kakao1.png">
					</button>
					
				</div>
			</div>
		</div>
	</form>
	<form action="kakaologin.do" method="post" name="login_frm" class="login_frm">
		<div class="form-group row" id="kakaologin">
			<div class="kakaobtn">
				<input type="hidden" name="kakaoemail" id="kakaoemail" />
				<input type="hidden" name="kakaoname" id="kakaoname" />
				<input type="hidden" name="kakaobirth" id="kakaobirth" />
				
			</div>
		</div>
		<!-- <input type="text" name="kakaoemail" id="kakaoemail" value="" /> -->
	</form>
</body>




<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	// 카카오로그인
	window.Kakao.init("f7385fb73ea9711440f35e5c4448ec66");

	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope: 'profile_nickname,account_email,birthday',
			success: function (authObj) {
				//console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: res => {
						const email = res.kakao_account.email + "kakao";
						const name = res.properties.nickname;
						const birth = res.kakao_account.birthday;

						console.log(email);
						console.log(name);
						console.log(birth);

						$('#kakaoemail').val(email);
						$('#kakaoname').val(name);
						$('#kakaobirth').val(birth);
						document.login_frm.submit();
					}
				});

			}
		});
	}
</script>

</html>