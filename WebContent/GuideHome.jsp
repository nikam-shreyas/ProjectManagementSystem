<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="DBPackage.DatabaseConnection" %>
<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Guide Homescreen</title>
<link href='http://fonts.googleapis.com/css?family=Bitter'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style>
*{margin: 0px; padding: 0px;}

.form-style {
	width: 90vw;
	padding: 30px;
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

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 8px 12px;
	font-size: 12px;
	cursor: pointer;
	border-radius: 5px;
}

.form-style .section {
	font: normal 20px 'Bitter', serif;
	color: dodgerblue;
	margin-bottom: 5px;
}

.selected {
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

.selected:focus {
	border: 2px solid dodgerblue;
}

.outer_table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

.outer_table td, th {
  border-bottom: 2px solid #dddddd;
  text-align: left;
  padding: 8px;
}
.outer_table th{
background-color: grey;
color: white;
border-right: 1px solid white;
} 
.outer_table tr:hover{
background-color: lightgrey;
transition-duration: 1s;
}

.inner_table{
border: 0;
width: 100%;
}
.inner_table td{
padding: 2px;
border: 0;
}

.inner_table tr{
	background-color: none;
}

.inner_table tr:nth-child(even) {
  background-color: none;
}
header{
background: dodgerblue;
color: white;
display: flex;
margin: 0;
font-size: 30px;
text-decoration: bold;
border-radius: 10px 10px 0 0;
padding: 10px;
}
p{
background: dodgerblue;
color: white;
display: flex;
margin: 0;
font-size: 15px;
padding: 10px;

}
.container{
margin: 30px;
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
	margin-top: 5vh;
}

footer a{
	text-decoration: none;
	color: lightgrey;
}
footer a:hover{
	color: white;
}
</style>

</head>
<body background = "">
<div class="container">
			<header>
				Current Projects </header>
				 <p> Check the progress of your current projects.</p>
					
			<table class = "outer_table">
			<tr>
			<th>Group Id</th>
			<th>Project Title</th>
			<th>Students Details</th>
			<th>Project Synopsis</th>
			<th>Context</th>
			<th>Concept</th>
			<th></th>
			</tr>
			<%
			try {
				Cookie cookie[] = request.getCookies();
				String currentUser = cookie[0].getValue();
				connection = DatabaseConnection.initializeDatabase();
				System.out.println(currentUser);
				statement = connection.createStatement();
				String sql = "select * from TeamInfoTable join SynopsisTable on TeamInfoTable.id = SynopsisTable.id join Projects on SynopsisTable.id = Projects.id where Projects.guide = '"+currentUser+"';";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) { 
			%>
			<tr>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("proj_title") %></td>
			<td><table class="inner_table">
			<tr>
			<td><%=resultSet.getString("st1name") %></td>
			<td><%=resultSet.getString("st1roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st2name") %></td>
			<td><%=resultSet.getString("st2roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st3name")==null?"":resultSet.getString("st3name") %></td>
			<td><%=resultSet.getString("st3roll")==null?"":resultSet.getString("st3roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st4name")==null?"":resultSet.getString("st4name") %></td>
			<td><%=resultSet.getString("st4roll")==null?"":resultSet.getString("st4roll") %></td>
			</tr>
			</table></td>
			<td><%=resultSet.getString("proj_statement") %></td>
			<td><%=resultSet.getString("proj_context") %></td>
			<td><%=resultSet.getString("proj_concept") %></td>
			<td><form action="ProjectChatServlet" method="post" id = 'projectChatServlet'>
			<input type = "text" name = "choice" value = "load" style = 'visibility: hidden;'>
			<input type = "text" name = "project" value = '<%= resultSet.getString("id") %>' style = 'visibility: hidden;'>
			<input type = "text" name = "guide_id" value = "<%=currentUser %>" style = 'visibility: hidden;'>
			<button id="<%= resultSet.getString("id") %>" class="btn">Go To Project</button></form>
			</td>
			</tr>
			<%
			}
			%>
			</table>
			<br> <br>
			<header>
				Project Applications </header>
				 <p> Following are the projects
					requesting your guidance. Reject and Accept them as you prefer.</p>
					
			<table class = "outer_table">
			<tr>
			<th>Group Id</th>
			<th>Project Title</th>
			<th>Students Details</th>
			<th>Project Synopsis</th>
			<th>Context</th>
			<th>Concept</th>
			<th>Accept</th>
			<th>Reject</th>
			</tr>
			<%
					statement = connection.createStatement();
					sql = "select * from TeamInfoTable join SynopsisTable on TeamInfoTable.id = SynopsisTable.id join CurrentAppliedGuide on SynopsisTable.id = CurrentAppliedGuide.id where CurrentAppliedGuide.guide = '"+currentUser+"';";
					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {
			%>
			
			<tr>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("proj_title") %></td>
			<td><table class="inner_table">
			<tr>
			<td><%=resultSet.getString("st1name") %></td>
			<td><%=resultSet.getString("st1roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st2name") %></td>
			<td><%=resultSet.getString("st2roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st3name")==null?"":resultSet.getString("st3name") %></td>
			<td><%=resultSet.getString("st3roll")==null?"":resultSet.getString("st3roll") %></td>
			</tr>
			<tr>
			<td><%=resultSet.getString("st4name")==null?"":resultSet.getString("st4name") %></td>
			<td><%=resultSet.getString("st4roll")==null?"":resultSet.getString("st4roll") %></td>
			</tr>
			</table></td>
			<td><%=resultSet.getString("proj_statement") %></td>
			<td><%=resultSet.getString("proj_context") %></td>
			<td><%=resultSet.getString("proj_concept") %></td>
			<td><button class="btn" id="<%= resultSet.getString("id") %>" onclick="apply(this.id)">Accept</button></td>
			<td><button class="btn" id="<%= resultSet.getString("id") %>" onclick="reject(this.id)">Reject</button></td>
			</tr>
			<%
				}
					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
</table>
</div>
	<script>
	
	var ca = decodeURIComponent(document.cookie).split(';')[0]
	var guide_id = ca.substring("userId=".length, ca.length);
		function nav() {
			window.location.href = "project_screen.html";
		}

		function reject(proj_id) {
				var d = document.getElementById(proj_id);
				$.post('GuideResponseServlet', {
					userName : proj_id,
					status : 'R'
				}, function(responseText) {
					alert(responseText + " has been rejected.");
				});
				//d.parentElement.parentElement.parentElement.removeChild(d.parentElement.parentElement);
				$(d.parentElement.parentElement).fadeOut();
		}
		function apply(proj_id) {
				var d = document.getElementById(proj_id);
				$.post('GuideResponseServlet', {
					userName : proj_id,
					status : 'A'
				}, function(responseText) {
					alert(responseText + " has been accepted.");
				});
				//d.parentElement.parentElement.parentElement.removeChild(d.parentElement.parentElement);
				$(d.parentElement.parentElement).fadeOut();
		}
		
		function project(proj_id) {
			document.getElementById('guide_id') = guide_id;
			document.getElementById('projectChatServlet').submit();	
	}
	</script>
	
	<footer>
		<a href="TermsnConditions.html">Terms and conditions </a>|<a href="AboutUs.html"> About us </a>|<a
			href="ContactUs.html"> Contact us </a> <br>
		<span style="font-size: 10px;">&copy; Copyright 2020</span>
	</footer>
</body>
</html>





