<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPackage.DatabaseConnection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String resultTable = "[";

	try {
		Cookie cookie[] = request.getCookies();
		String currentUser = cookie[0].getValue();

		connection = DatabaseConnection.initializeDatabase();
		statement = connection.createStatement();
		String sql = "select * from TeamInfoTable inner join SynopsisTable using(id)";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			String id = resultSet.getString("id");
			String title = resultSet.getString("proj_title");
			String st1name = resultSet.getString("st1name");
			String st2name = resultSet.getString("st2name");
			String st3name = resultSet.getString("st3name");
			String st4name = resultSet.getString("st4name");
			String st1roll = resultSet.getString("st1roll");
			String st2roll = resultSet.getString("st2roll");
			String st3roll = resultSet.getString("st3roll");
			String st4roll = resultSet.getString("st4roll");
			String proj_statement = resultSet.getString("proj_statement");
			String proj_context = resultSet.getString("proj_context");
			String proj_concept = resultSet.getString("proj_concept");
			resultTable += "{ id: '" + id + "',title:'" + title + "',st1name:' " + st1name + "',st1roll: '"
					+ st1roll + "',st2name: '" + st2name + "',st2roll: '" + st2roll + "',st3name: '"
					+ ((st3name == null) ? ' ' : st3name) + "',st3roll: '"
					+ ((st3roll == null) ? ' ' : st3roll) + "',st4name: '"
					+ ((st4name == null) ? ' ' : st4name) + "',st4roll: '"
					+ ((st4roll == null) ? ' ' : st4roll) + "',proj_statement:'" + proj_statement
					+ "',proj_centext:'" + proj_context + "',proj_concept:'" + proj_concept + "',status:'"
					+ resultSet.getString("status") + "'},";
		}
		resultTable += "]";
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Coordination Team Homescreen</title>
<link href='http://fonts.googleapis.com/css?family=Bitter'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style>
*{
margin:0px;
padding: 0px;
}
.form-style {
	width: 80vw;
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
	padding: 4px 8px;
	font-size: 16px;
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
	color: black;
}

.outer_table td, th {
	border-bottom: 2px solid #dddddd;
	text-align: left;
	padding: 8px;
	
	border: 1px solid lightblue;
}

.outer_table th {
	background-color: grey;
	color: white;
	border-right: 1px solid white;
}

.outer_table tr:hover {
	background-color: lightblue;
	transition-duration: 1s;
}

.inner_table {
	border: 0;
	width: 100%;
}

.inner_table td {
	padding: 2px;
	border: 0;
}

.inner_table tr {
	background-color: none;
}

.inner_table tr:nth-child(even) {
	background-color: none;
}

header {
	background: dodgerblue;
	color: white;
	margin: 0;
	font-size: 30px;
	text-decoration: bold;
	padding: 10px;
}

p {
	background: dodgerblue;
	color: white;
	margin: 0;
	font-size: 15px;
	padding: 10px;
}

.container {
	margin: 30px;
}
footer {
	border-top: 1px solid grey;
	height: 5vh;
	text-align: center;
	float: bottom;
	bottom: 0;
	padding: 2vh;
	position: absolute;
	background: dodgerblue;
	color: white;
	width: 98vw;
}

footer a{
	text-decoration: none;
	color: lightgrey;
}
footer a:hover{
	color: white;
}

.navbar {
	z-index: 10;
	border-bottom: 1px solid white;
	background-color: dodgerblue;
	position: sticky;
	overflow: hidden;
	position: -webkit-sticky;
	top: 0;
	width: 100%;
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
<body background="" onload="filter('\0')">
<div class="navbar">
	<span class="label">PICT</span>
	<span class="label2">Project Management System</span>
		<a href="LoginPage.html" class="right">Logout</a>
		<a href="ControlPage.html" class="right">Settings</a>
		<a href="#" class="right active">Applications</a> 
	</div>
		<header> Project Applications </header>
		<p>Following is the list of all the applications submitted so far.</p>

	

		<div id="filtable"></div>
		<div ng-app="TableFilterApp" ng-controller="TableFilterController">
			<table class="outer_table">
				<tr>
					<th><input type="text" ng-model="f.id" placeholder="Id" style="width: 90px;"></th>
					<th><input type="text" ng-model="f.title" placeholder="Title"></th>
					<th><input type="text" ng-model="f.title" placeholder="Student Details" disabled></th>
					<th><input type="text" ng-model="f.proj_statement"
						placeholder="Project Statement"></th>
					<th><input type="text" ng-model="f.proj_concept"
						placeholder="Project Concept"></th>
					<th><input type="text" ng-model="f.proj_context"
						placeholder="Project Context"></th>
					<th><input type="text" ng-model="f.status"
						placeholder="Status (P/A/R)" style="width: 85px;"></th>
						<th>Accept</th>
						<th>Reject</th>
				</tr>
				<tr ng-repeat="t in tablevals | filter: f">
					<td>{{t.id}}</td>
					<td>{{t.title}}</td>
					<td><table class="inner_table">
							<tr>
								<td>{{t.st1name}}</td>
								<td>{{t.st1roll}}</td>
							</tr>
							<tr>
								<td>{{t.st2name}}</td>
								<td>{{t.st2roll}}</td>
							</tr>
							<tr>
								<td>{{t.st3name}}</td>
								<td>{{t.st3roll}}</td>
							</tr>
							<tr>
								<td>{{t.st4name}}</td>
								<td>{{t.st4roll}}</td>
							</tr>
						</table></td>
					<td>{{t.proj_statement}}</td>
					<td>{{t.proj_concept}}</td>
					<td>{{t.proj_concept}}</td>
					<td>{{t.status}}</td>
					
					<td><button ng-if="t.status=='P'" class='btn' id='{{t.id}}' onclick='apply(this.id)'>Accept</button></td>
					<td><button ng-if="t.status=='P'" class='btn' id='{{t.id}}' onclick='reject(this.id)'>Reject</button></td>
			</table>
		</div>
		<script id="filtablescript"></script>
		<div id="ajaxResponse" style="display: none"></div>
		<br> <br>

	<script>
		var resultTable;
		angular.module('TableFilterApp', []).controller(
				'TableFilterController', function($scope) {
					$scope.tablevals = <%=resultTable%>;
					$scope.updateResult = function(results) {
						$scope.tablevals = results;
					};
					$scope.f = {};
					scopeholder = $scope;
				});
		

		function reject(proj_id) {
			$(document).ready(function() {
				var d = document.getElementById(proj_id);

				$.post('PCTServlet', {
					userName : proj_id,
					status : 'R'
				}, function(responseText) {
					alert(responseText + " has been rejected.");
				});

				//d.parentElement.parentElement.parentElement.removeChild(d.parentElement.parentElement);
				$(d.parentElement.parentElement).fadeOut();
			});

		}

		function apply(proj_id) {
			$(document).ready(function() {
				var d = document.getElementById(proj_id);

				$.post('PCTServlet', {
					userName : proj_id,
					status : 'A'
				}, function(responseText) {
					alert(responseText + " has been accepted.");
				});

				//d.parentElement.parentElement.parentElement.removeChild(d.parentElement.parentElement);

				$(d.parentElement.parentElement).fadeOut();
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