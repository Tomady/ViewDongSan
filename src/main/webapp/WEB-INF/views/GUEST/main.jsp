<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#imglist {
	width: 700px;
	height: 500px;
}

#contents {
	margin-top: 30px;
}

#jjim {
	width: 40px;
	height: 40px;
}

#jjimText {
	font-size: 20px;
	color: pink;
}

#noticeBtn {
	font-size: 30px;
	font-weight: bold;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script type="text/javascript">
        //체크인날짜 오늘날짜로 지정
        window.onload = function () {
            today = new Date();
            console.log("today.toISOString() >>>" + today.toISOString());
            today = today.toISOString().slice(0, 10);
            console.log("today >>>> " + today);
            checkindate = document.getElementById("checkindate");
            checkindate.value = today;
        }

        function schedule() {
            let checkindate = $("#checkindate").val();
            let checkoutdate = $("#checkoutdate").val();
            let area = $("#place").val();

            if (checkindate == '' || checkoutdate == '') { //날짜를 입력하지 않았을때
                alert("여행날짜를 입력해 주세요.");
            } else {
                today = new Date();
                today = today.toISOString().slice(0, 10);

                if (checkindate < today) { //체크인날짜가 현재날짜이전인경우
                    alert("체크인 날짜를 확인해주세요.");
                    $("#checkindate").focus();
                    $("#checkindate").val(today);
                    return;
                } else if (checkindate >= checkoutdate) { //체크아웃날짜가 체크인날짜와 같거나 이를 경우
                    alert("체크아웃 날짜를 확인해주세요.");
                    $("#checkoutdate").focus();
                    $("#checkoutdate").val("");
                    return;
                }
            }

            if (area != "") { //여행지 입력시
                console.log("여행지입력");
                $.ajax({
                    url: "AjaxSelectAreaRoomList.do",
                    data: {
                        area: area,
                        checkindate: checkindate,
                        checkoutdate: checkoutdate
                    },
                    type: "POST",
                    dataType: "json",
                    success: showList,
                    error: function () {
                        alert("리스트를 불러오는데 실패했습니다.\n관리자에게 문의하세요. [010-1234-1234]");
                    }
                })
            } else { //여행지 미입력시
                console.log("여행지미입력");
                $.ajax({
                    url: "AjaxSelectRoomList.do",
                    data: {
                        checkindate: checkindate,
                        checkoutdate: checkoutdate
                    },
                    type: "POST",
                    dataType: "json",
                    success: showList,
                    error: function () {
                        alert("리스트를 불러오는데 실패했습니다.\n관리자에게 문의하세요. [010-1234-1234]");
                    }
                })
            }
        }

        function showList(datas) {
            //기존에 검색조건결과 삭제
            if ($(".row align-items-center")) {
                $("#showshowshow>#contents").remove();
            }
            //검색조건결과 뿌리기
            for (let data of datas) {
                let contents = $("<div>").attr({
                    "id": "contents",
                    "class": "row align-items-center",
                    "roomid": data.roomId
                });

                let col = $("<div>").attr({
                    "class": "col-lg-6"
                });
                let aboutimg = $("<div>").attr({
                    "class": "about_img"
                });
                let imglist = $("<img>").attr({
                    "id": "imglist",
                    "src": "upload/" + data.roomImg
                });

                aboutimg.append(imglist);
                col.append(aboutimg);
                contents.append(col)

                let collg = $("<div>").attr({
                    "class": "col-lg-6"
                });
                let abouttext = $("<div>").attr({
                    "class": "about_text"
                });
                let roomid = $("<h2>").attr({
                    "id": "roomId"
                }).text(data.roomName);
                let roomsub = $("<h3>").text(data.roomSubject);
                let div = $("<div>");
                let division = $("<h1>").text("-");
                let table = $("<table>");
                let tbody = $("<tbody>");
                let trF = $("<tr>");
                let tdF = $("<td>");

                let rate = $("<h3>");

                let roomIdForAvg = data.roomId;

                let trS = $("<tr>");
                let tdS = $("<td>");
                let address = $("<h3>").text("🏠 " + data.roomAddress);

                let trT = $("<tr>");
                let tdT = $("<td>");
                let price = $("<h3>").text("💰 " + data.roomPrice + "/박");

                div.append(division)
                tbody.append(trF).append(tdF).append(rate);
                tbody.append(trS).append(tdS).append(address);
                tbody.append(trT).append(tdT).append(price);
                table.append(tbody);

                abouttext.append(roomid);
                abouttext.append(roomsub);
                abouttext.append(div);
                abouttext.append(table);

                var author = "${author}";

                if (author == "GUEST") {
                    let jjimDiv = $("<div>").attr("id", "jjimDiv");
                    let jjim = $("<input>").attr({
                        "type": "checkbox",
                        "id": "jjim",
                        "class": "jjim",
                        "roomid": data.roomId
                    });
                    let label = $("<label>").text("add wish").attr("class", "addwish");
                    label.attr("id", "jjimText");
                    jjimDiv.append(jjim);

                    abouttext.append(jjimDiv);
                    abouttext.append(label);
                }
                collg.append(abouttext);

                contents.append(collg);

                $("#showshowshow").append(contents);
            }

            //이미 위시리스트에 추가된 숙소는 input:checked해주기위해 ajax이용
            $.ajax({
                url: "AjaxAlreadyWishAddRoom.do",
                type: "POST",
                dataType: "json",
                success: function (datas) {
                    const inputAry = $(".jjim");
                    for (let input of inputAry) {
                        for (let data of datas) {
                            if (input.getAttribute("roomId") == data.roomId) {
                                input.setAttribute("checked", "checked");
                                input.closest("div").nextSibling.innerHTML = "";
                            }
                        }
                    }
                },
                error: function () {
                    alert("위시리스트 호출을 실패하였습니다.\n관리자에게 문의하세요.[010-1234-1234]");
                }
            });
        }

        $(document).on("click", "#showshowshow>#contents", function () {
            let checkindate = $("#checkindate").val();
            let checkoutdate = $("#checkoutdate").val();
            let roomid = event.target.closest("#contents").getAttribute("roomid");

            if (event.target.tagName == "INPUT") { //input을 눌렀을때는 상세보기화면으로 안넘어가도록 조건달기
                let inputClick = event.target.getAttribute("roomid");

                if ($(event.target).is(":checked")) { //체크했을때_위시리스트 추가                
                    $.ajax({
                        url: "AjaxWishAdd.do",
                        data: {
                            roomid: inputClick
                        },
                        type: "POST",
                        dataType: "text",
                        success: function (text) {
                            console.log("jjim.is checked success : " + text);
                        },
                        error: function () {
                            alert("위시리스트 추가가 실패하였습니다.\n관리자에게 문의하세요 [010-1234-1234]");
                        }
                    });
                 } else { //체크해제_위시리스트 삭제
                  	console.log("..jjim checked해제됨.");
                      $.ajax({
                          url: "AjaxWishDrop.do",
                          data: {
                              roomid: inputClick
                          },
                          type: "POST",
                          dataType: "text",
                          success: function (text) {
                              if (text == "OK") {
                                  let wishMove = confirm(
                                      "위시리스트에서 삭제되었습니다.\n위시리스트로 이동하시겠습니까?");
                                  if (wishMove) {
                                      location.href = "toWishList.do"; //위시리스트페이지로 던지기
                                  }
                              }
                          },
                          error: function () {
                              alert("위시리스트 삭제가 실패하였습니다.\n관리자에게 문의하세요 [010-1234-1234]");
                          }
                      })
                  }
            } else {
                location.href = "roomDetails.do?roomid=" + roomid + "&checkin=" + checkindate + "&checkout=" +
                checkoutdate;
            }
        });
    </script>
</head>

<body>
	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-10">
					<div class="banner_text text-center">
						<div class="banner_text_iner">
							<span id="siteTitle">ViewDongSan</span>
							<p>Let’s start your journey with us, your dream will come
								true</p>
							<a href="toNotice.do" class="btn_1" id="noticeBtn">NOTICE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->

	<!-- booking part start-->
	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="hotel-tab" data-toggle="tab" href="#" role="tab"
								aria-controls="hotel" aria-selected="true">Search for your
									schedule</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="booking_content">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="hotel" role="tabpanel"
								aria-labelledby="hotel-tab">
								<div class="booking_form">
									<form action="#">
										<div class="form-row">
											<div class="form_colum">
												<input id="place" placeholder="여행지를 입력하세요." type="text">
											</div>
											<div class="form_colum">
												<input id="checkindate" type="date">
											</div>
											<div class="form_colum">
												<input id="checkoutdate" type="date">
											</div>
											<div class="form_btn">
												<a href="#" class="btn_1" onclick="schedule()">search</a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Header part end-->

	<section class="about_us section_padding" id="room">
		<div class="container" id="showshowshow"></div>
	</section>

	<script type="text/javascript">
        function email() {
            // D-day 계산해서 이메일 보내기
            // emailjs 사용권한 인증      
            emailjs.init("user_kZovhkh7WXV5JcxukwLWf");

            let today = new Date();
            let checkin;
            let remain;

            <c:forEach items = "${ReservationList_email}" var = "vo" >
            checkin = new Date('${vo.checkIn}');
            remain = checkin.getDate() - today.getDate();

            console.log("남은 일 수 : " + remain);

            if (remain == 3) {
                console.log("리메인 인");
                // emailjs Param 설정   
                var templateParams = {
                    name: '${vo.guestId}',
                    notes: 'Check this out!',
                    email: '${vo.guestId}',
                    d_day: remain
                };

                // email 전송
                emailjs.send('service_0zt7f85', 'template_yfeqnik', templateParams)
                    .then(
                        function (response) {
                            console.log('SUCCESS!', response.status, response.text);
                        },
                        function (error) {
                            console.log('FAILED...', error);
                        });
            } // end of if
            </c:forEach>   
        }
        email();
    </script>
</body>
</html>