<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

      
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/font-awesome.min.css">
<!-- Ionicons -->
<!-- Theme style -->
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/admin.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/skin-blue.min.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/custom.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/responsive.css">
<link rel="stylesheet" href="http://192.168.1.215:8080/HouseOfBots/resources/css/animate.css">
<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/jQuery-2.2.0.min.js"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/index.js" type="text/javascript"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/userOp.js" type="text/javascript"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/botOp.js" type="text/javascript"></script>
<link href="http://192.168.1.215:8080/HouseOfBots/resources/css/custom_Scrollbar.css" rel="stylesheet">
<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/custom_Scrollbar.js" type="text/javascript"></script>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>

<script type="text/javascript">
	$(document).ready(function(e) {
		 $('.search_home').click(function(e) 
	             	{
	                	$('.results').show();                              

	    			});
		 $('.search_home').blur(function(e) 
	             	{
	                	$('.results').show();                              

	    			});
		 
		$('.signup_open, .forget_pass, .log_out_open').hide();
		/*   $('.sign').click(function(e) {
			$('.signin').show();
			$('.signup_open').hide();
			$('.forget_pass').hide();
			$('.log_out_open').hide();
		});  */
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
		/* $('.log_out').click(function(e) {
			$('.signup_open').hide();
			$('.signin').hide();
			$('.forget_pass').hide();
			$('.log_out_open').show();
		}); */
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
		
		loadSideBar();
		
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		    ga('create', 'UA-84022418-1', 'auto');
		    ga('send', 'pageview');

	});
</script>
