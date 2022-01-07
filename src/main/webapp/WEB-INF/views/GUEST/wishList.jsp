<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#roomImg{
	width:300px;
	height:230px;
}

#my_modal {
    display: none;
    width: 500px;
    height: 500px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}

#my_modal .modal_close_btn {
    position: absolute;
    top: 10px;
    right: 10px;
}
.modal_close_btn{
	font-size:30px;
}
#closeBtn:hover{
	color:red;
	cursor:pointer;
}
#gotoDetailBtn,#wishDropBtn{
	padding:3%;
	background-color:rgb(248, 144, 25);
	color:white;
	cursor:pointer;
	border: 1px solid rgb(248, 144, 25);
	border-radius: 3px;
}
#gotoDetailBtn:hover,#wishDropBtn:hover{
	background-color:tomato;
}
</style>
<script type="text/javascript">
	
	//모달창 체크인날짜 오늘날짜로 지정
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		checkindate = document.getElementById("checkIn");
		checkindate.value = today;
	}
	
	//모달창_숙소상세보기버튼
	$(document).on("click","#gotoDetailBtn",function(){
		let modal = event.target.closest("#my_modal");
		
		let roomid = modal.getAttribute("data-roomid");
		let checkInDate = $("#checkIn").val();
		let checkOutDate = $("#checkOut").val();
		
		if(checkInDate==''||checkOutDate==''){ //날짜를 입력하지 않았을때
			alert("여행날짜를 입력해 주세요.");
		}else{ //날짜 입력했을 때
			today = new Date();
			today = today.toISOString().slice(0, 10);
			if(checkInDate<today){ //체크인날짜가 현재날짜이전인경우
				alert("체크인 날짜를 확인해주세요.");
				$("#checkIn").focus();
				$("#checkIn").val(today);
				
			}else if(checkInDate>=checkOutDate){ //체크아웃날짜가 체크인날짜와 같거나 이를 경우
				alert("체크아웃 날짜를 확인해주세요.");
				$("#checkOut").focus();
				$("#checkOut").val("");
			}else{
				location.href="roomDetails.do?roomid="+roomid+"&checkin="+checkInDate+"&checkout="+checkOutDate;
			}
		}
	})
	
	 function modal(id,roomId,roomName,roomPrice,roomImg) {
                var zIndex = 9999;
                var modal = document.getElementById(id);
                
                modal.querySelector('#roomImg').setAttribute('src',"upload/"+roomImg);
                modal.querySelector('#roomName').innerHTML=roomName;
                modal.querySelector('#roomPrice').innerHTML=roomPrice;

                //모달 div 뒤 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    //레이어 색깔 여기서 바꾸기
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                //닫기 버튼 처리, 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
                
                modal.setAttribute("data-roomid",roomId);
                
                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    borderRadius:'10px',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    //레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    //div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });

            }

      //Element에 style 한번에 오브젝트로 설정하는 함수 추가
      Element.prototype.setStyle = function(styles) {
          for (var k in styles) this.style[k] = styles[k];
          return this;
      };
		
      //모달창 띄우기
      $(document).on("click","#showshow>#room",function(){
		let target = event.target.closest("#room");
        let roomId = target.getAttribute("data-roomid");
       	let roomName = target.getAttribute("data-roomname");
       	let roomPrice = target.getAttribute("data-price");
       	let roomImg = target.getAttribute("data-roomimg");
	   	  if(event.target.nodeName == "BUTTON"){ //버튼을 눌렀을때는 삭제처리
	   		$.ajax({
				url:"AjaxWishDrop.do",
				data:{
					roomid : roomId
				},
				type:"POST",
				dataType : "text",
				success:function(text){
					if(text=="OK"){
						alert("위시리스트에서 성공적으로 삭제되었습니다.");
						location.href="toWishList.do";
					}
				},
				error:function(){
					alert("삭제가 실패하였습니다.\n관리자에게 문의하세요[010-1234-1234]");
				}
			})		        
   		  }else{ //타겟이 버튼 아닐 경우에는 모달띄우기
   			modal('my_modal',roomId,roomName,roomPrice,roomImg);
   	   	  }
  
  	  })
    	
	
</script>
</head>
<body>
	<div id="my_modal" align="center">        
    	<a class="modal_close_btn" id="closeBtn">ⓧ</a>
    	<br>
        <img id="roomImg" ><br><br>
        <table>
        	<tbody>
        		<tr>
        			<td>ROOM</td>
        			<td>:&nbsp;&nbsp;&nbsp;&nbsp;<span id="roomName"></span></td>
        		</tr>
        		<tr>
        			<td>PRICE</td>
        			<td>:&nbsp;&nbsp;&nbsp;&nbsp;<span id="roomPrice"></span></td>
        		</tr>
        		<tr>
        			<td>CHECK-IN</td>
        			<td>:&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" id="checkIn"></td>
        		</tr>
        		<tr>
        			<td>CHECK-OUT</td>
        			<td>:&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" id="checkOut"></td>
        		</tr>
        	</tbody>
        </table>
        <br>
        <button id="gotoDetailBtn">숙소상세보기</button>
    </div>
    <section class="best_services section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>${guestId} 님의</h2>
                        <h2>WISHLIST</h2>
                        <p>마음에 드는 숙소를 발견하셨다면, 서둘러 여행날짜를 잡아보세요!</p>
                    </div>
                </div>
            </div>
            <div class="row" id="showshow">
            <c:forEach items="${wishRooms}" var="wishRoom">
                <div id="room" class="col-lg-3 col-sm-6" 
                data-roomid="${wishRoom.roomId}"
                data-roomimg="${wishRoom.roomImg}"
                data-roomname="${wishRoom.roomName}"
                data-price="${wishRoom.roomPrice}">
                    <div class="single_ihotel_list">
                        <img id="roomImg" src="upload/${wishRoom.roomImg}">
                        <h3>${wishRoom.roomName}</h3>
                        <p>💰 PRICE</p>
                        <p>💸 ${wishRoom.roomPrice} 원 / 박</p><br>
                        <button id="wishDropBtn">삭제</button>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </section>
</body>
</html>