
<html>
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="commons.jsp" />
</head>
<script type="text/javascript">
	$(document).ready(function(e) {
		$("#loaderDiv").css("display", "none");
	});
</script>
<body class="hold-transition skin-blue sidebar-mini">

	<script
		src="http://192.168.1.215:8080/HouseOfBots/resources/js/bootstrap.min.js"></script>
	<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/app.js"></script>
	<div class="loader_fade" id="loaderDiv" style="display: block">
		<div class="loader"></div>
	</div>
	<form>
		<!-- <input type="button" class="" data-toggle="modal"
			data-target="#success_subscribe" id="success_subscribe_b"
			style="display: none"></input>  -->
		<!-- <input type="button" class=""
			data-toggle="modal" data-target="#shoutouts_pop" id="loginPopUp"
			style="display: none"></input>  -->
		<!-- <input type="button" class=""
			data-toggle="modal" data-target="#success_registered"
			id="success_reg_pop" style="display: none"></input>  -->
		<!-- <input
			type="button" class="" data-toggle="modal"
			data-target="#success_forgotPassword" id="success_forgotPassword_b"
			style="display: none"></input>  -->
		<!-- <input type="button" class=""
			data-toggle="modal" data-target="#error_msg_pop" id="error_msg_pop_b"
			style="display: none"></input> -->
		<!--  <input type="button" class=""
			data-toggle="modal" data-target="#success_msg_pop"
			id="success_msg_pop_b" style="display: none"></input> -->
	</form>
	<div class="container-fluid">
		<div class="container">
			<div class="row top_rel">
				<div class="col-md-3 pad_top_25">
					<a href="http://192.168.1.215:8080/HouseOfBots"> <img
						src="http://192.168.1.215:8080/HouseOfBots/resources/img/logo.png"
						class="img-responsive">
					</a>
				</div>
				<div class="col-md-9">
					<nav class="navbar pull-right-login no_mrgin">
						<div class="navbar-collapse no-padding">
							<ul class="nav navbar-nav pad_top_15">
								<li class="padd_sub">Subscribe</li>
								<li class="border_right">
									<form class="navbar-form navbar-left"
										action="javascript:subscribe();" role="search">
										<div class="form-group">
											<input type="email" id="subscribeEmail"
												class="form-control form-control_srch cus_radius"
												placeholder="Your Email Address" required>


											<button type="submit"
												class="btn sign_butt cus_radius pull-right" id="subscribe_b">Submit</button>
										</div>
									</form>
								</li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="javascript:void(0);"
									class="dropdown-toggle sign" data-toggle="dropdown"><img
										src="http://192.168.1.215:8080/HouseOfBots/resources/img/login.png"></a>
									<!--sign in -->
									<ul class="dropdown-menu sign-menu signin border_green_box">
										<a href="javascript:void(0);" class="close close_custom cross"
											aria-label="close">&times;</a>
										<li>
											<div class="row">
												<div class="col-md-12">
													<form action="javascript:login(1)">
														<div class="form-group">
															<span class="text-warning small" id="err_sign1_email"></span>
															<input type="email" id="sign1_email" name="sign1_email"
																class="form-control cus_radius border_green "
																placeholder="Email address" required>
														</div>
														<div class="form-group">
															<span class="text-warning small" id="err_sign1_password"></span>
															<input type="password" id="sign1_password"
																name="password"
																class="form-control cus_radius border_green "
																placeholder="Password">
														</div>
														<div class="checkbox">
															<label> <input type="checkbox"
																id="sign1_rememberMe" value=true> Remember me
															</label>
														</div>
														<div class="form-group">
															<button class="btn btn-block sign_butt cus_radius "
																id="sign1_submit">Sign in</button>
														</div>
														<div class="row">
															<div class="col-xs-6">
																<a href="javascript:signUpShow1();"
																	class="signup logn_link">Create Account</a>
															</div>
															<div class="col-xs-6 text-right">
																<a href="javascript:forgetShow1();"
																	class="frgt_pass logn_link">Forgot Password</a>
															</div>
														</div>
													</form>
												</div>
											</div>
										</li>
									</ul> <!--//sign in --> <!--sign up -->
									<ul
										class="dropdown-menu sign-menu signup_open border_green_box">
										<a href="javascript:void(0);" class="close close_custom cross"
											aria-label="close">&times;</a>
										<li>
											<div class="row">
												<div class="col-md-12">
													<form action="javascript:register(1)">
														<div class="form-group">
															<span class="text-warning small" id="err_reg1_username"></span>
															<input type="text" id="reg1_username"
																class="form-control cus_radius border_green"
																placeholder="Username" required>
														</div>
														<div class="form-group">
															<span class="text-warning small" id="err_reg1_email"></span>
															<input type="email" id="reg1_email"
																class="form-control cus_radius border_green"
																placeholder="E-mail" required>
														</div>
														<div class="form-group">
															<span class="text-warning small" id="err_reg1_password"></span>
															<input type="password" id="reg1_password"
																class="form-control cus_radius border_green"
																placeholder="Password" required>
														</div>
														<div class="form-group">
															<span class="text-warning small"
																id="err_reg1_matchingPassword"></span> <input
																type="password" id="reg1_matchingPassword"
																class="form-control cus_radius border_green"
																placeholder="Password (Confirm)" required>
														</div>
														<div class="form-group">
															<button type="submit"
																class="btn btn-success btn-block sign_butt cus_radius"
																id="reg1_submit">Register</button>
														</div>
													</form>
												</div>
											</div>
										</li>
									</ul> <!--//sign up --> <!--forget password -->
									<ul
										class="dropdown-menu sign-menu forget_pass border_green_box">
										<a href="javascript:void(0);" class="close close_custom cross"
											aria-label="close">&times;</a>
										<li>
											<div class="row">
												<div class="col-md-12">
													<form action="javascript:forgotPassword(1);">
														<div class="form-group">
															<span class="text-warning small" id="err_forgot1_email"></span>
															<input type="email" id="forgot1_email"
																class="form-control cus_radius border_green"
																placeholder="E-mail" required>
														</div>
														<div class="form-group">
															<button
																class="btn btn-success btn-block sign_butt cus_radius"
																id="forgot1_submit">Send Password</button>
														</div>
													</form>
												</div>
											</div>
										</li>
									</ul> <!--//forget password --> <!--log out -->
									<ul
										class="dropdown-menu sign-menu log_out_open border_green_box">
										<a href="javascript:void(0);" class="close close_custom cross"
											aria-label="close">&times;</a>
										<li>
											<div class="row">
												<div class="col-md-12">
													<!-- <form> -->
													<p class="text-center bold">Signed in as:</p>
													<p class="text-center" id="user"></p>
													<div class="form-group">
														<button onclick="logout()"
															class="btn btn-success btn-block sign_butt cus_radius">Log
															Out</button>
													</div>
													<!-- </form> -->
												</div>
											</div>
										</li>
									</ul></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
				</div>
			</div>
		</div>
	</div>



	<div class="container-fluid togg_bg tab_top_menu">
		<div class="container">
			<div class="row">
				<!-- Navbar Right Menu -->
				<div class="col-lg-8 top_nav_first">
					<ul class="nav navbar-nav">
						<!-- <li><a href="categories" class="nav_hover nav_gr">Categories</a></li> -->
						<li><a href="http://192.168.1.215:8080/HouseOfBots/shoutouts" 
							onclick="showLoader();"
							class="nav_hover nav_gr login_pop" data-toggle="modal" id = "_header_shoutout">Shoutouts</a></li>
						<li><a
							href="http://192.168.1.215:8080/HouseOfBots/topOfTheLot" 
							onclick = "showLoader();"
							class="nav_hover nav_gr" id = "_header_topLot">Top of the lot</a></li>
						<!-- 	<li><a href="compare" class="nav_hover nav_gr">Compare</a></li> -->
						<li><a
							href="http://192.168.1.215:8080/HouseOfBots/noteworthy" 
							onclick = "showLoader();"
							class="nav_hover nav_gr" id = "_header_noteworthy">Noteworthy</a></li>
						<!-- 	<li><a href="compare" class="nav_hover nav_gr">Compare</a></li> -->
						<li><a
							href="http://192.168.1.215:8080/HouseOfBots/freshArrivals" 
							onclick = "showLoader();"
							class="nav_hover nav_gr" id = "_header_fresh">Fresh arrivals</a></li>
						<!-- 	<li><a href="compare" class="nav_hover nav_gr">Compare</a></li> -->
					</ul>
				</div>
				<div class="col-lg-4">
					<ul class="nav navbar-nav pull-right">
						<li><a href="javascript:void(0);" class="nav_hover nav_gr" id = "_header_blog">Blog</a></li>
						<li><a href="javascript:void(0);"
							onclick="javascript:_submit();"
							class="nav_hover nav_gr login_pop" id = "_header_submit">Submit a Bot</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<!-- Main Header -->
		<header class="main-header">
			<!-- <a class="logo">
      
    </a> -->
			<a href="javascript:void(0);" class="sidebar-toggle bg_toggle"
				data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle
					navigation</span>
			</a>
		</header>

	</div>



	<!-- 	<!-- <!--forget password 
		<div class="modal fade" id="success_forgotPassword" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_custom" role="document">
				<div class="modal-content">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Forgot Password</h4>
					</div>
					<div class="panel-body">
						<p>You should receive a Password Reset Email shortly</p>
						<div class="clearfix"></div>
						<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div>
					</div>
				</div>
			</div>
		</div> -->

	<!-- <!-- 	subscribe
		<div class="modal fade" id="success_subscribe" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_custom" role="document">
				<div class="modal-content">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Subscribe Successfully</h4>
					</div>
					<div class="panel-body">
						<p>You have successfully subscribed on your email ID</p>
						<div class="clearfix"></div>
						<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div>
					</div>
				</div>
			</div>
		</div> -->

	<!--Error Pop-up -->
	<div class="modal fade" id="error_msg_pop" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog_custom" role="document">
			<div class="modal-content">
				<div class="modal-header modal-header-custom bg_red">
					<button type="button" class="close close_custom"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title txt_white" id="errorPop_title"></h4>
				</div>
				<div class="panel-body" id="errorPop_textd">
					<p id="errorPop_text">You have successfully registered. Please
						verify email to enable user</p>
					<div class="clearfix"></div>
					<!--<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div> -->
				</div>
			</div>
		</div>
	</div>


	<!--Success Pop-up -->
	<div class="modal fade" id="success_msg_pop" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog_custom" role="document">
			<div class="modal-content">
				<div class="modal-header modal-header-custom">
					<button type="button" class="close close_custom"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="successPop_title">SignUp Success</h4>
				</div>
				<div class="panel-body">
					<p id="successPop_text">You have successfully registered.
						Please verify email to enable user</p>
					<div class="clearfix"></div>
					<!--<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div> -->
				</div>
			</div>
		</div>
	</div>

	<!--shoutouts -->
	<div class="modal fade" id="shoutouts_pop" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog_custom" role="document">
			<div class="modal-content">
				<!-- pop -->
				<div class="signin_pop">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="panel-body">
						<p>You have not Logged in. Please Log in</p>

						<div class="col-sm-4 none_768">
							<img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/user.png"
								width="100">
						</div>
						<div class="col-sm-8">
							<form action="javascript:login(2)">
								<div class="form-group">
									<span class="text-warning small" id="err_sign2_email"></span> <input
										type="email" id="sign2_email"
										class="form-control cus_radius border_green"
										placeholder="Email address" required>
								</div>
								<div class="form-group">
									<input type="password" id="sign2_password"
										class="form-control cus_radius border_green"
										placeholder="Password" required>
								</div>
								<div class="checkbox">
									<label> <input type="checkbox" id="sign2_rememberMe">
										Remember me
									</label>
								</div>
								<div class="form-group">
									<button class="btn btn-block sign_butt cus_radius"
										id="sign2_submit">Sign in</button>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<a href="javascript:void(0);" class="signup_pop logn_link">Create
											Account</a>
									</div>
									<div class="col-xs-6 text-right">
										<a href="javascript:void(0);" class="frgt_pass_pop logn_link">Forgot
											Password</a>
									</div>
								</div>
							</form>
						</div>


					</div>
				</div>
				<!--//login pop -->
				<!--register pop -->
				<div class="signup_open_pop" id="signup_open_pop">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Register</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-4 none_768">
							<img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/create.png"
								width="100">
						</div>
						<div class="col-md-8">
							<form action="javascript:register(2);">
								<div class="form-group">
									<span class="text-warning small" id="err_reg2_username"></span>
									<input type="text" class="form-control cus_radius border_green"
										placeholder="Username" id="reg2_username" required>
								</div>
								<div class="form-group">
									<span class="text-warning small" id="err_reg2_email"></span> <input
										type="email" class="form-control cus_radius border_green"
										placeholder="E-mail" id="reg2_email" required>
								</div>
								<div class="form-group">
									<span class="text-warning small" id="err_reg2_password"></span>
									<input type="password"
										class="form-control cus_radius border_green"
										placeholder="Password" id="reg2_password" required>
								</div>
								<div class="form-group">
									<span class="text-warning small" id="err_reg2_matchingPassword"></span>
									<input type="password"
										class="form-control cus_radius border_green"
										placeholder="Password (Confirm)" id="reg2_matchingPassword"
										required>
								</div>
								<div class="form-group">
									<button class="btn btn-success btn-block sign_butt cus_radius"
										id="reg2_submit">Register</button>
								</div>
							</form>
						</div>

					</div>
				</div>
				<!--//register pop -->
				<!--forget password pop -->
				<div class="forget_pass_pop">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Forget Password</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-4 none_768">
							<img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/forget.png"
								width="100">
						</div>
						<div class="col-md-8">
							<form action="javascript:forgotPassword(2)">
								<div class="form-group">
									<span class="text-warning small" id="err_forgot2_email"></span>
									<input type="email" id="forgot2_email"
										class="form-control cus_radius border_green"
										placeholder="E-mail" required>
								</div>
								<div class="form-group">
									<button class="btn btn-success btn-block sign_butt cus_radius"
										id="forgot2_submit">Send Password</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>