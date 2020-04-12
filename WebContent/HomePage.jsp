<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="DBPackage.DatabaseConnection" %>
<%
String currentUser = request.getCookies()[0].getValue();

ArrayList<String> privDates = new ArrayList<String>();
ArrayList<String> pubDates = new ArrayList<String>();
ArrayList<String> noticesList = new ArrayList<String>();
ArrayList<String> privnoticesList = new ArrayList<String>();
ArrayList<String> filenames = new ArrayList<String>();
String d[] = new String[4];
boolean pg[] = new boolean[4];
boolean s[] = new boolean[4];
try {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	connection = DatabaseConnection.initializeDatabase();
	statement = connection.createStatement();
	String sql = "select * from DeadlinesTable";
	resultSet = statement.executeQuery(sql);
	int i = 0;
	while (resultSet.next()) {
		if (resultSet.getString("deadline") != null) {
	d[i] = resultSet.getString("deadline");
		} else {
	d[i] = "--/--/--";
		}
		if (resultSet.getString("buttonstate") != null) {
	s[i] = false;
		} else {
	s[i] = true;
		}

		i++;
	}
	sql = "select notice, filename from PublicNoticeTable";
	resultSet = statement.executeQuery(sql);
	while (resultSet.next()) {
		if (resultSet.getString("filename") == "") {
	noticesList.add(resultSet.getString("notice"));
	//pubDates.add(resultSet.getString("pub_date"));
	filenames.add("");
		} else {
	noticesList.add(resultSet.getString("notice"));
	//pubDates.add(resultSet.getString("pub_date"));
	filenames.add(resultSet.getString("filename"));
		}
	}
	sql = "select count(*) from TeamInfoTable where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	if (resultSet.getInt("count(*)") == 0)
		pg[0] = false;
	else
		pg[0] = true;

	sql = "select count(*) from SynopsisTable where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	if (resultSet.getInt("count(*)") == 0)
		pg[1] = false;
	else
		pg[1] = true;

	sql = "select count(*) from GuidePreferences where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	if (resultSet.getInt("count(*)") == 0)
		pg[2] = false;
	else
		pg[2] = true;

	sql = "select count(*) from ReportsTable where id = '" + currentUser + "';";
	resultSet = statement.executeQuery(sql);
	resultSet.next();
	if (resultSet.getInt("count(*)") == 0)
		pg[3] = false;
	else
		pg[3] = true;
	System.out.println(privDates.get(0));
	statement.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

* {
	margin: 0;
	border: 0;
	padding: 0;
	box-sizing: border-box;
}
@-webkit-keyframes 
strip1 {  0% {
 -webkit-transform: translate3d(-100%, 0, 0);
 transform: translate3d(-100%, 0, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@keyframes 
strip1 {  0% {
 -webkit-transform: translate3d(-100%, 0, 0);
 transform: translate3d(-100%, 0, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@-webkit-keyframes 
strip2 {  0% {
 -webkit-transform: translate3d(0, 100%, 0);
 transform: translate3d(0, 100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@keyframes 
strip2 {  0% {
 -webkit-transform: translate3d(0, 100%, 0);
 transform: translate3d(0, 100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@-webkit-keyframes 
strip3 {  0% {
 -webkit-transform: translate3d(0, -100%, 0);
 transform: translate3d(0, -100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@keyframes 
strip3 {  0% {
 -webkit-transform: translate3d(0, -100%, 0);
 transform: translate3d(0, -100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@-webkit-keyframes 
strip4 {  0% {
 -webkit-transform: translate3d(0, 100%, 0);
 transform: translate3d(0, 100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@keyframes 
strip4 {  0% {
 -webkit-transform: translate3d(0, 100%, 0);
 transform: translate3d(0, 100%, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@-webkit-keyframes 
strip5 {  0% {
 -webkit-transform: translate3d(100%, 0, 0);
 transform: translate3d(100%, 0, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@keyframes 
strip5 {  0% {
 -webkit-transform: translate3d(100%, 0, 0);
 transform: translate3d(100%, 0, 0);
}
 100% {
 -webkit-transform: translate3d(0, 0, 0);
 transform: translate3d(0, 0, 0);
}
}

@media screen and (max-width: 760px) {

}


@media screen and (max-width: 760px) {
.strips__strip--expanded { min-height: 100vh; }
}

.strips__strip--expanded .strip__content:hover:before {
  -webkit-transform: skew(-30deg) scale(1) translate(0, 0);
  -ms-transform: skew(-30deg) scale(1) translate(0, 0);
  transform: skew(-30deg) scale(1) translate(0, 0);
  opacity: 0.05;
}

@media screen and (max-width: 760px) {

.strip__title { font-size: 28px; }

}

.strips {
	min-height: 100vh;
	overflow: hidden;
	color: white;
}

.strips__strip {
	will-change: width, left, z-index, height;
	position: absolute;
	width: 20vw;
	min-height: 100vh;
	overflow: hidden;
	cursor: pointer;
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
}

.strips__strip:nth-child(1) {
	left: 0;
}

.strips__strip:nth-child(2) {
	left: 20vw;
}

.strips__strip:nth-child(3) {
	left: 40vw;
}

.strips__strip:nth-child(4) {
	left: 60vw;
}

.strips__strip:nth-child(5) {
	left: 80vw;
}

.strips__strip:nth-child(1) .strip__content {
	background: #0a2a64;
	background-image: url('team.png');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: bottom right;
	-webkit-transform: translate3d(-100%, 0, 0);
	transform: translate3d(-100%, 0, 0);
	-webkit-animation-name: strip1;
	animation-name: strip1;
	-webkit-animation-delay: 0.1s;
	animation-delay: 0.1s;
}

.strips__strip:nth-child(2) .strip__content {
	background: #0866a2;
	background-image: url('sub.png');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: left top;
		-webkit-transform: translate3d(0, 100%, 0);
	transform: translate3d(0, 100%, 0);
	-webkit-animation-name: strip2;
	animation-name: strip2;
	-webkit-animation-delay: 0.2s;
	animation-delay: 0.2s;
}

.strips__strip:nth-child(3) .strip__content {
background: #289ffd;
	background-image: url('rep.jpg');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: right bottom;
		-webkit-transform: translate3d(0, -100%, 0);
	transform: translate3d(0, -100%, 0);
	-webkit-animation-name: strip3;
	animation-name: strip3;
	-webkit-animation-delay: 0.3s;
	animation-delay: 0.3s;
}

.strips__strip:nth-child(4) .strip__content {
	background: #268ac6;
	background-image: url('submit.jpg');
	background-repeat: no-repeat;
	background-size: contain;
	background-position: left top;
		-webkit-transform: translate3d(0, 100%, 0);
	transform: translate3d(0, 100%, 0);
	-webkit-animation-name: strip4;
	animation-name: strip4;
	-webkit-animation-delay: 0.4s;
	animation-delay: 0.4s;
}

.strips__strip:nth-child(5) .strip__content {
	background: #a6d6cd;
	background-image: url('cover_8.png');
	background-repeat: no-repeat;
	background-size: contain;	
		background-position: right bottom;
	-webkit-transform: translate3d(100%, 0, 0);
	transform: translate3d(100%, 0, 0);
	-webkit-animation-name: strip5;
	animation-name: strip5;
	-webkit-animation-delay: 0.5s;
	animation-delay: 0.5s;
}

.strips .strip__content {
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-timing-function: cubic-bezier(0.23, 1, 0.32, 1);
	animation-timing-function: cubic-bezier(0.23, 1, 0.32, 1);
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-decoration: none;
}

.strips .strip__content:hover:before {
	-webkit-transform: skew(-30deg) scale(3) translate(0, 0);
	-ms-transform: skew(-30deg) scale(3) translate(0, 0);
	transform: skew(-30deg) scale(3) translate(0, 0);
	opacity: 0.1;
}

.strips .strip__content:before {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: white;
	opacity: 0.05;
	-webkit-transform: skew(-30deg) scaleY(1) translate(0, 0);
	-ms-transform: skew(-30deg) scaleY(1) translate(0, 0);
	transform: skew(-30deg) scaleY(1) translate(0, 0);
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
}

.strips .strip__inner-text {
	will-change: transform, opacity;
	position: absolute;
	z-index: 5;
	top: 40%;
	left: 50%;
	width: 90%;
	-webkit-transform: translate(-50%, -50%) scale(0.5);
	-ms-transform: translate(-50%, -50%) scale(0.5);
	transform: translate(-50%, -50%) scale(0.5);
	opacity: 0;
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
}

.strips__strip--expanded {
	width: 100%;
	top: 0 !important;
	left: 0 !important;
	z-index: 3;
	cursor: default;
}

.strips__strip--expanded .strip__title {
	opacity: 0;
}

.strips__strip--expanded .strip__inner-text {
	opacity: 1;
	-webkit-transform: translate(-50%, -50%) scale(1);
	-ms-transform: translate(-50%, -50%) scale(1);
	transform: translate(-50%, -50%) scale(1);
}

.strip__title {
	display: block;
	margin: 0;
	position: relative;
	padding-left: 1vw;
	z-index: 2;
	width: 100%;
	font-size: 3.5vw;
	color: white;
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
}

.strip__close {
	position: absolute;
	top: 1vw;
	opacity: 0;
	width: 10vw;
	z-index: 10;
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	cursor: pointer;
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
}

.strip__close--show {
	opacity: 1;
}



.row::after {
  content: "";
  clear: both;
  display: table;
}


[class*="c"] {
  width: 100%;
}

@media only screen and (min-width: 768px) {
  /* For desktop: */
  .c1 {width: 8.33%;}
  .c2 {width: 16.66%;}
  .c3 {width: 25%;}
  .c4 {width: 33.33%;}
  .c5 {width: 41.66%;}
  .c6 {width: 50%;}
  .c7 {width: 58.33%;}
  .c8 {width: 66.66%;}
  .c9 {width: 75%;}
  .c10 {width: 83.33%;}
  .c11 {width: 91.66%;}
  .c12 {width: 100%;}
}

button {
	background: transparent;
	border-radius: 5px;
	font-size: 15px;
	color: white;
	cursor: pointer;
	border: 2px solid dodgerBlue;
	padding: 15px;
}

button:hover {
	border-color: dodgerBlue;
	background: dodgerblue;
	transition-duration: 1s;
}

.button2 {
	background: transparent;
	border-radius: 5px;
	font-size: 15px;
	color: white;
	cursor: pointer;
	border: 2px solid Blue;
	padding: 15px;
}

.button2:hover {
	border-color: Blue;
	background: Blue;
	transition-duration: 1s;
}

.disable_btn{
	cursor: no-drop;
}
table{
font-size: 18px;
width: 50vw;
color: black;
border-radius: 10px;
background: white;
border: 2px solid lightgrey;
padding: 5px;
height: 50vh;
margin-top: 5vh;
}
table:hover{
box-shadow: 5px solid lightgrey;
}
tr{
border: 2px solid grey;
}
table tr:hover{
background: lightgrey;
}
table th{
text-align: left;
border-bottom: 1px solid black;
}
td,th{
padding: 10px;
}
#nav{
margin-top: 10px;
}
#nav a{
color: white;
font-size: 15px;
border-radius: 3px;
text-decoration: none;
padding: 3px;
border: 2px solid grey;
}

#nav a:hover{
background: lightgrey;
color: black;
}
</style>
</head>
<body>
	<section class="strips">
		<article class="strips__strip">
			<div class="strip__content">
				<h1 class="strip__title" data-name="Lorem">Team</h1>
				<div class="strip__inner-text">
					<h1>Project Group Submission</h1>
					<p>
						All B.E. Students are instructed to submit the project group
						information <br />on or before Date:
						<%=d[0]%>
					</p>
					<br />
					<button id="b1" onclick="buttonRedirect('b1')">Upload
						Information</button>
				</div>

			</div>
		</article>
		<article class="strips__strip">
			<div class="strip__content">
				<h1 class="strip__title" data-name="Ipsum" style="margin-top: 90vh;">Synopsis</h1>
				<div class="strip__inner-text" style="text-align: right;">
					<h1>Project Synopsis Submission</h1>
					<p>
						All B.E. Students are instructed to submit the <br /> Project
						synopsis and sponsorship details <br /> on or before Date:
						<%=d[1]%>
					</p>
					<br />
					<button id="b2" onclick="buttonRedirect('b2')">Submit
						Synopsis</button>
				</div>
			</div>
		</article>
		<article class="strips__strip">
			<div class="strip__content">
				<h1 class="strip__title" data-name="Dolor">Guide</h1>
				<div class="strip__inner-text">
					<h1>Choose Preferred Guides</h1>
					<p>
						All B.E. Students are instructed to submit their <br />
						preferences for guides according to their domain<br /> on or
						before Date:
						<%=d[2]%>
						<br /> Note: Guides will be allocated on First Come-First Served
						Basis.
					</p>
					<br />
					<form action="GuidesServlet" method="post" id = 'guideSubmitForm'>
					<input type="text" name="pg2" value='<%=pg[2]%>' style="display:none">
						<button id="b3" class="button2"
							onclick="buttonRedirect('b3')">Fill Guide Preferences</button>
					</form>
					<form action="StudentChatServlet" method="post" id = 'projChatScreen'>
					<input type = "text" name = "choice" value = "load" style = "visibility: hidden;"><br>
					<button id="b5" class="button2"
							type ="submit" >Open Chat</button>
					</form>
					
				</div>
			</div>
		</article>
		<article class="strips__strip">
			<div class="strip__content">
				<h1 class="strip__title" data-name="Sit" style="margin-top: 90vh;">Report</h1>
				<div class="strip__inner-text" style="text-align: right">
					<h1>Report Submission</h1>
					<p>
						All B.E. Students are instructed to submit the <br /> Project
						report on or before Date:
						<%=d[3]%>
					</p>
					<br />
					<button id="b4" class="button2" onclick="buttonRedirect('b4')">Submit
						Report</button>
				</div>
			</div>
			</div>
		</article>
		<article class="strips__strip">
			<div class="strip__content">
				<h1 class="strip__title" data-name="Amet">Notices</h1>
				<div class="strip__inner-text">
			
				
				
					<table id="data">
				<tr>
				<th></th>
				<th>Date</th>
				<th>Notice</th>
				<th>Attached File</th>
				<tbody>
				</tr>
					<%for(int i=0;i<noticesList.size();i++){ %>
					<tr>	
					<td><%=(i+1)%>.</td>
				
					<td><%=noticesList.get(i) %></td>
					<td><a href="DownloadFileServlet?fname=<%=filenames.get(i)%>" target="_new"><%=filenames.get(i) %></a></td>
					</tr>
					<%} %>
					</tbody>
				</table>
				</div>
			</div>
		</article>
		<span class="fa fa-close strip__close"
			style="float: right; font-size: 35px;"><b>&nbsp;
				&nbsp;&times</b></span>
	</section>
	<script>
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		var currentUser = ca[0].substring("userId=".length, ca[0].length);
		var b1 =<%=s[0]%>
		var b2 =<%=s[1]%>
		var b3 =<%=s[2]%>
		var b4 =<%=s[3]%>
		var pg0 = <%=pg[0]%>
		var pg1 = <%=pg[1]%>
		var pg2 = <%=pg[2]%>
		var pg3 = <%=pg[3]%>
		
		console.log(currentUser, pg0, pg1, pg2, pg3, b1, b2, b3, b4)
		
		/*
		if(!pg0)
			{
			if (b1) {
				document.getElementById("b1").disabled = true;
				document.getElementById("b1").classList.add("disable_btn");
			}
			document.getElementById('b2').disable = true;
			document.getElementById("b2").classList.add("disable_btn");
			document.getElementById('b3').disable = true;
			document.getElementById("b3").classList.add("disable_btn");
			document.getElementById('b4').disable = true;
			document.getElementById("b4").classList.add("disable_btn");
			}
		else
			{
			if(!pg1)
				{
				if(b2){
					document.getElementById("b2").disabled = true;
					document.getElementById("b2").classList.add("disable_btn");
				}
				document.getElementById('b3').disable = true;
				document.getElementById("b3").classList.add("disable_btn");
				document.getElementById('b4').disable = true;
				document.getElementById("b4").classList.add("disable_btn");
				}
			else
				{
				if(!pg2)
					{
					if (b3) {
						document.getElementById("b3").disabled = true;
						document.getElementById("b3").classList.add("disable_btn");
					}
					document.getElementById('b4').disable = true;
					document.getElementById("b4").classList.add("disable_btn");
					}
				else
					{
					if (b4) {
						document.getElementById("b4").disabled = true;
						document.getElementById("b4").classList.add("disable_btn");
					}
					}
				}
				
			}
	*/		
	if (b1) {
		document.getElementById("b1").disabled = true;
		document.getElementById("b1").classList.add("disable_btn");
	}
	if(b2){
		document.getElementById("b2").disabled = true;
		document.getElementById("b2").classList.add("disable_btn");
	}
		function callservlet() {
			document.forms[0].action = "GuidesServlet"
			document.forms[0].submit();
		}
		if (b3) {
			document.getElementById("b3").disabled = true;
			document.getElementById("b3").classList.add("disable_btn");
		}
		if (b4) {
			document.getElementById("b4").disabled = true;
			document.getElementById("b4").classList.add("disable_btn");
		}
		
		
		var Expand = (function() {
			var tile = $('.strips__strip');
			var tileLink = $('.strips__strip > .strip__content');
			var tileText = tileLink.find('.strip__inner-text');
			var stripClose = $('.strip__close');

			var expanded = false;

			var open = function() {

				var tile = $(this).parent();

				if (!expanded) {
					tile.addClass('strips__strip--expanded');
					tileText.css('transition',
							'all .5s .3s cubic-bezier(0.23, 1, 0.32, 1)');
					stripClose.addClass('strip__close--show');
					stripClose.css('transition',
							'all .6s 1s cubic-bezier(0.23, 1, 0.32, 1)');
					expanded = true;
				}
			};

			var close = function() {
				if (expanded) {
					tile.removeClass('strips__strip--expanded');
					tileText.css('transition',
							'all 0.15s 0 cubic-bezier(0.23, 1, 0.32, 1)');
					stripClose.removeClass('strip__close--show');
					stripClose.css('transition',
							'all 0s 0s cubic-bezier(0.23, 1, 0.32, 1)')
					expanded = false;
				}
			}

			var bindActions = function() {
				tileLink.on('click', open);
				stripClose.on('click', close);
			};

			var init = function() {
				bindActions();
			};

			return {
				init : init
			};

		}());
		Expand.init();
		$(document)
				.ready(
						function() {
							$('#data').after('<div id="nav"></div>');
							var rowsShown = 5;
							var rowsTotal = $('#data tbody tr').length;
							var numPages = rowsTotal / rowsShown;
							for (i = 0; i < numPages; i++) {
								var pageNum = i + 1;
								$('#nav').append(
										'<a href="#" rel="'+i+'">' + pageNum
												+ '</a> ');
							}
							$('#data tbody tr').hide();
							$('#data tbody tr').slice(0, rowsShown).show();
							$('#nav a:first').addClass('active');
							$('#nav a').bind(
									'click',
									function() {

										$('#nav a').removeClass('active');
										$(this).addClass('active');
										var currPage = $(this).attr('rel');
										var startItem = currPage * rowsShown;
										var endItem = startItem + rowsShown;
										$('#data tbody tr').css('opacity',
												'0.0').hide().slice(startItem,
												endItem).css('display',
												'table-row').animate({
											opacity : 1
										}, 300);
									});
						});

		function buttonRedirect(button_id) {
			if (button_id == 'b1') {
				if(<%=pg[0]%>){
					window.location.href = "UpdatedTeamInfo.jsp";
				}
				else if (document.getElementById(button_id).disabled == false){
					window.location.href = "UploadTeamInfo.html";
					alert("false");
				}
			}
			else if (button_id == 'b2') {
				if(<%=pg[1]%>)
					window.location.href = "UpdatedSynopsis.jsp";
				else if (document.getElementById(button_id).disabled == false)
					window.location.href = "UploadSynopsis.html";
			}
			else if (button_id == 'b3') {
				if(<%=pg[2]%>){
					window.location.href = "UpdatedGuidePref.jsp";
				}
				else if (document.getElementById(button_id).disabled == false)
					window.location.href = "LoginPage.html";
			}
			else if (button_id == 'b5') {
				if(<%=pg[2]%>)
					document.getElementById('projChatScreen').submit();
				else if (document.getElementById(button_id).disabled == false)
					document.getElementById('guideSubmitForm').submit();
			}
			else  if (document.getElementById(button_id).disabled == false){
					window.location.href = "ReportEditor.jsp";
			}
		}
	</script>
</body>
</html>
