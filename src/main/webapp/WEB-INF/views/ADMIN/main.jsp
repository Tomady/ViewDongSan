<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>

<style>
		button {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;

			background: var(--button-bg-color);
			color: var(--button-color);

			margin: 0;
			padding: 0.5rem 1rem;

			font-family: 'Noto Sans KR', sans-serif;
			font-size: 1rem;
			font-weight: 400;
			text-align: center;
			text-decoration: none;

			border: none;
			border-radius: 4px;

			display: inline-block;
			width: auto;

			box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);

			cursor: pointer;

			transition: 0.5s;
			color: white;
		}

		button:active,
		button:hover,
		button:focus {
			background: var(--button-hover-bg-color);
			outline: 0;
		}
		button.error {
	  --button-bg-color: #dc3545;
	  --button-hover-bg-color: #c82333;
	}

		.check_th::before, .check_th::after{
			display: none !important;
			font-size:0;
			width:0;
			height: 0;
		}
	</style>
</head>

<body>
	<div class="container-fluid" >

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">전체조회</h1>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">MEMBER LIST</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<!-- <th ><input type="checkbox"></th> -->
								<th>ID</th>
								<th>NAME</th>
								<th>ADDRESS</th>
								<th>TEL</th>
								<th>AUTHOR</th>
								<th>STATUS</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hosts }" var="host">
								<tr>
									<!-- <td ><input type="checkbox"></td> -->
									<td>${host.hostId }</td>
									<td>${host.hname }</td>
									<td>${host.haddress }</td>
									<td>${host.htel }</td>
									<td>${host.author }</td>
									<td>${host.status }</td>
								</tr>
							</c:forEach>
							<c:forEach items="${guests }" var="guest">
								<tr>
									<!-- <td ><input type="checkbox"></td> -->
									<td>${guest.guestId }</td>
									<td>${guest.gname }</td>
									<td>${guest.gaddress }</td>
									<td>${guest.gtel }</td>
									<td>${guest.author }</td>
									<td>${guest.status }</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
					<div class="delbtn"></div>
				</div>

			</div>
		</div>

	</div>
	<script>
		// console.log($("#allCheck"));
		// $("#allCheck").click(function () {
		// 	console.log("체크됨");
		// 	var chk = $("#allCheck").prop("checked");
		// 	if (chk) {
		// 		$(".chBox").prop("checked", true);
		// 	} else {
		// 		$(".chBox").prop("checked", false);
		// 	}
		// });

		// $(".chBox").click(function () {
		// 	$("#allCheck").prop("checked", false);
		// });
	</script>

	<script>
		
	</script>
</body>

</html>