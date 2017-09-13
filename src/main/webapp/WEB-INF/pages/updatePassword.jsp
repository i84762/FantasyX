<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Cache-control" content="no-cache">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-84022418-1', 'auto');
    ga('send', 'pageview');
</script>



</head>
<body>
	<div class="container pad_bottom_25 pad_top_25">
		<div class="col-lg-12">
			<div class="col-lg-10">
				<a href="http://192.168.1.215:8080/HouseOfBots/"> <img
					src="http://192.168.1.215:8080/HouseOfBots/resources/img/logo.png"></a>
			</div>
		</div>
	</div>
	<div class="reset_bg">
		<div class="container">
			<div class="col-lg-12 font20">Reset Password</div>
		</div>
	</div>
	<div class="container mrg_top30">
		<div class="col-sm-6 col-xs-12">

			<form:form modelAttribute="user" method="POST" enctype="utf8">
			<div class="form-group">
					<label class="input_mini_reset">New Password</label> 
					<div class="input_reset">
						 <form:errors path="" class="text-danger small span_error"
							element="div" />
						<form:input autocomplete="off" path="password" value="" type="password" placeholder="New Password"
							class="form-control cus_radius" required = "true" id ="inPassword"/>
							</div>
					</div>
					<div class="form-group pad_top_15">

					<label class="input_mini_reset">Verify New Password</label> 
					<div class="input_reset">
					<%-- <form:errors path="" class="text-danger small span_error" element="div" /> --%>
					<form:input autocomplete="off" path="matchingPassword" value="" type="password" class="form-control cus_radius"
							placeholder="Verify New Password" required = "true"/>
							</div>					
					</div>				
					<div class="form-group">
						<label class="input_mini_reset"></label>
						<button type="submit" class="btn reset_button input_reset">UPDATE
							PASSWORD</button>
				</div>
			</form:form>
			<%-- <form:form modelAttribute="user" method="POST" enctype="utf8">
				<div class="form-group">
					<label class="input_mini_reset">New Password</label> 
					<form:input path="password" value="" type="password" class="form-control input_reset cus_radius"
						placeholder="New Password" required = "true"/>
						<form:errors path="password"  element="div" />
				</div>
				<div class="form-group">

					<label class="input_mini_reset">Verify New Password</label> 
					<form:input path="matchingPassword" value="" type="password" class="form-control input_reset cus_radius"
						placeholder="Verify New Password" required = "true"/>
				</div>
				<div class="form-group">
					<label class="input_mini_reset"></label>
					<button class="btn reset_button input_reset">UPDATE
						PASSWORD</button>
				</div>
			</form:form> --%>
		</div>
	</div>



</body>
</html>
