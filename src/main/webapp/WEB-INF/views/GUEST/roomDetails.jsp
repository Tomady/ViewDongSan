<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Martine</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
#details {
	width: 550px;
	height: 400px;
}

#eventroomimg {
	width: 270px;
	height: 200px;
}

#review {
	border: 1px solid rgb(236, 236, 236);
	border-radius: 10px;
	text-align: left !important;
}

.btn_1 {
	border: 1px solid rgb(255, 183, 50);
}

#guestImg {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}
</style>
<script type="text/javascript">
	$(document).on("click", "#bookingBtn", function() {
				if (${author != "GUEST"}) {
					let tologin = confirm("게스트 회원만 가능한 서비스 입니다.\n게스트 계정으로 로그인하시겠습니까?");
					if(tologin) {
						location.href = "Login.do";					
					}
				} else {
					let roomrateavg = '${roomRateAvg}';
					let roomid = $("#section").data("roomid");
					let cin = $("#section").data("checkin");
					let cout = $("#section").data("checkout");
					location.href = "roomBooking.do?roomid=" + roomid + "&in=" + cin + "&out=" + cout + "&avg=" + roomrateavg;
				}
			});
</script>

</head>

<body>
	<section class="event_part section_padding" id="section"
		data-roomid="${selectRoom.roomId}" data-checkin="${checkIn}"
		data-checkout="${checkOut}">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div>
						<div>
							<div class="row justify-content-end">
								<div class="col-lg-6 col-md-6">
									<div class="event_slider_content">
										<c:if test="${roomRateAvg >= 4.5}">
											<h5>평점 좋은 숙소</h5>
										</c:if>
										<img id="eventroomimg" src="upload/${selectRoom.roomImg}">
										<br> <br>
										<h2>${selectRoom.roomName}</h2>
										<p>${selectRoom.roomSubject}</p>
										<p>
											⏰Check In: <span>${checkIn}</span>
										</p>
										<p>
											⏰Check Out: <span>${checkOut}</span>
										</p>
										<p>
											🏠Address: <span>${selectRoom.roomAddress}</span>
										</p>
										<p>
											💰Cost: <span>${selectRoom.roomPrice}/박</span>
										</p>
										<div class="rating">
											<span>💖Rating:</span>
											<div class="place_review">
												<c:if test="${roomRateAvg<=0.4}">
													<span>🤍🤍🤍🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>0.4 && roomRateAvg<=0.9}">
													<span>💔🤍🤍🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>0.9 && roomRateAvg<=1.4}">
													<span>💖🤍🤍🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>1.4 && roomRateAvg<=1.9}">
													<span>💖💔🤍🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>1.9 && roomRateAvg<=2.4}">
													<span>💖💖🤍🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>2.4 && roomRateAvg<=2.9}">
													<span>💖💖💔🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>2.9 && roomRateAvg<=3.4}">
													<span>💖💖💖🤍🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>3.4 && roomRateAvg<=3.9}">
													<span>💖💖💖💔🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>3.9 && roomRateAvg<=4.4}">
													<span>💖💖💖💖🤍 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg>4.4 && roomRateAvg<=4.9}">
													<span>💖💖💖💖💔 ${roomRateAvg}</span>
												</c:if>
												<c:if test="${roomRateAvg==5.0}">
													<span>💖💖💖💖💖 ${roomRateAvg}</span>
												</c:if>
											</div>
										</div>
										<button class="btn_1" id="bookingBtn">Booking</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="top_place section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>ROOM DETAILS</h2>
						<p>Let’s start your journey with us, your dream will come true</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:if test="${selectRoomImg.image1 != null}">
					<div class="col-lg-6 col-md-6">
						<div class="single_place">
							<img id="details" src="upload/${selectRoomImg.image1}">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>DETAILS_1</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${selectRoomImg.image2 != null}">
					<div class="col-lg-6 col-md-6">
						<div class="single_place">
							<img id="details" src="upload/${selectRoomImg.image2}">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>DETAILS_2</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${selectRoomImg.image3 != null}">
					<div class="col-lg-6 col-md-6">
						<div class="single_place">
							<img id="details" src="upload/${selectRoomImg.image3}">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>DETAILS_3</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${selectRoomImg.image4 != null}">
					<div class="col-lg-6 col-md-6">
						<div class="single_place">
							<img id="details" src="upload/${selectRoomImg.image4}">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>DETAILS_4</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${selectRoomImg.image5 != null}">
					<div class="col-lg-6 col-md-6">
						<div class="single_place">
							<img id="details" src="upload/${selectRoomImg.image5}">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>DETAILS_5</h3>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	
	<div class="whole-wrap" align="center">
		<div class="container box_1170">
			<div class="section-top-border">
				<section>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-xl-6">
								<div class="section_tittle text-center">
									<h2>REVIEW</h2>
									<p>숙소를 이용하신 고객님들의 후기입니다</p>
								</div>
							</div>
						</div>
					</div>
				</section>
				<h3 class="mb-30">⭐${roomRateAvg}점 / 후기 ${ReviewCount}개</h3>
				<div class="row">
					<c:forEach items="${guestreview}" var="review">
						<div id="review" class="col-md-4">
							<div class="single-defination">
								<br><img id="guestImg" src="upload/${review.gimg}">&nbsp;
								<span class="mb-20">${review.guestid}</span><br>
								<span>💖${review.rate}</span><br>
								<p>${review.subject}</p>
								<br>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<section>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-xl-6">
								<div class="section_tittle text-center">
									<h2>NOTICE</h2>
									<p>이용수칙</p>
								</div>
							</div>
						</div>
					</div>
				</section>
				<div class="row">
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">숙소 이용규칙</h4>
							<br>
							<p>
								<img src="img/icon/시계.png" id="icon">체크인: 오후 2:00 이후
							</p>
							<p>
								<img src="img/icon/시계.png" id="icon">체크아웃: 오전 11:00
							</p>
							<p>
								<img src="img/icon/셀프체크인.png" id="icon">셀프 체크인
							</p>
							<p>
								<img src="img/icon/흡연금지.png" id="icon">흡연 금지
							</p>
							<p>
								<img src="img/icon/반려동물불가.png" id="icon">반려동물 동반 불가
							</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">건강과 안전</h4>
							<br>
							<p>
								<img src="img/icon/일산화.png" id="icon">일산화탄소 경보기
							</p>
							<p>
								<img src="img/icon/화재.png" id="icon">화재경보기
							</p>
							<p>
								<img src="img/icon/화재.png" id="icon">가정용 소화기
							</p>
							<p>
								<img src="img/icon/청소.png" id="icon">코로나19 방역수칙에 따라 강화된
							</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;청소절차에 따른 소독을 완료한 숙소입니다.</p>
							<p>
								<img src="img/icon/가이드.png" id="icon">VIEWDONGSAN의 사회적 거리두기
							</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;및 관련 가이드라인이 적용됩니다.</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">환불 정책</h4>
							<br>
							<p>
								<img src="img/icon/보증금.png" id="icon">~입실 전 5일: 무료 환불
							</p>
							<p>
								<img src="img/icon/보증금.png" id="icon">5일~입실 전 3일: 수수료 50%
							</p>
							<p>
								<img src="img/icon/보증금.png" id="icon">3일~입실 당일: 수수료 100%
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="tour_details_content section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="content_iner">
						<div class="tour_details_content_btn">
							<a class="btn_1" href="javascript:history.back();">목 록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- magnific js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- masonry js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- masonry js -->
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<!-- contact js -->
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>