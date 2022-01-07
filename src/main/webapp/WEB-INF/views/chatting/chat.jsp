<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ViewDongSan</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=Do+Hyeon&family=IBM+Plex+Sans+KR&family=Jua&family=Poor+Story&family=Shizuru&display=swap" rel="stylesheet">
<style>
   *{
       margin: 0;
   }
   .header{
        width: 485px;
        height: 120px;
        background-color: wheat;
        margin-top: 10px;
        margin-left: 7px;
        border-top-left-radius : 20px;
        border-top-right-radius : 20px;
        border-bottom-right-radius : 0px;
        border-bottom-left-radius : 0px;
    }
    #icon{
        width: 130px;
        margin-left: 50px;
        float: left;
    }
    #hello{
        padding-top: 25px;
        font-size: 25px;
        font-family: 'Jua', sans-serif;
        color: sienna;
        padding-left: 180px;
    }
    #sp2{
        font-size: 30px;
    }
    .msgbox{
        background-color: white ;
        width: 481px;
        height: 500px;
        margin-left: 7px;
        border: 2px solid wheat;
        border-top-left-radius : 0px;
        border-top-right-radius : 0px;
        border-bottom-right-radius : 20px;
        border-bottom-left-radius : 20px;
        font-family: 'Poor Story', cursive;
        font-size: 20px;
    }
    .sendbox{
        width: 300px;
        height: 40px;
        border-radius: 20px;
        background-color: wheat;
        margin-top: 20px;
        margin-left: 100px;
    }
    .sendbox input[type="text"]{
        border: none;
        margin-left: 30px;
        background-color: wheat;
    }
    #send{
        font-size: 18px;
        border: none;
        background-color: transparent;
        cursor: pointer;
        margin-top:6px;
    }
    #messages{
    	margin-left: 30px;
    }
	#chat {
		margin-left: 60px;
	}
</style>
</head>
<body>
<div class="wrap">
   <div class="header">
       <img src="https://item.kakaocdn.net/do/c5c470298d527ef65eb52883f0f186c48f324a0b9c48f77dbce3a43bd11ce785" id="icon">
       <div id="hello">
           <span id="sp1">반가워요 :D</span><br>
            <span id="sp2">뷰톡을 찾아주셨군요!</span>
        </div>
   </div>
    
    <!-- Server responses get written here -->
    <div class="msgbox">
    	<div id="chat">
    		<br>
	        ❌욕설 및 도배는 신고의 대상이 됩니다.❌
	    </div>
        <div id="messages" style="overflow:auto; width:430px; height:400px;">
	        
		</div>
    </div>
    <!--end of msgbox-->

    <div class="sendbox">
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput" placeholder="메시지를 입력해주세요">
        <button type="button" onclick="send();" id="send">💌 🇸 🇪 🇳 🇩 </button>
    </div><!--end of sendbox-->
</div> <!--end of wrap-->
    
    <!-- websocket javascript -->
    <script type="text/javascript">
    	messageinput.addEventListener("keypress", function(e) {
    		if(e.keyCode == 13) {
    	    	send();
    	    	messageinput.value = '';
    	    }
    	});
    
        var ws;
        var messages = document.getElementById("messages");
        
        openSocket();
        
        function openSocket() {
           console.log(ws);
           
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:80/ViewDongSan/echo.do");
            
            ws.onopen = function(event) {
                console.log("open됨");
                
                if(event.data === undefined) {
                    return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event) {               
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event) {
               console.log("close()");
                writeResponse("대화 종료");
            }
        }
        
        function send(){
           // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
            console.log("send()");
            ws.send(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
         }
  </script>
</body>
</html>