<%@page import="model.Candidate"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
<!-- Bootstrap core CSS -->
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Add custom CSS here -->
<link href="resource/bootstrap/css/modern-business.css" rel="stylesheet">
<link href="resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resource/css/voter.css" rel="stylesheet">
</head>

<body>
	<%
		ArrayList<Candidate> wakna_list = (ArrayList<Candidate>) request.getSession().getAttribute("wakna_cand");
		ArrayList<Candidate> solan_list = (ArrayList<Candidate>) request.getSession().getAttribute("solan_cand");
		ArrayList<Candidate> shimla_list = (ArrayList<Candidate>) request.getSession().getAttribute("shimla_cand");
		ArrayList<Candidate> manali_list = (ArrayList<Candidate>) request.getSession().getAttribute("manali_cand");
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->

			<a class="navbar-brand" href="index.html">AdminPanel</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Welcome,&nbsp; <%=request.getSession().getAttribute("name")%></a></li>
				<li><a href="LogoutServlet">Sign Out</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- END SIDE NAVBAR -->
	<div class="section">

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="canvas-holder">
						<h3>Vaknaghat</h3>
						<canvas id="chart-area1" width="300" height="300" />
					</div>
				</div>
				<div class="col-md-6">
					<div id="canvas-holder">
						<h3>Solan</h3>
						<canvas id="chart-area2" width="300" height="300" />
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-6">
					<div id="canvas-holder">
						<h3>Shimla</h3>
						<canvas id="chart-area3" width="300" height="300" />
					</div>
				</div>
				<div class="col-md-6">
					<div id="canvas-holder">
						<h3>Manali</h3>
						<canvas id="chart-area4" width="300" height="300" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- JavaScript -->
	<script src="resource/bootstrap/js/jquery-1.10.2.js"></script>
	<script src="resource/bootstrap/js/bootstrap.js"></script>
	<script src="resource/bootstrap/js/modern-business.js"></script>
	<script src="resource/js/Chart.js"></script>
	<script src="resource/js/admin.js"></script>

	<script>
	
			var waknaghat = [ {
				value :"<%=wakna_list.get(0).getVotes()%>",
				color : "#F7464A",
				highlight : "#FF5A5E",
				label : "<%=wakna_list.get(0).getParty()%>"
			}, {
				value :"<%=wakna_list.get(1).getVotes()%>",
				color : "#46BFBD",
				highlight : "#5AD3D1",
				label :"<%=wakna_list.get(1).getParty()%>"
			}, {
				value :"<%=wakna_list.get(2).getVotes()%>",
				color : "#FDB45C",
				highlight : "#FFC870",
				label : "<%=wakna_list.get(2).getParty()%>"
			}

			];

		var solan = [ {
			value : "<%=solan_list.get(0).getVotes()%>",
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "<%=solan_list.get(0).getParty()%>"
		}, {
			value : "<%=solan_list.get(1).getVotes()%>",
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label :  "<%=solan_list.get(1).getParty()%>"
		}, {
			value :  "<%=solan_list.get(2).getVotes()%>",
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "<%=solan_list.get(2).getParty()%>"
		}

		];

		var shimla = [ {
			value : "<%=shimla_list.get(0).getVotes()%>",
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "<%=shimla_list.get(0).getParty()%>"
		}, {
			value : "<%=shimla_list.get(1).getVotes()%>",
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "<%=shimla_list.get(1).getParty()%>"
		}, {
			value : "<%=shimla_list.get(2).getVotes()%>",
			color : "#FDB45C",
			highlight : "#FFC870",
			label :"<%=shimla_list.get(2).getParty()%>"
		}

		];

		var manali = [ {
			value :  "<%=manali_list.get(0).getVotes()%>",
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "<%=manali_list.get(0).getParty()%>"
		}, {
			value : "<%=manali_list.get(1).getVotes()%>",
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "<%=manali_list.get(1).getParty()%>"
		}, {
			value :"<%=manali_list.get(2).getVotes()%>",
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "<%=manali_list.get(2).getParty()%>"
		}

		];

		window.onload = function() {
			var ctx1 = document.getElementById("chart-area1").getContext("2d");
			window.myPie = new Chart(ctx1).Pie(waknaghat);

			var ctx2 = document.getElementById("chart-area2").getContext("2d");
			window.myPie = new Chart(ctx2).Pie(solan);

			var ctx3 = document.getElementById("chart-area3").getContext("2d");
			window.myPie = new Chart(ctx3).Pie(shimla);

			var ctx4 = document.getElementById("chart-area4").getContext("2d");
			window.myPie = new Chart(ctx4).Pie(manali);
		};
	</script>
</body>
</html>