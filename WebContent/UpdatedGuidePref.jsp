<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="DBPackage.DatabaseConnection" %>
<%
String currentUser = request.getCookies()[0].getValue();
Connection connection = null;
Statement statement = null;
ResultSet resultSet, resultSet1, resultSet2, resultSet3 = null;
try {
	
	connection = DatabaseConnection.initializeDatabase();
	statement = connection.createStatement();
	
	String sql = "select * from GuidePreferences where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();

	String pref1 = resultSet.getString("pref1");
	String pref2 = resultSet.getString("pref2");
	String pref3 = resultSet.getString("pref3");
	String spdetails = resultSet.getString("spdetails");
	String extgd = resultSet.getString("extgd");
	String pref[]=new String[3];
	sql = "select * from GuidesTable where id = '" + pref1 + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	pref[0] = resultSet.getString("name");
	sql = "select * from GuidesTable where id = '" + pref2 + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	pref[1] = resultSet.getString("name");
	sql = "select * from GuidesTable where id = '" + pref3 + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	pref[2] = resultSet.getString("name");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updated Guide Preferences</title>
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
	margin-top: 80px;
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
.form-style {
	width: 70vw;
	padding: 30px;
	margin: 20px auto;
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
}

.form-style .inner-wrap {
	padding: 30px;
	background: #F8F8F8;
	border-radius: 6px;
	margin-bottom: 15px;
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

.form-style .inner-wrap:hover {
	transition-duration: 0.5s;
}

.form-style h1 {
	background: dodgerblue;
	padding: 20px 30px 15px 30px;
	margin: -30px -30px 30px -30px;
	border-radius: 10px 10px 0 0;
	-webkit-border-radius: 10px 10px 0 0;
	-moz-border-radius: 10px 10px 0 0;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
}

.form-style h1>span {
	display: block;
	margin-top: 2px;
	font: 13px Arial, Helvetica, sans-serif;
}

.form-style label {
	display: block;
	font: 13px Arial, Helvetica, sans-serif;
	color: #888;
	margin-bottom: 15px;
}

input, textarea {
	display: block;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	width: 100%;
	padding: 8px;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	outline: none;
	border: 2px;
	overflow: hidden;
}

input:focus, textarea:focus {
	border: 2px solid dodgerblue;
	transition-duration: 0s;
}

.form-style .section {
	font: normal 20px 'Bitter', serif;
	color: dodgerblue;
	margin-bottom: 5px;
}

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
}

.form-style .section span {
	background: dodgerblue;
	padding: 5px 10px 5px 10px;
	position: absolute;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border: 4px solid #fff;
	font-size: 14px;
	margin-left: -45px;
	color: #fff;
	margin-top: -3px;
}

.form-style input[type="button"], .form-style input[type="submit"] {
	background: white;
	padding: 8px 20px 8px 20px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	color: dodgerblue;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 2px solid dodgerblue;
	font-size: 15px;
}

.form-style input[type="button"]:hover, .form-style input[type="submit"]:hover
	{
	background: dodgerblue;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	transition-duration: 1s;
	color: white;
}

.form-style .privacy-policy {
	float: right;
	width: 250px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #4D4D4D;
	margin-top: 10px;
	text-align: right;
}

.box {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 1px solid dodgerblue;
	outline: none;
}

select {
	background-color: white;
	color: dodgerBlue;
	padding: 12px;
	width: 100%;
	border-radius: 10px;
	font-size: 20px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
	-webkit-appearance: button;
	appearance: button;
	border: none;
	background: none;
}

select:focus {
	border: 2px solid dodgerblue;
}

.box::before {
	content: "\f13a";
	font-family: FontAwesome;
	position: absolute;
	top: 0;
	right: 0;
	width: 20%;
	height: 100%;
	text-align: center;
	font-size: 28px;
	line-height: 45px;
	color: rgba(255, 255, 255, 0.5);
	background-color: rgba(255, 255, 255, 0.1);
	pointer-events: none;
}

.box:hover::before {
	color: rgba(255, 255, 255, 0.6);
	background-color: rgba(255, 255, 255, 0.2);
}

select option {
	padding: 30px;
	border: none;
	outline: none;
}

select-items {
	border: none;
	outline: none;
}
body {
	background: url('cover_5.png');
}
</style>

</head>
<body>
	<div class="navbar">
	<span class="label">PICT</span>
	<span class="label2">Project Management System</span>
		<a href="LoginPage.html" class="right">Logout</a>
		<a href="HomePage.jsp" class="right">Home</a> 
		<a href="#" class="right active">Guides Page</a> 
	</div>
	<div style="padding: 40px;">
		<div class="form-style">
			<h1>
				Guide Preference Submission. <span> This is what you have submitted.</span>
			</h1>
			<form id="f1">
				<div class="section">
					<span>1</span>Preference 1:
				</div>
				<div class="inner-wrap">
					<input type="text" name="field1" class="f1" id="f1" value='<%=pref[0].replaceAll("_"," ")%>' disabled />
				</div>

				<div class="section">
					<span>2</span>Preference 2:
				</div>
				<div class="inner-wrap">
					<input type="text" name="field2" class="f1" id="f1" value='<%=pref[1].replaceAll("_"," ")%>' disabled />
				</div>

				<div class="section">
					<span>3</span>Preference 3:
				</div>
				<div class="inner-wrap">
					<input type="text" name="field1" class="f1" id="f1"  value='<%=pref[2].replaceAll("_"," ")%>' disabled />
				</div>

				<div class="section">
					<span>4</span>Additional Information:
				</div>
				<div class="inner-wrap">
					<label>Sponsorship Details: <input type="text"
						name="field4"  value='<%=spdetails%>' disabled  />
					</label> <label>External Guide: <input type="text" name="field5"
						 value='<%=extgd %>' disabled/>
					</label>
				</div>
			</form>
		</div>
	</div>
	
	
	<footer>
		<a href="TermsnConditions.html">Terms and conditions </a>|<a href="AboutUs.html"> About us </a>|<a
			href="ContactUs.html"> Contact us </a> <br>
		<span style="font-size: 10px;">&copy; Copyright 2020</span>
	</footer>
</body>
</html>
<%
statement.close();
connection.close();
} catch (Exception e) {
	e.printStackTrace();
}%>