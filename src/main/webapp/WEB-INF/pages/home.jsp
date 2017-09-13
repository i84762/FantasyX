<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<head>
<title> VF | house of bots</title>
<script src="http://192.168.1.215:8080/HouseOfBots/resources/core/js/home.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		h_loadPage();
	});
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="_userLogin.jsp"%>
	<div class="wrapper">
		<%-- <jsp:include page="sidebar.jsp" /> --%>
		<div class="content-wrapper" id="_centerDiv">
			<div id="mainContentTop">
			<%-- 	<jsp:include page="mct_search.jsp" /> --%>
			</div>
			<!-- Top Content Ends -->
			<!-- Main content -->
			<section class="content">
				<div id="mainContent">
					<div id="_homepage" style="min-height: 1000px">
						<div class="box_center">
							<div id="_topLotDiv">

								<div class="pull-left">
									<h2 class="h3_cap padd_left6">Top of the Lot</h2>
								</div>
								<div class="pull-right pad_top_25 text-right butt_padd"
									id="seeMore1">
									<form action="topOfTheLot">
										<button class="btn button_more" onclick="showLoader();">See More</button>
									</form>
								</div>
								<div class="clearfix"></div>
								<div id="topLotDiv" class="row"></div>
							</div>
							<!--noteworthly -->
							<div id="_noteWorthyDiv">
								<div class="padd_top40">
									<div class="pull-left">
										<h2 class="h3_cap padd_left6">Noteworthy</h2>
									</div>
									<div class="pull-right pad_top_25 text-right butt_padd"
										id="seeMore2">
										<form action="noteworthy">
											<button class="btn button_more" onclick="showLoader();">See More</button>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<div id="noteWorthyDiv" class="row"></div>
							</div>
							<!--fresh arrivals -->
							<div id="_freshLotDiv">
								<div class="padd_top40">
									<div class="pull-left">
										<h2 class="h3_cap padd_left6">Fresh Arrivals</h2>
									</div>
									<div class="pull-right pad_top_25 text-right butt_padd"
										id="seeMore3">
										<form action="freshArrivals">
											<button class="btn button_more" onclick="showLoader();">See More</button>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<div id="freshLotDiv" class="row"></div>
							</div>

						</div>
						<!-- <div class="row">
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp.gif" class="img-responsive">
							</div>
							<div class="col-md-6 pad_top_25">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/comp_int.gif" class="img-responsive">
							</div>
						</div> -->
						<div class="row pad_top_25">
							<div class="col-sm-12">
								<h2 class="h3_cap">Bot Demo Screens</h2>
								<!-- <div class="color_dg">
									<span class="font16">FX Buizee Bot</span>
									<a href="#" class="padd_left20 color_dg">Next Bot <img src="img/arrow.png"></a> 
								</div> -->
							</div>
						</div>
						<div id="myCarousel" class="carousel slide carousel_custom"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators carousel-indicators_custom">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<div class="font16 margin-bottom">FX Buizee Bot</div>
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bott_scrn.png">
								</div>

								<div class="item">
									<div class="font16 margin-bottom">Next FX Buizee Bot</div>
									<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bott_scrn.png">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control carousel-control_custom"
								href="#myCarousel" role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left text-gray font16"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="right carousel-control carousel-control_custom"
								href="#myCarousel" role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right text-gray font16"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
						<!-- <div class="container">
							<div class="col-lg-12 text-center">
								<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/bott_scrn.png" class="img-responsive">
							</div>
						</div> -->
						<div class="col-sm-2">
							<div class="col-sm-12 ads_min">
								<!--<img src="http://192.168.1.215:8080/HouseOfBots/resources/img/ads.gif"> -->
							</div>
						</div>
					</div>
				</div>
				<!-- MAIN Content Ends -->
			</section>
			<div class="clearfix"></div>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>
	<div class="container-fluid bott_strp" id="_hp_bottom_strip"></div>
</body>
<jsp:include page="footer.jsp" />
</html>