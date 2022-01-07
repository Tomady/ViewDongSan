<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html{
		background-color: rgb(252, 249, 245);
	}
	
	#container{
		margin: 0px auto;
		width: 100%;
	}
	#header{
		margin-bottom: 5px;
		
	}
	#menu{
		width: 13%;
		height: 70%;
		padding: 5px;
		margin-right: 5px;
		float: left;
	}
	#content{
		width: 75%;
		padding: 5px;
		margin-right: 15px;
		float: left;
	
	}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>