<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>VF | house of bots</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/font-awesome.min.css">
<!-- Ionicons -->

<!-- Theme style -->
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/admin.css">
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/skin-blue.min.css">
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/custom.css">
<link rel="stylesheet"
	href="http://192.168.1.215:8080/HouseOfBots/resources/css/responsive.css">

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
			<div class="col-lg-12 font20">
				<c:choose>
					<c:when test="${empty title}">
						Oops!
					</c:when>
					<c:otherwise>
					 	${title}
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="container mrg_top30">
		<div class="col-lg-12">
			<p class="pull-left">
				<i class="fa fa-ban fa-5x" aria-hidden="true" style="color: #ff2d00"></i>
			</p>
			<p class="pull-left pad_top_15 padd_left_twt bold">
				<c:choose>
					<c:when test="${empty msg}">
						You seem to be lost. There is something wrong with this link!
					</c:when>
					<c:otherwise>
					 	${msg}
					</c:otherwise>
				</c:choose>

			</p>
		</div>
	</div>
</body>
</html>
