<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Host My Page</title>

<style>
#legend {
   font-family: 'Amiri', serif;
   font-size: 40px;
   color: navy;
}

fieldset {
   border: 2px solid navy;
   font-family: 'IBM Plex Sans KR', sans-serif;
   color: navy;
   width: 1000px;
}

.left_part {
   margin-left: 140px;
   width: 300px;
   float: left;
}


#imgfile {
   width: 250px;
   height: 250px;
}

#icon {
   width: 30px;
   height: 30px;
   padding-left: 100px;
}

#uploadBtn {
   background-color: rgb(252, 249, 245);
   border: none;
   color: gray;
   font-weight: bold;
}

#uploadBtn:hover {
   
   border: white 1px solid;
   color: coral;
   font-weight: bold;
}

.file-label {
   margin-top: 10px;
   color: gray;
   font-weight: bold;
   text-align: center;
}

.file-label:hover {
   cursor: pointer;
   color: coral;
   font-weight: bold;

}

.file {
   display: none;
}

#drop {
   color: red;
}

#drop:hover {
   font-weight: bold;
   cursor: pointer;
}
.form-control{
   border: none;
   background-color: rgb(236, 233, 233);
   width: 400px;
   font-size: 16px;
   heigth: 30px;
   padding-top: 5px;
   padding-bottom: 5px;
}
label{
   font-weight: bold;
   font-size: 12px;
}
#saveBtn{
   border: 1px solid navy;
   color: navy;
   background-color: rgb(252, 249, 245);
   width: 75px;
   height: 35px;
   border-radius: 15px;
   font-weight: bold;
   margin-left: 330px;
}

</style>
</head>
<body>
   <fieldset>
      <legend id="legend">My Info</legend>

      <div class="left_part">
         <img src="upload/${host.himg}" id="imgfile"><br> 
         <label class="file-label" for="chooseFile">📷 프로필 선택</label> 
         <input class="file" id="chooseFile" type="file">
         <button id="uploadBtn" onclick="test()">
            <img src="img/icon/업로드.png" id="icon">UP</button>
         <br> <br> <label class="bye" id="drop" onclick="dropFnc()">회원탈퇴</label>
      </div>
      <!-- end of left_part -->

      <div class="right_part">
         <div class="form-group">
            <label>ID</label><br>
            <input type="text" class="form-control" id="hostid" value="${host.hostId}" data-id="${host.hostId}" readonly>
         </div>
         
         <div class="form-group">
            <label>PW</label><br>
            <input type="password" class="form-control" id="hostpw" value="${host.hpassword}" data-pw="${host.hpassword}" placeholder="Password">
         </div>
         
         <div class="form-group">
            <label>NAME</label><br>
            <input type="text" class="form-control" id="hostname" value="${host.hname}" data-name="${host.hname}" placeholder="NAME">
         </div>
         
         <div class="form-group">
            <label>TEL</label><br> 
            <input type="text" class="form-control" id="hosttel" value="${host.htel}" data-tel="${host.htel}" placeholder="TEL">
         </div>
         
         <div class="form-group">
            <label>ADDRESS</label><br>
            <input type="text" class="form-control" id="hostaddr" value="${host.haddress}" data-addr="${host.haddress}" placeholder="ADDRESS">
         </div>
         <br>
         <br>
         <br>
         <button id="saveBtn" onclick="saveFnc()">SAVE</button>

      </div><!-- end of right_part -->
      <br>



   </fieldset>

   <script src="js/jquery-1.12.1.min.js"></script>
   <script type="text/javascript">
      //프로필 업로드
      function test() {
         let hostid = $("#hostid").val();
         var form = new FormData();
         form.append("file", $("#chooseFile")[0].files[0]);
         form.append("id", hostid);
         console.log("ffff");

         $.ajax({
            url : "AjaxHostProfileUpload.do",
            type : "post",
            processData : false,
            contentType : false,
            data : form,
            success : function(data) {
               console.log(data);
               $("#imgfile").attr("src", data);
               $("#imgView").show();
            },
            error : function() {
               console.log("fail");
            }
         })
      }

      $("#chooseFile").change(function() {
         let hostid = $("#hostid").val();
         var form = new FormData();
         form.append("file", $("#chooseFile")[0].files[0]);
         form.append("id", hostid);
         console.log("dddd");

         $.ajax({
            url : "AjaxHostProfileUpload.do",
            type : "post",
            processData : false,
            contentType : false,
            data : form,
            success : function(data) {
               console.log(data);
               $("#imgfile").attr("src", data);
               $("#imgView").show();
            },
            error : function() {
               console.log("fail");
            }
         })
      })

      //회원탈퇴
      function dropFnc() {
         let hostid = $("#hostid").val();
         var answer = confirm("정말 탈퇴하실건가요...?");
         if (answer) {
            $.ajax({
               url : "AjaxDropHost.do",
               type : "POST",
               data : {
                  id : hostid
               },
               dataType : "text",
               success : function(data) {
                  if (data == "DeleteOK") {
                     alert("탈퇴..성공적... bye..★");
                     location.href = "logout.do";
                  }
               }
            })
         } else {
            alert("감사합니다! 저희가 더 잘할게요 0_<-★");
         }
      }

      //정보수정
      function saveFnc() {
         let hostid = $("#hostid").val();
         let hostPw = $("#hostpw").data("pw");
         let hostName = $("#hostname").data("name");
         let hostTel = $("#hosttel").data("tel");
         let hostAddr = $("#hostaddr").data("addr");

         if ($("#hostpw").val() != "") {
            hostPw = $("#hostpw").val();
         }
         if ($("#hostname").val() != "") {
            hostName = $("#hostname").val();
         }
         if ($("#hosttel").val() != "") {
            hostTel = $("#hosttel").val();
         }
         if ($("#hostaddr").val() != "") {
            hostAddr = $("#hostaddr").val();
         }

         $.ajax({
            url : "AjaxHostInfoUpdate.do",
            type : "POST",
            data : {
               id : hostid,
               pw : hostPw,
               name : hostName,
               tel : hostTel,
               addr : hostAddr
            },
            dataType : "json",
            success : function(data) {
               alert("회원정보 수정이 완료되었습니다.");
               location.href = "hostMyPage.do";
            },
            error : function() {
               alert("회원정보 수정이 실패하였습니다.");
            }
         });
      }
   </script>
</body>
</html>