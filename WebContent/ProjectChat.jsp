<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Project Chat Screen</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.form-style {
	width: 70vw;
	padding: 30px;
	margin: 5vw auto;
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

.form-style .inner-wrap:hover {
	box-shadow: 0px 5px 13px 7px rgba(0, 0, 0, 0.2);
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

.form-style input[type="text"], .form-style input[type="date"],
	.form-style input[type="datetime"], .form-style input[type="email"],
	.form-style input[type="number"], .form-style input[type="search"],
	.form-style input[type="time"], .form-style input[type="url"],
	.form-style input[type="password"], .form-style textarea, .form-style select
	{
	display: block;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	width: 100%;
	padding: 8px;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border: 2px solid #fff;
}

.form-style .section {
	font: normal 20px 'Bitter', serif;
	color: dodgerblue;
	margin-bottom: 5px;
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

body {
	background: url('cover_5.png');
}

a {
	color: lightgrey;
	text-decoration: none;
	font-size: 18px;
}

a:hover {
	color: white;
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

.navbar .label {
	padding: 16px;
	float: left;
	color: white;
	font-size: 16px;
	width: 20vw;
	text-align: center;
	border-right: 1px solid lightgrey;
}

.navbar .label2 {
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
table{
background: white;
}
table tr:hover{
background: lightgrey;
}
.simplenav {
	float: left;
	color: lightgrey;
	background: lightgrey;
	border-right: 1px solid dodgerblue;
	margin-top: 20px;
	width: 20vw;
	height: 100vh;
	margin-top: -10vh;
}

.simplenav a {
	text-decoration: none;
	color: darkgrey;
	cursor: pointer;
}

.simplenav a:hover {
	background: darkgrey;
	color: white;
}
header{
background: dodgerblue;
color: white;
display: flex;
margin: 0;
border-radius: 10px 10px 0 0;
font-size: 30px;
text-decoration: bold;

padding: 10px;
}

footer {
	border-top: 1px solid grey;
	height: 5vh;
	text-align: center;
	float: bottom;
	bottom: 0;
	padding: 2vh;
	background: dodgerblue;
	color: white;
	width: 98vw;
	margin-top: 25vh;
}
footer a {
	text-decoration: none;
}

button {
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: dodgerblue;
	cursor: pointer;
	border: 2px solid dodgerBlue;
	padding: 5px;
}

button:hover {
	border-color: dodgerBlue;
	color: white;
	background: dodgerblue;
	transition-duration: 1s;
}
</style>
</head>
<body>
	<div class="navbar">
		<span class="label">Project Management System</span> <span
			class="label2">PICT</span> <a href="LoginPage.html" class="right">Logout</a>
		<a href="GuideHome.jsp" class="right">Home</a> <a href="#"
			class="right active">Homescreen</a>
	</div>
	<div class="form-style">
		<header>
			Project Chat
		</header>
		<table id = "msgbox"  style="border: 3px solid dodgerblue;width: 100%;">        
        <%
ArrayList<String> date =  (ArrayList<String>)request.getAttribute("date");  
        ArrayList<String> time =  (ArrayList<String>)request.getAttribute("time");  
        ArrayList<String> msg =  (ArrayList<String>)request.getAttribute("msg");   
        Object project = request.getAttribute("project");
        String proj = project.toString();
        for(int i=0;i<date.size();i++){
        %> 
            <tr> 
                <td><%=date.get(i)%></td> 
                <td><%=time.get(i)%></td> 
                <td><%=msg.get(i)%></td> 
            </tr> 
            <%}%> 
            <div id = "ajaxResponse"></div>
        </table>
        <br>
        <textarea wrap = "hard" cols = 65 name = "text_to_send" id = "text_to_send" placeholder="Type message.." name="msg" style = "overflow: hidden;display: inline;"></textarea>
     <br>
  <button id = "send" onclick  = "sendMsg()" style = "float: right; display: inline;">Send</button>

	</div>


<script>
function sendMsg() {
  console.log("<%= proj%>"); 	    
  $.post('ProjectChatServlet', {
		project : "<%= proj%>",
		choice : "send",
		text_to_send : document.getElementById("text_to_send").value.toString()
	}, function(responseText) {
		$("#msgbox").append(responseText);
		document.getElementById("text_to_send").innerHTML = "";
	});
}
</script>
	
<footer>
		<a href="TermsnConditions.html">Terms and conditions </a>|<a href="AboutUs.html"> About us </a>|<a
			href="ContactUs.html"> Contact us </a> <br>
		<span style="font-size: 10px;">&copy; Copyright 2020</span>
	</footer>
</body>
</html>

