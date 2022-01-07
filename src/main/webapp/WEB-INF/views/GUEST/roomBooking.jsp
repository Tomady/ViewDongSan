<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#roomImg{
		width:1500px;
		height:400px;
	}
	.widget_title{
		font-weight: bold;
	}
	#info{
		color:rgb(248, 144, 25);
		font-size:20px;
		font-weight: bold;
	}
	.btn_1{
            border: 1px solid rgb(255, 183, 50);
    }
    #sidebar:hover{
    	cursor:pointer;
    }
    #won{
    	font-size:20px;
    }
    #hostid{
    	font-size:40px;
    }
    #hostidnext{
    	font-size:40px;
    }
    #hostImg{
    	width:50px;
    	border-radius:50%;
    }
</style>
<!-- 제이쿼리 추가 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- 아임포트 라이브러리 추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 결제창 띄울 콜백함수 작성 -->
<script type="text/javascript">
	
	function requestPay(){
		//주문자아이디 - guestid
 		let guestId = "${id}";
		//체크인날짜
		let checkIn = $(".checkin").text();
		//체크아웃날짜
		let checkOut = $(".checkout").text();
		//상품주문번호 - roomid
		let roomId = $("#sidebar").data("roomid");
		//호스트아이디 - hostid
		let hostId = $("#hostid").text();
		//결제금액 - roomprice
		let price = Number($("#totalPrice>h2").text());
		
		//주문명 - roomname
		let roomName = $(".blog_details>.d-inline-block>h2").text();
		//주문자이름 - gname
		let gname = "${name}";
		//주문자전화번호 - gtel
		let gtel = "${tel}";
		//주문자주소 - gaddress
 		let gAddress = "${addr}";
		
		//호스트아이디,가격
		//RESERVATION TABLE에 INSERT
		//SALES TABLE에 INSERT
		$.ajax({
			url : "AjaxReservationInsert.do",
			type : "POST",
			data : {
				guestId : guestId,
				roomId : roomId,
				checkIn : checkIn,
				checkOut : checkOut,
				hostId : hostId,
				price : price
			},
			dataType : "text",
			success : function(data){
				if(data=="예약1:매출1"){
					console.log("결제성공");
					
				}else if(data=="예약1:매출0"){
					console.log("예약1:매출0");
					
				}else if(data=="예약0:매출1"){
					console.log("예약0:매출1");
					
				}else if(data=="예약0:매출0"){
					console.log("예약0:매출0");
				}
			},
			error : function(){
				alert("결제가 실패하였습니다.\n관리자에게 문의하세요.[010-1234-1234]");
			}
		})	
	
		//imp객체 = 전역객체
		IMP.init("imp92462957"); //가맹점식별코드입력후, imp객체초기화
		IMP.request_pay({ //imp객체의 request_pay(param, callback) : pg사의 결제창을 호출.
			//param(object) : 결제 승인에 필요한 정보
			pg: "html5_inicis", //여러pg를 사용할때 구분자입력. html5_inicis=이니시스웹표준
	        pay_method: "card", //[필수]결제수단(card,trans(실시간계좌이체),vbank(가상계좌),phone(휴대폰소액결제),samsung(삼성페이))
	        merchant_uid: roomId, //[필수]상품주문번호_이미결제승인된걸로는재결제불가
	        name: roomName,//주문명.16자이내작성권장
	        amount: price,//[필수]결제금액
	        //buyer_email: "gildong@gmail.com",//주문자이메일
	        buyer_name: gname,//주문자이름
	        buyer_tel: gtel,//[필수]주문자연락처.누락,공백시 일부pg사에서 오류발생
	        buyer_addr: gAddress,//주문자주소
	        //buyer_postcode: "01181"//주문자우편번호
	        
	        //callback함수
		}, function(rsp){
			if(rsp.success){
				alert('성공적으로 결제되었습니다.');
			}else{
				alert('결제가 취소되었습니다.');
			}
		});
	}
	
	<!-- 클릭시 해당 숙소상세페이지 이동-->
	$(document).on("click","#sidebar",function(){
		let roomid = $(event.target).closest("#sidebar").data("roomid");
		let checkin = $(event.target).closest("#sidebar").data("checkin");
		let checkout = $(event.target).closest("#sidebar").data("checkout");
		location.href="roomDetails.do?roomid="+roomid+"&checkin="+checkin+"&checkout="+checkout;
	})
</script>


</head>
<body>	
	<section class="blog_area section_padding" >
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                <img id="hostImg" src="upload/${hostImg.himg}">&nbsp;&nbsp;
                <span id="hostid">${roomBooking.hostId}</span><span id="hostidnext">&nbsp;님의 숙소</span><br><br>
                    <div id="sidebar" class="blog_left_sidebar" data-roomid="${roomBooking.roomId}" data-checkin="${checkIn}" data-checkout="${checkOut}">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="upload/${roomBooking.roomImg}" id="roomImg">
								<c:if test="${(rateAvg) >= 4.5}">
									<div class="blog_item_date">
										<h3>HOT !</h3>
									</div>
								</c:if>
							</div>
                            <div class="blog_details">                               
                                <div class="d-inline-block">
                                	<h2>${roomBooking.roomName}</h2>
                                </div>                                    
                                <h4>-</h4>
                            	<h4>${roomBooking.roomAddress}</h4>
                            	<h4>${roomBooking.roomPrice} /박</h4>
                            	<div class="blog-info-link">
                            		<span class="far fa-comments"> Review 💖${rateAvg}</span>
                            	</div>                                                            
                            </div>
                        </article>
                        <div class="row">
							<div class="col-md-4">
								<div class="single-defination">
									<h4 class="mb-20">숙소 이용규칙</h4><br>
									<p><img src="img/icon/시계.png" id="icon">체크인: 오후 2:00 이후</p>
									<p><img src="img/icon/시계.png" id="icon">체크아웃: 오전 11:00</p>
									<p><img src="img/icon/셀프체크인.png" id="icon">셀프 체크인</p>
									<p><img src="img/icon/흡연금지.png" id="icon">흡연 금지</p>
									<p><img src="img/icon/반려동물불가.png" id="icon">반려동물 동반 불가</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="single-defination">
									<h4 class="mb-20">환불 정책</h4><br>
									<p><img src="img/icon/보증금.png" id="icon">~입실 전 5일</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 무료 환불</p>
									<p><img src="img/icon/보증금.png" id="icon">5일~입실 전 3일</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 수수료 50%</p>
									<p><img src="img/icon/보증금.png" id="icon">3일~입실 당일</p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 수수료 100%</p>
									
								</div>
							</div>
						</div>                  
                    </div>
                </div>
                <div class="col-lg-4">
					<div class="blog_right_sidebar">					
						<aside class="single_sidebar_widget popular_post_widget">
                            <h2>확인 및 결제</h2><br><br>                                      
                            <h3 class="widget_title"><img src="img/icon/시계.png">&nbsp;예약정보</h3>
                            <fmt:parseDate value="${checkIn}" var="strPlanDate" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${checkOut}" var="endPlanDate" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                            <table>
                            	<tbody>
                            		<tr>
                            			<th><h4>Check In</h4></th>
                            			<td>
                            				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            				<span id="info" class="checkin">${checkIn}</span>
                            			</td>
                       				</tr>
                       				<tr>
                            			<th><h4>Check Out</h4></th>
                            			<td>
                            				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            				<span id="info" class="checkout">${checkOut}</span>
                            			</td>
                       				</tr>
                       				<tr>
                            			<th><h4>기간</h4></th>
                            			<td><span id="info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${endDate - strDate}박&nbsp;&nbsp;${endDate - strDate+1}일</span></td>
                       				</tr>
                            	</tbody>
                            </table><br><br>
                            <h3 class="widget_title"><img src="img/icon/보증금.png">&nbsp;요금 세부정보</h3>
                            <table>
                            	<tbody>
                            		<tr>
                            			<td colspan="2">
                            				<p>VIEWDONGSAN은 원활한 플랫폼 운영과</p>
                            				<p>숙소 호스팅에 도움이 되는 제품 및</p>
                            				<p>서비스 비용을 충당하기 위해</p>
                            				<p>아래와 같은 수수료를 부과합니다.</p>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td colspan="2">*</td>
                            		</tr> 
                            		<tr>
                            			<th><h4>청소비</h4></th>
                            			<td><span id="info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2000&nbsp;&nbsp;원</span></td>
                            		</tr>                          		
                            		<tr>
                            			<th><h4>서비스 수수료</h4></th>
                            			<td><span id="info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3000&nbsp;&nbsp;원</span></td>
                            		</tr>
                            		<tr>
                            			<td colspan="2"><h1>-</h1></td>
                            		</tr>                      		
                            		<tr>
                            			<th><h4>₩${roomBooking.roomPrice}&nbsp;&nbsp;X&nbsp;&nbsp;${endDate - strDate}박</h4></th>
                            			<fmt:parseNumber value="${roomBooking.roomPrice}"  pattern="0,000.00"  var="price"></fmt:parseNumber>
                            			<fmt:parseNumber value="${endDate - strDate}"  pattern="0,000.00"  var="day"></fmt:parseNumber>
                            			<td><span id="info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${price * day}&nbsp;&nbsp;원</span></td>
                            		</tr>
                            		<tr>
                            			<td colspan="2"><h1>-</h1></td>
                            		</tr>
                            		<tr>                     			
                            			<th><h2>TOTAL</h2></th>
                            			<td id="totalPrice"><h2>${price * day + 5000}</h2></td>
                            		</tr>
                            	</tbody>
                            </table>
                            <br>
                            <br>
                            <button class="btn_1" onclick="requestPay()">Payment</button>                       
                        </aside>
					</div>
				</div>             
            </div>
        </div>
    </section>
   
</body>
</html>