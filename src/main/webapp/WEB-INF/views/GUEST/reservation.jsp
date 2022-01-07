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
        <h2>예 약 내 역</h2>
    </div>

    <section class="about_us section_padding">
        <c:forEach items="${currentReservation }" var="vo">
            <div class="items-bg">
                <div class="container">
                    <div class="row align-items-center" data-roomId="${vo.roomId}">
                        <div class="col-lg-3">
                            <div class="about_img">
                                <img src="upload/${vo.roomImg }" alt="#">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="about_text">
                            <c:set var="checkin" value="${vo.checkIn}" />
                            <c:set var="checkout" value="${vo.checkOut}" />
                                <h5>${fn:substring(checkin,0,10)} ~ ${fn:substring(checkout,0,10)}</h5>
                                <h2 class="roomName" style="cursor:pointer;" onclick="move(this)">${vo.roomName}</h2>
                                <p>${vo.roomSubject}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <br>
            </div>
        </c:forEach>
    </section>
</body>
</html>