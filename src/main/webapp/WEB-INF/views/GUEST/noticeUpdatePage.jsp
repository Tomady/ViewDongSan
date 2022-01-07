<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wdate {
	float: right;
}

#subject {
	font-size: 20px;
}
#uploadText{
	font-size: 15px;
}
#noText{
	font-size: 20px;
}
#no{
	width:40px;
	font-size: 20px;
}
</style>
</head>
<body>
	<form action="noticeUpdate.do" method="post" enctype="multipart/form-data">
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<label>No.</label>
				<input id="no" name="no" readonly value="${notice.no}">
				<h3 class="mb-30">제목 : ${notice.ntitle}</h3>
				<div class="row">
					<div class="col-lg-12">
						<blockquote id="subject1" class="generic-blockquote">
							<textarea id="subject" name="subject" rows="10" cols="80">${notice.nsubject}</textarea>
							<img name="oldImg" src="upload/${notice.nimg}"><br><br>
							<span id="uploadText">[새로운 이미지 업로드] : </span>&nbsp;&nbsp;
							<input type="file" name="newImg">
						</blockquote>
						<c:set var="wdate" value="${notice.nwdate}"/>
						<span id="wdate">📅작성일자 : ${fn:substring(wdate,0,10)}</span>
					</div>
					<br>
					<br>
					<button class="genric-btn primary-border circle" id="saveBtn"
						type="submit">SAVE</button>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>