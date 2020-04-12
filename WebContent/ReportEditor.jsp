<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="DBPackage.DatabaseConnection" %>
<%
		Cookie []cookie = request.getCookies();
		String userName = cookie[0].getValue();
		String content="";
		try {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DatabaseConnection.initializeDatabase();
		statement = connection.createStatement();
		String sql = "select content from ReportsTable where id='"+userName+"'";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			content=resultSet.getString("content");
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		%>

<!DOCTYPE html>
<html>
<head>
<title>Reports page</title>
<script
	src='https://cdn.tiny.cloud/1/zqslf4u5l4z3vusgfxmvmxqgg7ikwdsh6z0aff66zuulpjqv/tinymce/5/tinymce.min.js'
	referrerpolicy="origin"></script>
<script>
  tinymce.init({
    selector: '#report'
  });
  </script>
<style>
*{
margin: 0px; padding: 0px;
}
footer {
	border-top: 1px solid grey;
	height: 5vh;
	text-align: center;
	float: bottom;
	bottom: 0;
	padding: 2vh;
	margin-top: 100px;
	background: dodgerblue;
	color: white;
}

footer a{
	text-decoration: none;
	color: lightgrey;
}
footer a:hover{
	color: white;
}
form{
	width: 95vw;
	height: 80vh;
}
button {
	background: dodgerBlue;
	border-radius: 20px;
	width: 25%;
	font-size: 12px;
	height: 30px;
	color: white;
	cursor: pointer;
}

button:hover {
	border-color: dodgerBlue;
	box-shadow: 0 0 10px 0 grey;
}
body{
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}
.navbar {
	z-index: 10;
	box-shadow: 2px 2px 2px 2px lightgrey;
	overflow: hidden;
	background-color: dodgerblue;
	position: sticky;
	position: -webkit-sticky;
	top: 0;
}
.navbar .label{
padding: 12px 18px;
float: left;
color: white;
font-size: 20px; 
border-right: 1px solid lightgrey;
}
.navbar .label2{
padding: 14px 20px;
float: left;
color: white;
}
.navbar a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
}

.navbar a.right {
	float: right;
}

.navbar a:hover {
	background-color: white;
	color: dodgerblue;
}

.navbar a.active {
	background-color: white;
	color: dodgerblue;
	text-decoration: underline;
	border-top: 1px solid dodgerblue;
}
</style>
</head>

<body background="cover_3.png">
<div class="navbar">
	<span class="label">PICT</span>
	<span class="label2">Project Management System</span>
		<a href="LoginPage.html" class="right">Logout</a>
		<a href="HomePage.jsp" class="right">Home</a> 
		<a href="#" class="right active">Team Page</a> 
	</div>
<center>
	<form style="margin-top: 10px;" method="post" action="SubmitReport">
		<textarea id="report" rows=30 name="reportcontent"><%=content %></textarea><br><br>
		<button type="submit" value="Upload">Upload</button>
	</form>
	</center>
	
	<footer>
		<a href="TermsnConditions.html">Terms and conditions </a>|<a href="AboutUs.html"> About us </a>|<a
			href="ContactUs.html"> Contact us </a> <br>
		<span style="font-size: 10px;">&copy; Copyright 2020</span>
	</footer>
</body>
</html>