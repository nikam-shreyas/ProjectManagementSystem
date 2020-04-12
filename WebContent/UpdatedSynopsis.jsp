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
	
	String sql = "select * from SynopsisTable where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();

	String title = resultSet.getString("proj_title");
	String stmt = resultSet.getString("proj_statement");
	String context = resultSet.getString("proj_context");
	String concept = resultSet.getString("proj_concept");
	
	sql = "select * from HardwareReq where id = '" + currentUser + "';";
	resultSet1 = statement.executeQuery(sql);
	resultSet1.next();

	String hreq1 = resultSet1.getString("req1");
	String hreq2 = resultSet1.getString("req2");
	String hreq3 = resultSet1.getString("req3");
	String hreq4 = resultSet1.getString("req4");
	String hreq5 = resultSet1.getString("req5");
	String hreq6 = resultSet1.getString("req6");
	String hreq7 = resultSet1.getString("req7");
	String hreq8 = resultSet1.getString("req8");
	String hreq9 = resultSet1.getString("req9");
	String hreq10 = resultSet1.getString("req10");
	
	sql = "select * from SoftwareReq where id = '" + currentUser + "';";
	resultSet2 = statement.executeQuery(sql);
	resultSet2.next();

	String sreq1 = resultSet2.getString("req1");
	String sreq2 = resultSet2.getString("req2");
	String sreq3 = resultSet2.getString("req3");
	String sreq4 = resultSet2.getString("req4");
	String sreq5 = resultSet2.getString("req5");
	String sreq6 = resultSet2.getString("req6");
	String sreq7 = resultSet2.getString("req7");
	String sreq8 = resultSet2.getString("req8");
	String sreq9 = resultSet2.getString("req9");
	String sreq10 = resultSet2.getString("req10");
	
	sql = "select * from ReferencesTable where id = '" + currentUser + "';";
	resultSet3 = statement.executeQuery(sql);
	resultSet3.next();

	String ref1 = resultSet3.getString("ref1");
	String ref2 = resultSet3.getString("ref2");
	String ref3 = resultSet3.getString("ref3");
	String ref4 = resultSet3.getString("ref4");
	String ref5 = resultSet3.getString("ref5");
	String ref6 = resultSet3.getString("ref6");
	String ref7 = resultSet3.getString("ref7");
	String ref8 = resultSet3.getString("ref8");
	String ref9 = resultSet3.getString("ref9");
	String ref10 = resultSet3.getString("ref10");
	String ref11 = resultSet3.getString("ref11");
	String ref12 = resultSet3.getString("ref12");
	String ref13 = resultSet3.getString("ref13");
	String ref14 = resultSet3.getString("ref14");
	String ref15 = resultSet3.getString("ref15");
	String ref16 = resultSet3.getString("ref16");
	String ref17 = resultSet3.getString("ref17");
	String ref18 = resultSet3.getString("ref18");
	String ref19 = resultSet3.getString("ref19");
	String ref20 = resultSet3.getString("ref20");
	
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updated Synopsis</title>
<style>
*{
margin: 0px; padding: 0px;}
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
	width: 80vw;
	padding: 30px;
	margin: 40px auto;
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

.form-style label {
	display: block;
	font: 13px Arial, Helvetica, sans-serif;
	color: #888;
	margin-bottom: 15px;
}

input, textarea, select {
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

.form-style input[type="button"], .form-style input[type="submit"],
	button {
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

.form-style input[type="button"]:hover, .form-style input[type="submit"]:hover,
	button {
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

#resh input {
	width: 31%;
	display: inline;
	margin: 0.2%;
}

#ress input {
	width: 31%;
	display: inline;
	margin: 0.2%;
}

#ref textarea {
	
}

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 10px 14px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	outline: none;
}

body {
	background: url('cover_5.png');
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
<body>

<div class="navbar">
	<span class="label">PICT</span>
	<span class="label2">Project Management System</span>
		<a href="LoginPage.html" class="right">Logout</a>
		<a href="HomePage.jsp" class="right">Home</a> 
		<a href="#" class="right active">Synopsis Page</a> 
	</div>
	<div style="padding: 20px;">
		<div class="form-style">
			<h1>
				Upload Project Synopsis. <span> This is what you have submitted. </span>
			</h1>
			<form id="f1" action="UploadSynopsisServlet" method="post">
				<div class="section">
					<span>1</span>Project Information
				</div>
				<div class="inner-wrap">
					<label>Project Title: <input type="text" name="field1"
						disabled value="<%=title%>"	 />
					</label> <label>Problem Statement: <textarea name="field2" rows=4 disabled placeholder='<%=stmt %>'></textarea></label>
				</div>

				<div class="section">
					<span>2</span>Frame Of Reference:
				</div>
				<div class="inner-wrap">
					<label>Application/Context: <textarea name="field3" rows=2 disabled placeholder='<%=context %>'></textarea></label>
					<label>Concept: <textarea name="field4" rows=3 disabled placeholder='<%=concept%>'></textarea></label>
				</div>

				<div class="section">
					<span>3</span>Resources:
				</div>
				<div class="inner-wrap">
					<label>Hardware Requirements: </label>
					<div id="resh" style="display: inline;">
						<input type="text" name="resh1" disabled value='<%=hreq1 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq2 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq3 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq4 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq5 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq6 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq7 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq8 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq9 %>' />
						<input type="text" name="resh1" disabled value='<%=hreq10 %>' />
					</div>
					 <label>Software Requirements: </label>
					<div id="ress" style="display: inline;">
						<input type="text" name="ress1" disabled value='<%=sreq1 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq2 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq3 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq4 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq5 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq6 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq7 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq8 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq9 %>' />
						<input type="text" name="ress1" disabled value='<%=sreq10 %>' />
					</div>
					

				</div>

				<div class="section">
					<span>4</span>References:
				</div>
				<div class="inner-wrap">
					<div id="ref" style="display: inline;">
						<label>1:</label>
						<textarea name="ref1" disabled placeholder='<%=ref1 %>'></textarea>
						<label>2:</label>
						<textarea name="ref1" disabled placeholder='<%=ref2 %>'></textarea>
						<label>3:</label>
						<textarea name="ref1" disabled placeholder='<%=ref3 %>'></textarea>
						<label>4:</label>
						<textarea name="ref1" disabled placeholder='<%=ref4 %>'></textarea>
						<label>5:</label>
						<textarea name="ref1" disabled placeholder='<%=ref5 %>'></textarea>
						<label>6:</label>
						<textarea name="ref1" disabled placeholder='<%=ref6 %>'></textarea>
						<label>7:</label>
						<textarea name="ref1" disabled placeholder='<%=ref7 %>'></textarea>
						<label>8:</label>
						<textarea name="ref1" disabled placeholder='<%=ref8 %>'></textarea>
						<label>9:</label>
						<textarea name="ref1" disabled placeholder='<%=ref9 %>'></textarea>
						<label>10:</label>
						<textarea name="ref1" disabled placeholder='<%=ref10 %>'></textarea>
						<label>11:</label>
						<textarea name="ref1" disabled placeholder='<%=ref11 %>'></textarea>
						<label>12:</label>
						<textarea name="ref1" disabled placeholder='<%=ref12 %>'></textarea>
						<label>13:</label>
						<textarea name="ref1" disabled placeholder='<%=ref13 %>'></textarea>
						<label>14:</label>
						<textarea name="ref1" disabled placeholder='<%=ref14 %>'></textarea>
						<label>15:</label>
						<textarea name="ref1" disabled placeholder='<%=ref15 %>'></textarea>
						<label>16:</label>
						<textarea name="ref1" disabled placeholder='<%=ref16 %>'></textarea>
						<label>17:</label>
						<textarea name="ref1" disabled placeholder='<%=ref17 %>'></textarea>
						<label>18:</label>
						<textarea name="ref1" disabled placeholder='<%=ref18 %>'></textarea>
						<label>19:</label>
						<textarea name="ref1" disabled placeholder='<%=ref19 %>'></textarea>
						<label>20:</label>
						<textarea name="ref1" disabled placeholder='<%=ref20 %>'></textarea>
					</div>
					<br /> 
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