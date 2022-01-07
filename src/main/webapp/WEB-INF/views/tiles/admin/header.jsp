<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
	
    .logout{
			--button-hover-bg-color: #ccc6ff;
			border: 3px solid #ccc6ff;
			color : #5140e6;
			
    }
	.logout:hover{
			--button-hover-bg-color: #ccc6ff;
			border: 3px solid #ccc6ff;
			color : #f9f8fc !important;
			
    }
	
	.mr-2{
		width:130px;
		align:center;
		margin: auto;
		position: relative;
		left: 20px;
	}
	.mainpage{
		--button-hover-bg-color: #ccc6ff;
			border: 3px solid #ccc6ff;
			color : #5140e6;

	}
	.mainpage:hover{
		--button-hover-bg-color: #ccc6ff;
			border: 3px solid #ccc6ff;
			color : #f9f8fc !important;
			
	}
    </style>
    
 <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="alllist.do"><img src="resources/image/logo2.jpg" class="mr-2" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
          
          </li>
        </ul>
        
     <ul class="navbar-nav ml-auto">

	<!-- Nav Item - Search Dropdown (Visible Only XS) -->
<li class="nav-item dropdown no-arrow d-sm-none"><a
	class="nav-link dropdown-toggle" href="#" id="searchDropdown"
	role="button" data-toggle="dropdown" aria-haspopup="true"
	aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
</a> <!-- Dropdown - Messages -->
<div
	class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
	aria-labelledby="searchDropdown">
	<form class="form-inline mr-auto w-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>
</div></li>

<!-- Nav Item - Alerts -->

<!-- Nav Item - Messages -->




<!-- Nav Item - User Information -->
<!-- <li class="nav-item dropdown no-arrow"><a
	class="nav-link dropdown-toggle" href="#" id="userDropdown"
	role="button" data-toggle="dropdown" aria-haspopup="true"
	aria-expanded="false"> <button type="button"
		class="mr-2 d-none d-lg-inline text-gray-600 small">로그아웃</button>
</a> -->
<button type="button" class="logout" id="logout" onclick="location.href='logout.do'">LOGOUT</button>

&nbsp;&nbsp;
<button type="button" class="mainpage" id="mainpage" onclick="location.href='guestMain.do'">MAIN PAGE</button>
<!-- Dropdown - User Information -->

			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="logout.do" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div>
		</ul>
     
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    