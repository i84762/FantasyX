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
										<span class="text-warning small" id="err_sign2_email"></span>
										<input type="email" id="sign2_email"
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
										<input type="text"
											class="form-control cus_radius border_green"
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
										<span class="text-warning small"
											id="err_reg2_matchingPassword"></span> <input type="password"
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