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
			--button-bg-color: #fa8591;
			--button-hover-bg-color: #f15d6c;
			float: right;
		}

		.check_th::before,
		.check_th::after {
			display: none !important;
			font-size: 0;
		}
		.allcheck:nth-child(0){
		w
		}
	</style>
</head>

<body>
	<div class="container-fluid" >

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">멤버조회</h1>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">GUEST LIST</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr class="allCheck">
								<th class="check_th">
									<input type="checkbox" name="allCheck" id="allCheck" /><label
										for="allcheck"></label>
								</th>
								<th>ID</th>
								<th>NAME</th>
								<th>ADDRESS</th>
								<th>TEL</th>
								<th>AUTHOR</th>
								<th>STATUS</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${guestlist }" var="guest">
								<tr>
									<td><input type="checkbox" name="chBox" class="chBox">
										<input type="hidden" name="hostid" value="${guest.guestId}"></td>
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
					<div>
						<button type="button" id="error" class="error" onclick="deleteGuest()">삭제</button>
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

		function deleteGuest() {
			var checkBoxArr = [];
			$("input[class='chBox']:checked").each(function () {
				// checkBoxArr.push($(this).data("hostId")); // 체크된 것만 값을 뽑아서 배열에 push
				// checkBoxArr.push($('.chBox').data("hostId"));
				// console.log(checkBoxArr);
				// checkBoxArr.push(temp);
				// console.log(temp)
				var temp = $(this).closest('td').find('input[type=hidden]').val();
				var re =  $(this).closest('td').find('input[type=hidden]').closest('tr')
				$.ajax({
					type: "POST",
					url: "deleteguest.do",
					dataType: "text",
					data : {
						checkboxarr : temp
					},
					success: function (data) {
						console.log("ajax: " + data);
						console.log($(event.target));
						re.remove();
					}
						
				});
			})

			// $.ajax({
			// 	type: "POST",
			// 	url: "deletehost.do",
			// 	dataType: "json",
			// 	data : formdata,
			// 	// data: {
			// 	// 	// checkboxarr: checkBoxArr // folder seq 값을 가지고 있음.
			// 	// 	checkBoxArr : formdata
			// 	// },
			// 	success: function (result) {
			// 		console.log(result);
			// 	}
			// });
		}



		//  $(".selectDelete_btn").click(function(){
		//   var confirm_val = confirm("정말 삭제하시겠습니까?");

		//   if(confirm_val) {
		//    var checkArr = new Array();

		//    $("input[class='chBox']:checked").each(function(){
		//     checkArr.push($(this).attr("data-hostId"));
		//    });

		//    $.ajax({
		//     url : "deletehost.do",
		//     type : "post",
		//     data : { chbox : checkArr },
		//     success : function(){
		//      location.href = "/ViewDongSan/guestlist.do";
		//     }
		//    });
		//   } 
		//  });
	</script>
</body>

</html>