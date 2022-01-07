<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <!-- about us css start-->
    <div align="center" style="margin-top: 50px">
        <h2>이 용 내 역</h2>
    </div>

    <section class="about_us section_padding">
        <c:forEach items="${usageHistory }" var="history">
            <div class="items-bg">
                <div class="container">
                    <div class="row align-items-center" data-roomId="${roomId}">
                        <div class="col-lg-3">
                            <div class="about_img">
                                <img src="upload/${history.roomImg }" alt="#">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="about_text">
                            <c:set var="checkin" value="${history.checkIn}" />
                            <c:set var="checkout" value="${history.checkOut}" />
                                <h5>${fn:substring(checkin,0,10)} ~ ${fn:substring(checkout,0,10)}</h5>
                                <h2 class="roomName" style="cursor:pointer;" onclick="move(this)">${history.roomName}</h2>
                                <p>${history.roomSubject}</p>
                            </div>
                        </div>
                        <div class="col-lg-3">
							<button class="genric-btn primary-border circle" id="writeReviewBtn" onclick="reviewForm('${history.roomId}')">리뷰 쓰기</button>
						</div>
                    </div>
                </div>
            </div>
            <div>
                <br>
            </div>
        </c:forEach>
    </section>

    <script type="text/javascript">
		function reviewForm(roomId) {
			console.log(roomId);
			let url = "writeReview.do?roomId=" + roomId;
			location.href = url;
		}
	</script>
</body>

</html>