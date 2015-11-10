<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Polling</title>

<!-- Bootstrap core CSS -->
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="resource/bootstrap/css/modern-business.css" rel="stylesheet">
<link href="resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
</head>
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

				<a class="navbar-brand" href="index.html">Online Polling</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">About</a></li>
					<li data-toggle="modal" data-target="#registerModal"><a
						href="#">Register</a></li>
					<li data-toggle="modal" data-target="#loginModal"><a href="#">Login</a></li>
					<li data-toggle="modal" data-target="#adminModal"><a href="#">Admin</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url('resource/images/carousel1.jpg'); height: 400px; width: 1400px;"></div>
				<div class="carousel-caption">
					<h1></h1>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resource/images/carousel2.jpg'); height: 400px; width: 1400px;"></div>
				<div class="carousel-caption">
					<h1></h1>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resource/images/carousel3.jpg');"></div>
				<div class="carousel-caption">
					<h1></h1>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</div>

	<div class="section">

		<div class="container">

			<div class="row">
				<div class="col-lg-4 col-md-4" style="text-align: center;">
					<h3>Register</h3>
					<img src="resource/images/register.png">
				</div>
				<div class="col-lg-4 col-md-4" style="text-align: center;">
					<h3>Login</h3>
					<img src="resource/images/login.png">
				</div>
				<div class="col-lg-4 col-md-4" style="text-align: center;">
					<h3>Vote</h3>
					<img src="resource/images/vote.png">
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->

	</div>
	<!-- /.section -->



	<div class="section-colored">

		<div class="container">

			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<h2>Guidelines:</h2>
					<ul>
						<li>Register yourself</li>
						<li>Login</li>
						<li>Select your area</li>
						<li>Select your party</li>
						<li>Vote</li>
						<li>Get results at your mail after polling is finished</li>
					</ul>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<img class="img-responsive" src="resource/images/guide.jpg">
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->

	</div>
	<!-- /.section-colored -->




	<!-- /.container -->

	<div class="container">

		<hr>

		<footer>
			<div class="row">
				<div class="col-lg-6">
					<p>
						<b>Copyright &copy; Prateek Joshi</b><br>
					</p>
				</div>

				<div class="col-lg-6">
					<p>
						Developed By <b>PJ</b> aka <b>electron</b> </b>
					</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- loginModal -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login to Vote</h4>
				</div>
				<div class="modal-body">
					<form class="form-group" role="form" action="login" method="post">
						<input type="text" name="login_email" class="form-control"
							placeholder="Enter your email id"><br> <br> <input
							type="password" name="login_password" class="form-control"
							placeholder="Enter your password"><br> <br>
						<div style="text-align: center;">
							<input type="submit" value="Let me vote"
								class="form-group btn btn-success">
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>
	<!-- end loginModal -->
	
	<!-- ADMIN loginModal -->
	<div id="adminModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Admin Panel Login</h4>
				</div>
				<div class="modal-body">
					<form class="form-group" role="form" action="AdminLogin" method="post">
						<input type="text" name="admin_email" class="form-control"
							placeholder="Enter your email id"><br> <br> <input
							type="password" name="admin_password" class="form-control"
							placeholder="Enter your password"><br> <br>
						<div style="text-align: center;">
							<input type="submit" value="Validate"
								class="form-group btn btn-danger">
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>
	<!-- end loginModal -->

	<!--registerModal -->
	<div id="registerModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Register to Vote</h4>
				</div>
				<div class="modal-body">
					<form class="form-group" role="form" method="post" action="register">
						<input type="text" name="register_name" class="form-control"
							placeholder="Enter your full name" required><br> <input
							type="text" name="register_email" class="form-control"
							placeholder="Enter your email" required><br> <input
							type="password" name="register_password" class="form-control"
							placeholder="Choose a password " required><br> Date
						of Birth: <input type="date" name="register_dob"
							class="form-control"  required><br>
						Male:<input type="radio" name="register_gender" value="Male">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Female:<input type="radio" name="register_gender" value="Female"><br>
						<br> Select your area: <br> <select class="form-control" name="register_area">
							<option value="select">---Select---</option>
							<option value="mandi">Mandi</option>
							<option value="shimla">Shimla</option>
							<option value="vaknaghat">Vaknaghat</option>
							<option value="solan">Solan</option>
							<option value="kullu">Kullu</option>
						</select><br><br>
						<div style="text-align: center;">
							<input type="submit" value="Register me "
								class="form-group btn btn-info">
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>

	<!-- end  -->

	<!-- JavaScript -->
	<script src="resource/bootstrap/js/jquery-1.10.2.js"></script>
	<script src="resource/bootstrap/js/bootstrap.js"></script>
	<script src="resource/bootstrap/js/modern-business.js"></script>
</body>
</html>