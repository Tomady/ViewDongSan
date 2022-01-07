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
			float: right;
		}

		.check_th::before,
		.check_th::after {
			display: none !important;
			font-size: 0;
		}
		.checkbtn{
			--button-bg-color: #b5dfdb !important;
			--button-hover-bg-color: #ccc6ff;
		}
	</style>

	<script>
		function hostSales(id) {
			$("#hid").val(id);
			$("")
		}

	</script>
</head>

<body>
	<div class="container-fluid" >

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">멤버조회</h1>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">HOST LIST</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr class="allCheck">
								<th class="check_th">
									<input type="checkbox" name="allCheck" id="allCheck" />
									<label for="allcheck"></label>
								</th>
								<th>ID</th>
								<th>NAME</th>
								<th>ADDRESS</th>
								<th>TEL</th>
								<th>AUTHOR</th>
								<th>STATUS</th>
								<th class="check_th">매출확인</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${hostlist }" var="host">
								<tr>
									<td>
										<input type="checkbox" name="chBox" class="chBox">
										<input type="hidden" name="hostid" value="${host.hostId}">
									</td>
									<td>${host.hostId }</td>
									<td>${host.hname }</td>
									<td>${host.haddress }</td>
									<td>${host.htel }</td>
									<td data-hostid="${host.hostId}">${host.author }
										<select name="author" id="selectauthor" size="1" style="width: 200px;">
										<option value="선택">선택</option>
											<option value="HOST">HOST</option>
											<option value="SUPERHOST">SUPERHOST</option>
											<option value="GATEKEEPER">GATEKEEPER</option>
										</select></td>
									<td>${host.status }</td>
									<td><button type="button" id="checkbtn" class="checkbtn" onclick="location.href='allchart.do'">확인</button></td>
								</tr>
							</c:forEach>
							<form id="hostFrm" method="post" action="hostChart.do">
								<input type="hidden" id="hid" name="hostid">
							</form>
						</tbody>
					</table>
					<div>
						<button type="button" id="error" class="error" onclick="deleteHost()">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		console.log($("#allCheck"));
		$("#allCheck").click(function () {
			console.log("체크됨");
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});

		$(".chBox").click(function () {
			$("#allCheck").prop("checked", false);
		});
	</script>
	<script>
		function deleteHost() {
			var checkBoxArr = [];
			$("input[class='chBox']:checked").each(function () {
				// checkBoxArr.push($(this).data("hostId")); // 체크된 것만 값을 뽑아서 배열에 push
				// checkBoxArr.push($('.chBox').data("hostId"));
				// console.log(checkBoxArr);
				console.log("확");
				console.log($(event.target));
				var temp = $(this).closest('td').find('input[type=hidden]').val();
				console.log("gg"+temp)
				var re = $(this).closest('td').find('input[type=hidden]').closest('tr')
				console.log(re)
				// checkBoxArr.push(temp);
				// console.log(temp)
				$.ajax({
					type: "POST",
					url: "deletehost.do",
					dataType: "text",
					data: {
						checkboxarr: temp
					},
					success: function (data) {
						console.log("ajax: " + data);
						console.log($(event.target));
						re.remove();
					}


				});
			})

		}
		var authorArr = []
		var authorcheck = document.querySelectorAll("#selectauthor");
		// var hhid = $("#selectauthor:selected").parent().prev().prev().prev().prev().text();
		
		$(authorcheck).change(function () {
			console.log($(this));
			// var hhid = $(event.target).closest('td').find('input[type=hidden]').val();
			console.log(authorcheck);
			var author1 = (this).closest('td').getAttribute('data-hostid');
			var temp = (this.value);
			console.log(temp);
			console.log(author1);
			// console.log(hhid)
			// $("authorcheck").each(function () {
				$.ajax({
					type: "POST",
					url: "updatehost.do",
					dataType: "text",
					data: {
						authorArr: temp,
						hostid : author1
					},
					success: function (data) {
						console.log("ajax: " + data);

					},error: function (data) {
						console.log("fail: " + data);
					}
				})
			// }
			// );
			// alert(this.value);
		})
		// $('#selectauthor').change(function(){
		// 	alert(this.value);
		// })
	</script>
</body>

</html>