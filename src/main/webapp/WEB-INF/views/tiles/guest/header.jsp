<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#place,#checkindate,#checkoutdate{
   width:250px;
   height: 50px;
}
#siteTitle{
   font-size:150px;
   color: white;
   font-family:Times;
}
#miniInfo{
   margin-top: 20px;
   font-size: 13px;
}
#miniInfo:hover{
   color:rgb(248, 144, 25);
}
#profile{
   width:40px;
   border-radius:50%;
}
#adminminiInfo{
   margin-top: 30px;
}
#logo:hover{
   cursor : pointer;
}
.nav-item{
	cursor : pointer;
}
</style>
<script type="text/javascript">
   function loginCheck(){
      var id = "${id}";
      var target = event.target.text
      if(id == ""){
         alert("로그인 후 이용가능합니다.");
         location.href="Login.do"; //로그인 창 던져주기
      }else{
         if(target == "Reservation"){
            console.log("Reservation선택");
            location.href="guestReservationMove.do";
         } else if(target == "History"){
            console.log("History선택");
            location.href="guestUsageHistory.do";
         } else if(target == "MyPage"){
            console.log("MyPage선택");
            location.href="myPage.do";
         }
      }
   }
</script>
</head>
<body>
    <!--::header part start::-->
   <header class="main_menu">
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand"> <img id="logo" src="img/logo2_bg_dy.png" alt="logo" onclick="location.href='guestMain.do'"></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                     <div
                        class="collapse navbar-collapse main-menu-item justify-content-center"
                        id="navbarSupportedContent">
                        <ul class="navbar-nav">
	                           <li class="nav-item"><a class="nav-link"
	                              href="guestMain.do">Home</a></li>
                           <c:if test="${author == null}">
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">Reservation</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">History</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">MyPage</a>
                              </li>
                              
                           </c:if>
                           <c:if test="${author eq 'GUEST'}">
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">Reservation</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">History</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="javascript:void(0);" onclick="window.open('loginProcess.do', '채팅', 'top=10, left=10, width=510, height=700, status=no, menubar=no, toolbar=no, resizable=no');">chatting</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" onclick="loginCheck()">MyPage</a>
                              </li>
                           </c:if>
                           <c:if test="${author eq 'HOST'}">
                              <li class="nav-item"><a class="nav-link"
                                 onclick="location.href='hostMain.do'">HostMain</a></li>
                           </c:if>
                           <c:if test="${author eq 'ADMIN'}">
                              <li class="nav-item"><a class="nav-link"
                                 onclick="location.href='alllist.do'">AdminMain</a></li>
                           </c:if>

                           <c:if test="${author eq 'HOST'}">
                              <div class="nav-link" id="miniInfo"
                                 onclick="location.href='hostMyPage.do'">
                                 <table>
                                    <tr>
                                       <td rowspan="2">
                                          <div id="profile">
                                             <img id="profile" src="upload/${img}">
                                          </div>
                                       </td>
                                       <td>&nbsp;${name} 님, 환영합니다 [${author}]</td>
                                    </tr>
                                 </table>
                              </div>
                           </c:if>
                           <c:if test="${author eq 'GUEST'}">
                              <div class="nav-link" id="miniInfo"
                                 onclick="location.href='myPage.do'">
                                 <table>
                                    <tr>
                                       <td rowspan="2">
                                          <div id="profile">
                                             <img id="profile" src="upload/${img}">
                                          </div>
                                       </td>
                                       <td>&nbsp;${name} 님,</td>
                                    </tr>
                                    <tr>
                                       <td>&nbsp;환영합니다[${author}]</td>
                                    </tr>
                                 </table>
                              </div>
                           </c:if>
                           <c:if test="${author eq 'ADMIN'}">
                              <div class="nav-link" id="adminminiInfo">
                                 <table>
                                    <tr>
                                       <td>관리자님, 환영합니다.</td>
                                    </tr>
                                 </table>
                              </div>
                           </c:if>

                        </ul>
                     </div>
                     <c:if test="${id == undefind}">
                               <a href="Login.do" class="btn_1 d-none d-lg-block">LOGIN</a>                          
                            </c:if>
                            <c:if test="${id != undefind}">
                               <a href="logout.do" class="btn_1 d-none d-lg-block">LOGOUT</a>                          
                            </c:if>
                        
                  </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

   
</body>
</html>