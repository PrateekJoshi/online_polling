<%@page import="model.Candidate"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Voter</title>
<!-- Bootstrap core CSS -->
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Add custom CSS here -->
<link href="resource/bootstrap/css/modern-business.css" rel="stylesheet">
<link href="resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resource/css/voter.css" rel="stylesheet">

</head>

<script type="text/javascript">
	function do_vote(name) {
		var form = document.createElement("form");
		var input = document.createElement("input");

		form.action = "CastVote";
		form.method = "post"

		input.name = "vote";
		input.value = name;
		form.appendChild(input);

		document.body.appendChild(form);
		form.submit();
	}
</script>
<body>
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

			<a class="navbar-brand" href="index.html">Voter Panel</a>
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

	<!-- SIDE NAVBAR -->
	<nav class="navbar navbar-default sidebar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"><b>Voter Details</b><span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-info-sign"></span></a></li>
				<li><a href="#"><%=request.getSession().getAttribute("name")%><span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li><a href="#"><%=request.getSession().getAttribute("gender")%><span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
				<li><a href="#"><%=request.getSession().getAttribute("area")%><span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-globe"></span></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- END SIDE NAVBAR -->

	<div class="container">
		<div class="panel panel-info" id="panel1">
			<%
				if (Integer.parseInt((String) session.getAttribute("voted")) == 0) {
			%>
			<div class="panel-heading">Select your Candidate</div>
			<div class="panel-body" class="ss">

				<%
					ArrayList<Candidate> list = (ArrayList<Candidate>) request.getSession().getAttribute("area_candidates");
				%>
				<button class="form-group btn btn-info btn-block" id="party_btn"
					name="bjp" onclick="do_vote(this.name)">
					<img src="resource/images/bjp_logo.png" id="party_logo">

					<%=list.get(0).getName()%>
				</button>

				<button class="form-group btn btn-info btn-block" id="party_btn"
					name="congress" onclick="do_vote(this.name)">
					<img src="resource/images/congress_logo.png" id="party_logo">
					<%=list.get(1).getName()%>
				</button>

				<button class="form-group btn btn-info btn-block" id="party_btn"
					name="aap" onclick="do_vote(this.name)">
					<img src="resource/images/aap_logo.png" id="party_logo">
					<%=list.get(2).getName()%>
				</button>
				<br> <br>

				<div style="text-align: center; height: 100px;">
					<input type="submit" value="Vote"
						class="form-group btn btn-success btn-circle">
				</div>
			</div>
			<%
				} else {
			%>
			<div class="panel panel-warning">
				<div class="panel-heading">Wait for Results</div>
				<div class="panel-body">You have already voted !</div>
			</div>
			<%
				}
			%>


		</div>


	</div>

	<!-- JavaScript -->
	<script src="resource/bootstrap/js/jquery-1.10.2.js"></script>
	<script src="resource/bootstrap/js/bootstrap.js"></script>
	<script src="resource/bootstrap/js/modern-business.js"></script>
</body>
</html>