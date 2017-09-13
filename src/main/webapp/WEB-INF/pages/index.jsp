<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title> VF | house of bots</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/font-awesome.min.css">
<!-- Ionicons -->

<!-- Theme style -->
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/admin.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/skin-blue.min.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/custom.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/responsive.css">
<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/jQuery-2.2.0.min.js"></script>

<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/index.js" type="text/javascript"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/userOp.js" type="text/javascript"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/botOp.js" type="text/javascript"></script>

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script type="text/javascript">
	$(document).ready(function(e) {
		$('.signup_open, .forget_pass, .log_out_open').hide();
		/*  $('.sign').click(function(e) {
			$('.signin').show();
			$('.signup_open').hide();
			$('.forget_pass').hide();
			$('.log_out_open').hide();
		}); */
		$('.signup').click(function(e) {
			$('.signup_open').show();
			$('.signin').hide();
			$('.forget_pass').hide();
			$('.log_out_open').hide();
		});
		$('.frgt_pass').click(function(e) {
			$('.signup_open').hide();
			$('.signin').hide();
			$('.forget_pass').show();
			$('.log_out_open').hide();
		});
		$('.log_out').click(function(e) {
			$('.signup_open').hide();
			$('.signin').hide();
			$('.forget_pass').hide();
			$('.log_out_open').show();
		});

	});
	//pop up login

	$(document).ready(function(e) {
		$('.signup_open_pop, .forget_pass_pop, .success_msg_pop').hide();
		$('.signup_pop').click(function(e) {
			$('.signup_open_pop').show();
			$('.signin_pop').hide();
			$('.forget_pass_pop').hide();
			$('.success_msg_pop').hide();
		});
		$('.frgt_pass_pop').click(function(e) {
			$('.forget_pass_pop').show();
			$('.signup_open_pop').hide();
			$('.signin_pop').hide();
			$('.success_msg_pop').hide();
		});
		$('.login_pop').click(function(e) {
			$('.forget_pass_pop').hide();
			$('.signup_open_pop').hide();
			$('.signin_pop').show();
			$('.success_msg_pop').hide();
		});
		$('.success_msg').click(function(e) {
			/* $('.success_msg_pop').show(); */
			$('.forget_pass_pop').hide();
			$('.signup_open_pop').hide();
			$('.signin_pop').hide();
		});

	});

	function load() {
		loadPageUserOp();
		_homePage();
	}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload='load();'>
	<form>
		<input type="button" class="" data-toggle="modal"
			data-target="#success_subscribe" id="success_subscribe_b"
			style="display: none"></input> <input type="button" class=""
			data-toggle="modal" data-target="#shoutouts_pop" id="loginPopUp"
			style="display: none"></input> <input type="button" class=""
			data-toggle="modal" data-target="#success_registered"
			id="success_reg_pop" style="display: none"></input> <input
			type="button" class="" data-toggle="modal"
			data-target="#success_forgotPassword" id="success_forgotPassword_b"
			style="display: none"></input> <input type="button" class=""
			data-toggle="modal" data-target="#error_msg_pop" id="error_msg_pop_b"
			style="display: none"></input> <input type="button" class=""
			data-toggle="modal" data-target="#success_msg_pop"
			id="success_msg_pop_b" style="display: none"></input>
	</form>
	<div class="container-fluid">
		<div class="container">
			<div class="row top_rel">
				<div class="col-md-3 pad_top_25">
					<a href="/BotU/"> <img src="http://192.168.1.215:8080/HouseOfBots/resources/img/logo.png"
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
												placeholder="Your Email Adress" required>


											<button type="submit"
												class="btn sign_butt cus_radius pull-right" id="subscribe_b">Submit</button>
										</div>
									</form>
								</li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#"
									class="dropdown-toggle sign" data-toggle="dropdown"><img
										src="http://192.168.1.215:8080/HouseOfBots/resources/img/login.png"></a> <!--sign in -->
									<ul class="dropdown-menu sign-menu signin border_green_box">
										<a href="#" class="close close_custom cross"
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
																id="sign1_rememberMe"> Remember me
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
										<a href="#" class="close close_custom cross"
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
										<a href="#" class="close close_custom cross"
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
										<a href="#" class="close close_custom cross"
											aria-label="close">&times;</a>
										<li>
											<div class="row">
												<div class="col-md-12">
													<!-- <form> -->
													<p class="text-center bold">Signed in as:</p>
													<p class="text-center"></p>
													<div id="user"></div>
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
						<li><a href="categories" onclick="javascript:categories(null, null);"
							class="nav_hover nav_gr">Categories</a></li>
						<li><a href="#" onclick="javascript:secureAccess(_shouOut);"
							class="nav_hover nav_gr login_pop" data-toggle="modal">Shoutouts</a></li>
						<li><a href="#" class="nav_hover nav_gr">Watch List</a></li>
					<!-- 	<li><a href="compare" class="nav_hover nav_gr">Compare</a></li> -->
					</ul>
				</div>
				<div class="col-lg-4">
					<ul class="nav navbar-nav pull-right">
						<li><a href="#" class="nav_hover nav_gr">Blog</a></li>
						<li><a href="#" onclick="javascript:secureAccess(_submit);"
							class="nav_hover nav_gr login_pop">Submit a Bot</a></li>
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
			<a href="#" class="sidebar-toggle bg_toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span>
			</a>
		</header>
		<aside class="main-sidebar" id = "_sidebar">
			<section class="sidebar">
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu tab_none">
					<li class="header font16 color_white bg_orange">MAIN LINKS</li>
					<!-- Optionally, you can add icons to the links -->
					<li><a href="#"><span>Categories</span></a></li>
					<li><a href="#" class="login_pop" data-toggle="modal"
						data-target="#shoutouts_pop"><span>Shoutouts</span></a></li>
					<li><a href="#"><span>Watch List</span></a></li>
					<li><a href="#"><span>Blog</span></a></li>
					<li><a href="#" class="login_pop" data-toggle="modal"
						data-target="#shoutouts_pop"><span>Submit a Bot</span></a></li>
				</ul>
				<ul class="sidebar-menu" id="platDiv">
					<li class="header font16 color_white">PLATFORMS</li>
					<!-- Optionally, you can add icons to the links -->
					<!--<li class="treeview">
          <a href="#"><span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul>
        </li> -->
				</ul>
				<ul class="sidebar-menu" id="catDiv">
					<li class="header font16 color_white bg_lightgreen">CATEGORIES</li>
				</ul>

				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" id = "_centerDiv">
			<div id="mainContentTop">


				<div class="row bg_banner_upload" id="mct_submit"
					style="display: none;">
					<div class="clearfix"></div>
					<div class="col-lg-12 text-center pad_top_60 pad_bottom_15">
						<!--<p class="color_white font16">﻿Lorem ipsum dolor sit amet <span class="bold">Bot Directory ﻿,</span> accumsan id imperdiet et, porttitor at.</p> -->
					</div>
				</div>


				<div class="row bg_banner" id="mct_search" style="display: none">
					<div
						class="col-lg-6 col-lg-offset-3  col-sm-10 col-sm-offset-2 col-md-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 pad_top_25">
						<div class="text-center pad_top_25">
							<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/mail.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/twt.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/face.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/slack.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/tele.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/mail.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/twt.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/face.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/slack.png" class="mrg_left_right"> <img
								src="http://192.168.1.215:8080/HouseOfBots/resources/img/tele.png" class="mrg_left_right">
						</div>
						<div class="custom-search-input margin_top20">
							<div class="input-group search">
								<input type="text" class="form-control border_rad search"
									placeholder="Search..."
									onkeyup="performQuickBotSearch(this.value);" />
								<ul class="results" id="searchList">
								</ul>
								<!-- <span class="input-group-btn">
								<button class="btn btn-lg" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span> -->
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="col-lg-12 text-center pad_top_60 pad_bottom_15">
						<p class="color_white font16">
							﻿Lorem ipsum dolor sit amet <span class="bold">Bot
								Directory ﻿,</span> accumsan id imperdiet et, porttitor at.
						</p>
					</div>
				</div>


				<div class="row bg_banner_detail" id="mct_description"
					style="display: none">
					<div class="clearfix"></div>
					<div class="col-lg-12 text-center pad_top_60 pad_bottom_15">
						<h3 class="color_white bold text-left padd_left300"
							id="desc_title"></h3>
					</div>
				</div>






































			</div>
			<!-- Top Content Ends -->



			<!-- Main content -->
			<section class="content">
				<div id="mainContent">


					<div id="_categories" style="display: none;">
						<div class="col-lg-10 col-sm-12">
							<div class="row">
								<div class="col-xs-12">
									<h2 class="h3_cap" id="categoriesHeading">Business Tools</h2>
								</div>

							</div>

							<div id="businessToolsDiv" class="row"></div>



							<div class="row margin-bottom">
								<div class="col-md-6 pad_top_25">
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
								</div>
								<div class="col-md-6 pad_top_25">
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
								</div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="col-sm-12 ads_min">
								<!--<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads.gif"> -->
							</div>
						</div>

					</div>


					<div id="_homepage" style="display: none">
						<div class="col-lg-10 col-sm-12">
							<div id="_topLotDiv">
								<div class="row">
									<div class="col-xs-8">
										<h2 class="h3_cap">Top of the Lot</h2>
									</div>
									<div class="col-xs-4 pad_top_25 text-right" id="seeMore1">
										<button class="btn button_more"
											onclick="seeMore('topLotDiv');">See More</button>
									</div>
								</div>
								<div id="topLotDiv" class="row"></div>
							</div>
							<!--noteworthly -->
							<div id="_noteWorthyDiv">
								<div class="row pad_top_15">
									<div class="col-sm-8">
										<h2 class="h3_cap">Noteworthy</h2>
									</div>
									<div class="col-xs-4 pad_top_25 text-right" id="seeMore2">
										<button class="btn button_more"
											onclick="seeMore('noteWorthyDiv');">See More</button>
									</div>
								</div>
								<div id="noteWorthyDiv" class="row"></div>
							</div>
							<!--fresh arrivals -->
							<div id="_freshLotDiv">
								<div class="row">
									<div class="col-xs-8">
										<h2 class="h3_cap">Fresh Arrivals</h2>
									</div>
									<div class="col-xs-4 pad_top_25 text-right" id="seeMore3">
										<button class="btn button_more"
											onclick="seeMore('freshLotDiv');">See More</button>
									</div>
								</div>
								<div id="freshLotDiv" class="row"></div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
							</div>
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
							</div>
						</div>
						<div class="row pad_top_25">
							<div class="col-sm-12">
								<h2 class="h3_cap">Bot Demo Screens</h2>
								<div class="color_dg">
									<span class="font16">FX Buizee Bot</span> <a
										class="padd_left20 color_dg">Next Bot <img
										src="http://192.168.1.215:8080/HouseOfBots/resources/img/arrow.png"></a>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="col-lg-12 text-center">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bott_scrn.png" class="img-responsive">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="col-sm-12 ads_min">
								<!--<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads.gif"> -->
							</div>
						</div>


					</div>


					<div class="col-lg-10 col-sm-12" id="_submit" style="display: none">
						<div class="row">
							<div class="col-xs-12">
								<h2 class="h3_cap">Upload Bot</h2>
							</div>

						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="upload_box">
									<div class="col-sm-3 text-center pad_top_25">
										<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bot.png">
									</div>
									<div class="col-sm-9 pad_top_60">
										<form action="javascript:uploadBot();"
											enctype="multipart/form-data" id="ub_form">
											<div class="form-group">
												<label class="input_mini_label">Name of Bot</label> <span
													class="text-warning small" id="err_ub_title"></span> <input
													type="text" class="form-control input_mini cus_radius"
													placeholder="Bot Thumbnail" required id="ub_title">
											</div>
											<div class="form-group">
												<label class="input_mini_label">Tagline</label> <span
													class="text-warning small" id="err_ub_tagline"></span> <input
													type="text" class="form-control input_mini cus_radius"
													placeholder="Tagline" required id="ub_tagline">
											</div>
											<div class="form-group">
												<label class="input_mini_label">Description</label> <span
													class="text-warning small" id="err_ub_description"></span>
												<textarea class="form-control input_mini cus_radius"
													rows="5" placeholder="Description" required
													id="ub_description"></textarea>
											</div>
											<div class="form-group">
												<label class="input_mini_label">What platform(s) is
													your bot on?</label> <span class="text-warning small"
													id="err_ub_platformsNames"></span>
												<ul class="upload_social" id="ul_ub_platforms">

												</ul>
											</div>
											<div class="form-group">
												<label class="input_mini_label">Select Categories</label> <span
													class="text-warning small" id="err_ub_categories"></span> <select
													class="form-control input_mini cus_radius"
													id="ub_categories">
													<option>Select</option>
												</select>
											</div>
											<div class="form-group">
												<label class="input_mini_label">URL</label> <span
													class="text-warning small" id="err_ub_path"></span> <input
													type="text" class="form-control input_mini cus_radius"
													placeholder="http://www.example.com" required id="ub_path">
											</div>
											<div class="form-group">
												<label class="input_mini_label">EMAIL</label> <span
													class="text-warning small" id="err_ub_email"></span> <input
													type="email" class="form-control input_mini cus_radius"
													placeholder="Email" required id="ub_email">
											</div>
											<div class="form-group">
												<label class="input_mini_label">Bot Thumbnail image</label>
												<span class="text-warning small" id="err_ub_imageExt"></span>
												<input type="file"
													class="form-control input_mini cus_radius"
													placeholder="Bot Thumbnail" required id="ub_imageExt">
											</div>

											<div class="form-group">
												<label class="input_mini_label">Cover Image</label> <span
													class="text-warning small" id="err_ub_coverImage"></span> <input
													type="file" class="form-control input_mini cus_radius"
													placeholder="Bot Thumbnail" required id="ub_coverImage">
											</div>
											<div class="form-group">
												<label class="input_mini_label"></label>
												<button class="btn upload_submit pull-right margin_right20"
													id="ub_submit">SUBMIT</button>
											</div>
										</form>
										<div class="col-lg-12 pad_bottom_25">
											<p class="inst_wh padd_sub">
												<span class="bold">Instructions :</span> Pellentesque in
												ipsum id orci porta dapibus. Nulla quis lorem ut libero
												malesuada feugiat. Nulla porttitor accumsan tincidunt.
												Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
												Quisque velit nisi, pretium ut lacinia in, elementum id
												enim. Nulla quis lorem ut libero malesuada feugiat.
												Pellentesque in ipsum id orci porta dapibus. Cras ultricies
												ligula sed magna dictum porta. Sed porttitor lectus nibh.
												Vivamus suscipit tortor eget felis porttitor volutpat.
											</p>
										</div>
									</div>


									<div class="clearfix"></div>
								</div>

							</div>
						</div>


						<div class="row margin-bottom">
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
							</div>
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
							</div>
						</div>
					</div>


					<!--Description Starts  -->

					<div id="_description" style="display: none">

						<div class="col-lg-10 col-sm-12">
							<div class="row">
								<div class="col-md-9">
									<div class="des_left_img">
										<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bot.png" id="desc_img" height='242'
											width='242'>
									</div>
									<p class="text-left padd_left260 padd_top40">
										<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/global.png"> <a href="#"
											id="desc_url" target="_blank" class="bold italic"></a>
									</p>
									<h4 class="pad_top_60">Tagline:</h4>
									<h4 class="pad_bottom_25" id="desc_tagline"></h4>
									<p id="desc_description"></p>
									<hr />
									<button class="btn button_more pull-right">Read More</button>
									<div class="clearfix"></div>
									<form>
										<div class="form-group">
											<label><i
												class="glyphicon glyphicon-edit color_green fa-2x v_top margin-r-5"></i>
												Write your Review</label>
											<textarea class="form-control cus_radius border_green"
												rows="5" placeholder="Description"></textarea>
											<button class="btn upload_submit pull-right">SUBMIT</button>
										</div>
									</form>
									<div class="pad_top_25">
										<p class="bold border-bott-dashed">USER REVIEWS</p>
										<div class="review_box">
											<div class="mCustomScrollbar review_scroll"
												data-mcs-theme="inset-2-dark">
												<div class="padd_r50">
													<!--first review -->
													<p class="bold pull-left">
														<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/review.png"> User Name Here
													</p>
													<p class="pull-right small pad_top_15">August 23, 2016</p>
													<div class="clearfix"></div>
													<p class="italic">Lorem ipsum dolor sit amet,
														consectetur adipiscing elit. Vestibulum ante ipsum primis
														in faucibus orci luctus et ultrices posuere cubilia Curae;
														Donec velit neque, auctor sit amet aliquam vel,
														ullamcorper sit amet ligula. Nulla porttitor accumsan
														tincidunt. Vivamus magna justo, lacinia eget consectetur
														sed, convallis at tellus.</p>
													<hr />
													<!--second review -->
													<p class="bold pull-left">
														<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/review.png"> User Name Here
													</p>
													<p class="pull-right small pad_top_15">August 23, 2016</p>
													<div class="clearfix"></div>
													<p class="italic">Lorem ipsum dolor sit amet,
														consectetur adipiscing elit.</p>
													<hr />
													<!--third review -->
													<p class="bold pull-left">
														<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/review.png"> User Name Here
													</p>
													<p class="pull-right small pad_top_15">August 23, 2016</p>
													<div class="clearfix"></div>
													<p class="italic">ullamcorper sit amet ligula. Nulla
														porttitor accumsan tincidunt. Vivamus magna justo, lacinia
														eget consectetur sed, convallis at tellus.</p>
													<hr />
													<!--fourth review -->
													<p class="bold pull-left">
														<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/review.png"> User Name Here
													</p>
													<p class="pull-right small pad_top_15">August 23, 2016</p>
													<div class="clearfix"></div>
													<p class="italic">Lorem ipsum dolor sit amet,
														consectetur adipiscing elit.</p>
													<hr />
												</div>
											</div>
											<ul class="pagination pagination-sm pull-right margin-r-5">
												<li><a href="javascript:void(0)">1</a></li>
												<li><a href="javascript:void(0)">2</a></li>
												<li><a href="javascript:void(0)">3</a></li>
												<li><a href="javascript:void(0)">4</a></li>
												<li><a href="javascript:void(0)">5</a></li>
											</ul>
											<div class="clearfix"></div>
										</div>
									</div>

								</div>
								<div class="col-md-3">
									<div class="left_des margin_top20">
										<h5 class="bold">GET THIS BOT ON</h5>
										<hr class="no-padding no-margin">
										<div id="desc_platforms"></div>
										<h5 class="bold pad_top_15">CATEGORIES</h5>
										<hr class="no-padding no-margin">
										<div id="desc_categories"></div>
										<hr class="no-padding margin-bottom-none">
										<h5 class="bold">
											SHOUTOUTS : <span class="color_d_green"
												id="desc_shoutoutCount"></span>
										</h5>
										<hr class="no-padding no-margin">
										<h5 class="bold">
											REVIEWS : <span class="text-orange" id="desc_reviewCount"></span>
										</h5>
									</div>
									<div class="wish_list">
										<a href="#"><i class="fa fa-plus-circle font20"></i> ADD
											TO WISHLIST</a>
									</div>
									<h5 class="bold">SHARE</h5>
									<hr class="no-padding no-margin">
									<div class="pad_top_5">
										<a href="#"><img src="http://192.168.1.215:8080/HouseOfBots/resources/img/share_twt.png"></a>
									</div>
									<div class="pad_top_5">
										<a href="#"><img src="http://192.168.1.215:8080/HouseOfBots/resources/img/share_fb.png"></a>
									</div>
									<h5 class="bold pad_top_15">RATE THIS BOT</h5>
									<hr class="no-padding no-margin">
									<div class="pad_top_5" id="desc_rateBot">
										<button type="button" class="btn btn-warning btn-xs"
											aria-label="Left Align">
											<span class="fa fa-star" aria-hidden="true"></span>
										</button>
										<button type="button" class="btn btn-warning btn-xs"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
										<button type="button" class="btn btn-warning btn-xs"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
										<button type="button" class="btn btn-default btn-grey btn-xs"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
										<button type="button" class="btn btn-default btn-grey btn-xs"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
									</div>
									<div class="row margin_top20">
										<div class="col-lg-12">
											<h2 class="h3_cap">Similar</h2>
										</div>
									</div>
									<div class="row">
										<div class="mid_block">
											<div class="img_block text-center">
												<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/img2.png" class="v_top"><i
													class="fa fa-info margin_left color_green font20"
													aria-hidden="true"></i>
											</div>
											<div class="txt_block">
												<div class="font16 txt_cap">FX Buizee Bot</div>
												<div class="res_center">
													<a href="#"><img src="http://192.168.1.215:8080/HouseOfBots/resources/img/mail_grey.png"></a><a
														href="#"><img src="http://192.168.1.215:8080/HouseOfBots/resources/img/twt_grey.png"
														class="mrg_left_right"></a><a href="#"><img
														src="http://192.168.1.215:8080/HouseOfBots/resources/img/face_grey.png"></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<h2 class="h3_cap">Related Bots</h2>
								</div>
							</div>
							<div class="row" id="desc_relatedBot"></div>
							<div class="row pad_top_60 pad_bott_60">
								<div class="col-md-6 pad_top_25">
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
								</div>
								<div class="col-md-6 pad_top_25">
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
								</div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="col-sm-12 ads_min">
								<!--<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads.gif"> -->
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<!--Description eNDs  -->






				</div>


				<!-- MAIN Content Ends -->



				<!-- <div class="row">
					<div class="col-md-6 pad_top_25">
						<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
					</div>
					<div class="col-md-6 pad_top_25">
						<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
					</div>
				</div>
				<div class="container">
					<div class="col-lg-12 text-center">
						<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bott_scrn.png" class="img-responsive">
					</div>
				</div>
				<div class="col-sm-2">
					<div class="col-sm-12 ads_min">
						<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads.gif">
					</div>
				</div> -->
			</section>
			<div class="clearfix"></div>
		</div>
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->
	<div class="container-fluid bott_strp height0" id="_cat_bottom_strip"
		style="display: none"></div>
	<div class="container-fluid bott_strp" id="_hp_bottom_strip"
		style="display: none"></div>
	<footer class="bg_footer">
		<div class="container">
			<div class="col-lg-12 footer_ad text-center ads_bottom">
				<!--<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads2.gif"> -->
			</div>
			<div class="col-sm-12 margin_left_nav">
				<ul class="footer_nav">
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Subscribe</a></li>
				</ul>
				<ul class="footer_nav">
					<li><a href="#">HOB Consultation</a></li>
					<li><a href="#">Advertising</a></li>
					<li><a href="#">Privacy Policy</a></li>
				</ul>
				<ul class="footer_nav">
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
					<li><a href="#">marketing@hob.com</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
			<p class="text-center copy">&copy; 2016 ValueFirst.</p>
		</div>
	</footer>


	<!--forget password -->
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
					<!--<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div> -->
				</div>
			</div>
		</div>
	</div>

	<!--subscribe -->
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
					<!--<div class="modal-footer pad"></div>
        <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">Upload File</button>
      </div> -->
				</div>
			</div>
		</div>
	</div>


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

	<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/bootstrap.min.js"></script>
	<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/app.js"></script>




	<div style="display: none;"></div>







	<!--shoutouts -->
	<div class="modal fade" id="shoutouts_pop" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog_custom" role="document">
			<div class="modal-content">
				<!--login pop -->
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
							<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/user.png" width="100">
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
										<a href="#" class="signup_pop logn_link">Create Account</a>
									</div>
									<div class="col-xs-6 text-right">
										<a href="#" class="frgt_pass_pop logn_link">Forgot
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
							<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/create.png" width="100">
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
							<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/forget.png" width="100">
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
				<!--//forget password pop -->
				<!--success message pop -->
				<div class="success_msg_pop">
					<div class="modal-header modal-header-custom">
						<button type="button" class="close close_custom"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Registered</h4>
					</div>
					<div class="panel-body">

						<div class="col-md-8">
							<p>You have successfully registered. Please verify email to
								enable user</p>
						</div>


					</div>
				</div>
				<!--//success message pop -->
			</div>
		</div>
	</div>



</body>


</html>