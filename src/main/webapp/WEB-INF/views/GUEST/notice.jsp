<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
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
    	.blog_item{
    		width:100%;
    	}
    </style>
    <script type="text/javascript">
    	$(document).on("click",".blog_item",function(){
    		let targetNum = event.target.closest(".blog_item").getAttribute("data-no");
    		location.href="toNoticeDetails.do?no="+targetNum;
    	})
    </script>
</head>
<body>
<br><br><br><br><br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6">
				<div class="section_tittle text-center">
					<h2>NOTICE</h2>
				</div>
			</div>
		</div>
	</div>
	<section class="blog_area section_padding">
        <div class="container">
            <div class="row">
				<c:forEach items="${noticeList}" var="notice">
					<article class="blog_item" data-no="${notice.no}">
						<div class="blog_item_img"></div>
						<div class="blog_details">
							<h2>${notice.ntitle}</h2>
							<ul class="blog-info-link">
								<li>No.${notice.no}</li>
								<li class="far fa-user"> 관리자</li>
								<c:set var="wdate" value="${notice.nwdate}"/>
								<li>${fn:substring(wdate,0,10)}</li>
							</ul>
						</div>
					</article>
				</c:forEach>
			</div>
        </div>
    </section>
</body>
</html>