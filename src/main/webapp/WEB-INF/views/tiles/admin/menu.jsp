<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_sidebar.html -->
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
	  
        <ul class="nav" style="
    position: absolute;
    top: 100px">
        <br><br>
          <li class="nav-item">
            <a class="nav-link" href="alllist.do">
             <i class="icon-head menu-icon"></i>
              <span class="menu-title">회원관리</span>
            </a>
          </li>
         
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
            <i class="icon-head menu-icon"></i>
              <span class="menu-title">호스트 가입요청</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="hostapprove.do">호스트 가입요청</a></li>
              </ul>
            </div>
          </li>
          
         
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
             <i class="icon-head menu-icon"></i>
              <span class="menu-title">호스트관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="hostlist.do">호스트 관리</a></li>
              </ul>
            </div>
          </li>
          
        
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">게스트 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="guestlist.do"> 게스트 관리 </a></li>
              </ul>
            </div>
          </li>
          
          
           	  <li class="nav-item">
		  
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">공지사항 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="noticelist.do">공지사항 관리</a></li>
              </ul>
            </div>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">호스트 매출관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="allchart.do">호스트 매출관리</a></li>
              </ul>
            </div>
          </li>
          
          
          
          
        </ul>
      </nav>
     