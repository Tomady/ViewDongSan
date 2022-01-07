<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
   #wdate{
      float:right;
   }
   #subject{
      font-size:17px;
   }
   #btn{
      float:right;
   }
   .btnn:hover{
      background-color: rgb(248, 144, 25);
      color: white;
      font-weight:bold;
      cursor:pointer;
   }
</style>
</head>
<body>
   <div class="whole-wrap">
      <div class="container box_1170">
         <div class="section-top-border">
            <h4 id="no">No.${notice.no}</h4>
            <h3 class="mb-30">제목 : ${notice.ntitle}</h3>
            <c:if test="${author eq 'ADMIN'}">
            <span id="btn" class="btnn">삭제</span>
            <span id="btn">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <span id="btn" class="btnn">수정</span>
            </c:if>
            <br>
            <div class="row">
               <div class="col-lg-12">
                  <blockquote id="subject" class="generic-blockquote">${notice.nsubject}<br><br>
                  <c:if test="${notice.nimg != null}">
                  <img class="classimg" src="upload/${notice.nimg}">
                  </c:if>
                  </blockquote>
                  <c:set var="wdate" value="${notice.nwdate}"/>
                  <span id="wdate">📅작성일자 : ${fn:substring(wdate,0,10)}</span>
               </div>
               <button class="genric-btn primary-border circle" id="saveBtn" onclick="BackFnc()">BACK</button>
            </div>
         </div>
      </div>
   </div>
   
   <script type="text/javascript">
      function BackFnc(){
         let no = ${notice.no};
         location.href="toNotice.do";
      }
      $(document).on("click",".btnn",function(){
         let no = ${notice.no};
         if($(event.target).text()=="삭제"){
            console.log("삭제클릭");
            $.ajax({
               url : "noticeDelete.do",
               type : "POST",
               dataType : "text",
               data : {
                  no : no
               },
               success : function(text){
                  if(text == "YES"){
                     alert("게시글 삭제가 완료되었습니다.");
                     location.href="toNotice.do";
                  }
               },
               error : function(){
                  alert("게시글 삭제가 실패하였습니다.\n관리자에게 문의하세요.[010-1234-1234]");
               }
            })
         }else if($(event.target).text()=="수정"){
            location.href = "toNoticeUpdatePage.do?no="+no;
         }
      })
   </script>
</body>
</html>