<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<body>
	<jsp:forward page="guestMain.do"></jsp:forward>
	<div align="center">
		<div>
			<button onclick="aRam()">아람 페이지로 이동</button>
		</div>
		<div>
			<button onclick="geongman()">경만 페이지로 이동</button>
		</div>
		<div>
			<button onclick="eunji()">은지 페이지로 이동</button>
		</div>
		<div>
			<button onclick="location.href='join.do'">DB테스트</button>
		</div>
	</div>
	
	<button onclick="email()">이메일 보내기</button>

	<a id="create-kakao-link-btn" href="javascript:void(0);"
		onclick="kakao();"> <img
		src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
	</a>

	<h1>Chatting Page (id: ${userid})</h1>
	<div>
		<input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
	</div>
	<br>
	<div>
		<div>
			<input type="text" id="message" /> <input type="button" id="sendBtn"
				value="전송" />
		</div>
		<br>
		<div class="well" id="chatdata">
			<!-- User Session Info Hidden -->
			<input type="hidden" value='${userid}' id="sessionuserid">
		</div>
	</div>
	<div id="write">
		<button>댓글 그려주기</button>
	</div>

	<!-- 
	<script type="text/javascript">
		eunji();
		
		function aRam() {
			location.href = 'hostMain.do';
		}

		function geongman() {
			location.href = 'Login.do';
		}

		function eunji() {
			location.href = 'guestMain.do';
		}
		$(function() {
			$("#chattinglistbtn")
					.click(
							function() {
								var infodialog = new $.Zebra_Dialog(
										'<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',
										{
											title : 'Chatting List',
											type : 'confirmation',
											print : false,
											width : 260,
											buttons : [ '닫기' ],
											onClose : function(caption) {
												if (caption == '닫기') {
													//alert('yes click');
												}
											}
										}
								);
							}
					);
		});
	</script>
	<script type="text/javascript">
		//websocket을 지정한 URL로 연결
		var sock = new SockJS("<c:url value="/echo"/>");
		//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
		sock.onmessage = onMessage;
		//websocket 과 연결을 끊고 싶을때 실행하는 메소드
		sock.onclose = onClose;

		var sock = new SockJS("<c:url value="/echo"/>");
		sock.onmessage = onMessage;
		sock.onclose = onClose;

		$(function() {
			$("#sendBtn").click(function() {
				console.log('send message...');
				sendMessage();
			});
		});

		function sendMessage() {
			sock.send($("#message").val());
		}

		function onMessage(evt) {
			var data = evt.data;
			var sessionid = null;
			var message = null;

			var strArray = data.split('|');

			for (var i = 0; i < strArray.length; i++) {
				console.log('str[' + i + ']: ' + strArray[i]);
			}

			var currentuser_session = $('#sessionuserid').val();
			console.log('current session id: ' + currentuser_session);

			sessionid = strArray[0];
			message = strArray[1];

			if (sessionid == currentuser_session) {
				var printHTML = "<div class='well'>";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<strong>[" + sessionid + "] -> " + message
						+ "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";

				$("#chatdata").append(printHTML);
			}

			console.log('chatting data: ' + data);
		}

		function onClose(evt) {
			$("#data").append("연결 끊김");
		}

		function kakao() {
			Kakao.init('1a8b495f8f153fe8e3f27faf5aa7b294');
			console.log(Kakao.isInitialized());

			Kakao.Link
					.createDefaultButton({
						container : '#create-kakao-link-btn',
						objectType : 'feed',
						content : {
							title : '4조 ViewDongSan',
							description : '#영오씨 #화이팅하세요 #채팅 전문가',
							imageUrl : 'https://mblogthumb-phinf.pstatic.net/MjAxODA1MDhfMjQg/MDAxNTI1NzkwMDcwMzA1.a8ME_rLq5sDGp0CVBiga35PfnDji3ysKHwXsXpxhPLcg.zVDJd6h-_veee9xkr0VolrVeuD_c3-HKFp10YfnLRi0g.GIF.kissdy486/P20180410_231021491_9F4F0EB0-26BD-491F-B8B0-99F089FDC3E6.GIF?type=w800',
							link : {
								mobileWebUrl : 'http://localhost/ViewDongSan/',
								webUrl : 'http://localhost/ViewDongSan/',
							},
						},
						social : {
							likeCount : 286,
							commentCount : 45,
							sharedCount : 845,
						},
						buttons : [ {
							title : '웹으로 보기',
							link : {
								mobileWebUrl : 'http://localhost/ViewDongSan/',
								webUrl : 'http://localhost/ViewDongSan/',
							},
						}, {
							title : '앱으로 보기',
							link : {
								mobileWebUrl : 'http://localhost/ViewDongSan/',
								webUrl : 'http://localhost/ViewDongSan/',
							},
						}, ],
					})
			console.log("실행되었나?");
		}

		function email() {
			console.log("email()");
			emailjs.init("user_kZovhkh7WXV5JcxukwLWf");

			var templateParams = {
				name : 'ar',
				notes : 'Check this out!',
				email : "db0810c@naver.com"
			};

			emailjs.send('service_0zt7f85', 'template_yfeqnik', templateParams)
					.then(
							function(response) {
								console.log('SUCCESS!', response.status,
										response.text);
							}, function(error) {
								console.log('FAILED...', error);
							});
		}
	</script>
	 -->


	<script type="text/javascript">
		$.ajax({
			url : "ajaxWrite.do",
			type : "post",
			data : {
				roomId : 1
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
			},
			error : function() {
				console.log("에러");
			}
		});
		
		function aRam() {
			location.href = 'hostMain.do';
		}

		function geongman() {
			location.href = 'Login.do';
		}

		function eunji() {
			location.href = 'guestMain.do';
		}
	</script>
</body>
</html>