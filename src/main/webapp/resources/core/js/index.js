/**
 * 
 */
var BotU = "HouseOfBots";
var baseIP = "192.168.1.215:8080";
//var baseIP = "localhost";
var baseURLBIG = "http://" + baseIP + "/"+BotU+"/";

var baseURL = "";
var selectedCatId = 0;
var selectedPlatId = 0;
var CAT_TYPE = 'cat';
var PLAT_TYPE = 'plat';
var BOT_QUICK_DESC_LEN = 2000;
var TOTAL_PAGE_NUMBER = 1;
var PAGE_NUMBER = 1;
var PREVIOUS_PAGE_NUMBER = "";
var FIRST_PAGE_NUMBER = 1;
var LAST_PAGE_NUMBER = 1;
var SCROLL_LOAD_HEIGHT = 850;
var MORE_TO_LOAD = true;
var LAYOUT = "HOME";
var CURRENT_USER = null;
var USER_EMAIL = null;
var ON_SIDEBAR_LOAD = null;
var LOADER_REQUESTS = 0;
var SIDEBAR_DISABLED = false;

function reset()
{
	PAGE_NUMBER = 1;
	MORE_TO_LOAD = true;
}

function goHome()
{
	window.location.href= "/"+BotU+"/";
}

function loadCommon()
{
	setupOnClicks();
}

function _homePage()
{
	loadCommon();
	makeLayout("HOME");
	loadData(null, null);
}

function showLoader()
{
	$("#loaderDiv").css("display", "block");
}

function categories(platID, catID)
{
//	console.log("p  "+ platID +" c   " + catID);

//	clearActivePlatCat();
	filterCategories(platID, catID);
	MORE_TO_LOAD = true;
}

function filterCategories(platID, catID)
{
	reset();
	$(window).scroll(bindScroll);
	makeLayout("CAT");
	$("#businessToolsDiv").html($(""));	
	
	var filter = "";
		if(catID != null)
		{
			filter = '?catID=' + catID;
			selectedCatId = catID;
		}
		else if(platID != null)
		{
			filter = '?platID=' + platID;
			selectedPlatId = platID;
		}
	setPagination(makeURL("2/getBotPagesCount")+filter, null);
	$('#categoriesHeading').html(getEmptyBanner());		
		if(catID != null && catID != 0)		
		{
//			ON_SIDEBAR_LOAD = function (){
////				console.log("text_" + CAT_TYPE + catID);
//				$('#categoriesHeading').html(getById("text_" + CAT_TYPE + catID).innerHTML)
//				}
//			;	
		}
		else if(platID != null && platID != 0)		
		{
//			ON_SIDEBAR_LOAD = function (){
////				console.log("text_" + PLAT_TYPE + platID);
//			
//				$('#categoriesHeading').html(getById("text_" + PLAT_TYPE + platID).innerHTML)
//				}
//			;		
		}
		else
			console.log(selectedCatId + " " + selectedPlatId);
	loadBots(platID, catID, false);
		
//	showPageNumbers(div, 'btp_', 1, TOTAL_PAGE_NUMBER);		
}

function loadData(catID, platID)
{
	loadBots(platID, catID, false);
}

function loadSideBar()
{
	loadListDiv('platDiv', makeURL('2/getPlatforms'), PLAT_TYPE);
	loadListDiv('catDiv', makeURL('2/getCategories'), CAT_TYPE);
}

function loadBots(platID, catID, append)
{
	var restURL = "";
		if(catID != null && catID != '')
		{
			selectedCatId = catID;
			restURL = "catID="+catID + "&";
		}
		if(platID != null && platID != '')
		{
			restURL = restURL + "platID="+platID + "&";
			selectedPlatId = platID;
		}
		if(LAYOUT == "HOME")
		{
			loadBotsData('topLotDiv', makeURL('2/getTopOfTheLotBots') +'?count=4&' , append);
			loadBotsData('noteWorthyDiv', makeURL('2/getNoteWorthyBots') +'?count=4&', append);
			loadBotsData('freshLotDiv' ,makeURL('2/getFreshArrivedBots') +'?count=4&', append);
		}
		else if(LAYOUT == "CAT")
		{
			loadBotsData('businessToolsDiv', makeURL('2/getBrowseBots')+'?page=' + PAGE_NUMBER + '&' + restURL, append);
		}
}

function seeMore(div)
{
	var count = 12;
		if(div != 'topLotDiv')
			$("#_topLotDiv").css({ display: "none" });
		if(div != 'noteWorthyDiv')
			$("#_noteWorthyDiv").css({ display: "none" });
		if(div != 'freshLotDiv')
			$("#_freshLotDiv").css({ display: "none" });
	$("#seeMore1").css({ display: "none" });
	$("#seeMore2").css({ display: "none" });
	$("#seeMore3").css({ display: "none" });
	window.scroll(0, 800);
		if(div == 'topLotDiv')
			url = makeURL('2/getTopOfTheLotBots')+'?count=' + count;
		else if(div == 'noteWorthyDiv')
			url = makeURL('2/getNoteWorthyBots')+'?count=' + count;
		else if(div == 'freshLotDiv')
			url = makeURL('2/getFreshArrivedBots')+'?count=' + count;			
	loadBotsData(div, url , false);
}

function setCurrentPage(number)
{
		if(number < 1 || number > TOTAL_PAGE_NUMBER)
			return;
	var li = getById('btp_' + number);
	li.setAttribute("class", "active");
	removeClassAttribute('btp_' + PREVIOUS_PAGE_NUMBER);
	PAGE_NUMBER = number;	
	PREVIOUS_PAGE_NUMBER = PAGE_NUMBER;
	updateReviews(number);
	/*loadBots(selectedPlatId, selectedCatId);	*/
}

function showLastPageNumbers()
{
	var div = "#reviewBotPagination";
	var start = FIRST_PAGE_NUMBER - 10;
	var end = start + 10;
		if(new Number(start) >= 1)		
			showPageNumbers(div, 'btp_', start, end);
		
}

function showNextPageNumbers()
{
	var div = "#reviewBotPagination";
	var start = FIRST_PAGE_NUMBER + 10;
	var end = start + 10;
	showPageNumbers(div, 'btp_', start, end);
}

function setPagination(url, func)
{
	var okFunc = function(response)
					{
						TOTAL_PAGE_NUMBER = new Number(response);
							if(func != null)
								func();
								
					};
	performAJAX(url, okFunc);
}

function showPageNumbers(div, prefix, start, end)
{	
	var maxPageNumberToShow = 10;
		if((end - start) >= maxPageNumberToShow)
			maxPageNumberToShow = start + (maxPageNumberToShow-1);
		else
			maxPageNumberToShow = end;
		if(maxPageNumberToShow > TOTAL_PAGE_NUMBER)
			maxPageNumberToShow = TOTAL_PAGE_NUMBER;
		if(start > maxPageNumberToShow)
			return;
	$(div).html('');
	$(div).append("<li id ='pageLeft' ><a onclick='javascript:showLastPageNumbers()'>&laquo;</a></li>");
		for (i = start; i <= maxPageNumberToShow ; i++)	
			$(div).append("<li id ='" + prefix + i +"'><a onclick='javascript:setCurrentPage(" + i + ")'>" + i + "</a></li>");	
	$(div).append("<li id ='pageRight' ><a onclick='javascript:showNextPageNumbers()' >&raquo</a></li>");
	
	FIRST_PAGE_NUMBER = start;
	LAST_PAGE_NUMBER = maxPageNumberToShow;	
}

function performAJAX(urlSuffix, func)
{
	performAJAXCore("GET", null, null, urlSuffix, func,function(e){errorLog('Error',e['responseText']);})
}

function performAJAXCore(type, data, contentType, urlSuffix, func, errorFunc)
{
		if(type.toUpperCase() == 'POST')
		{
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
		}
//	requestLoader();
    $.ajax(
		{
	        'type'			: type,
	        'url' 			: baseURL + urlSuffix,
	        'data' 			: data,
        	'contentType'	: contentType,
	        'success' 		: function (data) 
						        {
							            try
							            {
							            	func(data);
							            }
							            catch(e)
							            {
							            	console.log(e);
							            }
//						            releaseLoader();
						        },
			'error' 		: function (data) 
						        {
										try
							            {
											errorFunc(data);
							            }
							            catch(e)
							            {
							            	console.log(e);
							            }
//						            releaseLoader();
						        },
	        beforeSend		: function(xhr) 
	        					{	        						
	        							if(type.toUpperCase() == 'POST')
        									xhr.setRequestHeader(header, token);					        
        						}
		}
	);
}

function releaseLoader()
{
		if(LOADER_REQUESTS > 0)
			LOADER_REQUESTS--;
//		if(LOADER_REQUESTS == 0)
//			$("#loaderDiv").css("display", "none");
	//console.log(LOADER_REQUESTS+" --");
	
}

function requestLoader()
{
	LOADER_REQUESTS++;
//	$("#loaderDiv").css("display", "block");
	//console.log(LOADER_REQUESTS+" ++");
}

function loadBotsData(div, restURL, append) 
{
	div = '#'+div+'';
		if(!append)		
			$(div).html('');	
	var func = function(data) 
				{
					$(data).each(function(i,val)
									 {
						     			var botDiv = getBotsDiv(val);
						     			$(div).append($(botDiv));
						 			}
							 );
				};
	performAJAX(restURL, func);		
}

function getPlatformsIcons(platforms)
{
	var platIcons = "";
	var platUrl;
	var urlClose;
		
	
	$.each(platforms, function(k, v)
			{
				platUrl = "";
				urlClose = ""
					if(v.url != null && v.url != '')
					{
						platUrl = "<a href = '" + v.url + "' target = '_blank'>";
						urlClose = "</a>";
					}
					platIcons += ("<span class='fb_button' style='position:relative'>" +
							platUrl +
						
											"<img src='http://" +
														baseIP + 
														"/images/platforms/g/" + 
															v.platformName.toLowerCase()+".png'>" + 
										urlClose +
										"<div class='fb_info'><p>Download this Bot on "+v.platformName+"</p></div></span>");
			}
		);
	return platIcons;
}

function getBotImageURL(botView)
{
	return "http://" +
	baseIP + "/images/bots/" + botView['id'] + "/" + botView['id'] + "." + botView['imageExt'];
}

function getBotsDiv(botView)
{
	var href = baseURL + "showBot/" + botView['id'];
	var categories = "";
	var platforms = "";
	var platIcons = "";
	var seeMore = "";
	
		if(getString(botView['description']).length > BOT_QUICK_DESC_LEN)		
			seeMore = "...<a href = ''" + botView.id + "'>See more</a>";		
		try
		{
			categories = botView['categoriesNames'].toString();
		}
		catch(e)
		{			
		}
		try
		{
			platforms = botView['platformsNames'].toString();
			platIcons = getPlatformsIcons(botView['platformMappings']);
			
		}
		catch(e)
		{			
		}
	var div = 
		"<div class='mid_block wow zoomIn'>" + 
		"<a onclick='showLoader();' href ='"+ makeURL('description/')+ makePathURL(botView.id, botView.title) + "'> "+
	"<div class='img_block text-center'>" + 
		"<img src='"+getBotImageURL(botView)+"' class='v_top  border_img'" +
					"height='112' width='112'>" +
					
			"<i	class='fa fa-info margin_left color_green font20 cat_info_hover' aria-hidden='true'>" + 
			"</i>" + 
			"</a>" +
		"<div class='cat_info'>" + 
			"<p class='text-info bold'> " + getString(botView['tagline']) +
				seeMore +
			"</p>" +			
			"<p>" + 
				"<span class='bold'> CATEGORIES :</span>" + getString(categories).split(',').join(', ')  + 
			"</p>" + 
			"<p>" + 
				"<span class='bold'> GET THIS BOT ON :</span>" +  getString(platforms).split(',').join(', ') + 
			"</p>" + 
		"</div>" + 
	"</div>" + 
	"<div class='txt_block'>" + 
	"<a onclick='showLoader();' href = "+makeURL('description/')+ makePathURL(botView.id, botView.title) + "> "+
		"<div class='txt_cap'>" + getString(botView['title']) + "</div>" + 
	"</a>" +
		"<div class='res_center'>" + 			
		platIcons +
		"</div>" + 
	"</div>" + 

"</div>";
	return div;
}

function loadListDiv(div, restURL, type) 
{
	div = '#'+div+'';
	var func = function(data) 
	 			{
		 			$(data).each(function(i, val)
								 {						 		
							 		var title;
							 		var id;
					     			$.each(val,function(k,v)
					    						{
							           					if(k == 'title')
							           						title = v;
							           					else if(k == 'id')
							           						id = v;
						 						}
					     					);
					     			var botDiv = getListDiv(title, id, type);
					     			$(div).append($(botDiv));
					 			}
	 				);		 

	 					if(type == CAT_TYPE)
 						{
//	 						console.log("----------");
	 						makeActiveSideBar();
	 							if(ON_SIDEBAR_LOAD != null) 								
	 								ON_SIDEBAR_LOAD();	 							
//	 						console.log("-+++++++++++++++++++-");
	 					}
//		 			$("#_centerDiv").css("min-height",($("#_sidebar").outerHeight)  + 20);
		 			/*console.log(($("#mainContent").outerHeight) );
		 			console.log((($("#_sidebar").outerHeight) ) + 20);
		 			$("#mainContent").css("min-height",(($("#_sidebar").outerHeight) ) + 20);
		 			console.log(($("#mainContent").outerHeight) );*/
	 			};
	performAJAX(restURL, func);
}

function makeActiveSideBar()
{
		/*try
		{
				if(selectedCatId != null && selectedCatId != 0)
					selectCat(selectedCatId);
				else if(selectedPlatId != null && selectedPlatId != 0)
					selectPlat(selectedPlatId);
		}
		catch(e)
		{
			console.log(e);
		}*/
}

function selectCat(id)
{
	clearActivePlatCat();
	console.log(CAT_TYPE + id);
	var li = getById(CAT_TYPE + id);
	li.setAttribute("class", "active");
	selectedCatId = id;
}

function selectPlat(id)
{
	clearActivePlatCat();
	console.log(PLAT_TYPE + id);
	var li = getById(PLAT_TYPE + id);
	li.setAttribute("class", "active");
	selectedPlatId = id;
}

function clearActivePlatCat()
{
	/*removeClassAttribute(CAT_TYPE + selectedCatId);
	removeClassAttribute(PLAT_TYPE + selectedPlatId);
	selectedPlatId = 0;
	selectedCatId = 0;*/
}

function removeClassAttribute(id)
{
	var selectedLi = getById(id);
		if(selectedLi != null)
			selectedLi.removeAttribute("class");
}

function makeSidebarDisbaled()
{
	showLoader();
	
}

function getListDiv(title, id, type)
{	
	var url;
	var selectClass = "";
		if(type == CAT_TYPE)
		{	
				if(selectedCatId == id)
				{
					selectClass = "class = 'active'";
					$('#categoriesHeading').html(title);
				}
		}
		else if(type == PLAT_TYPE)
		{	
				if(selectedPlatId == id)
				{
					selectClass = "class = 'active'";
					$('#categoriesHeading').html(title);
				}
		}
	
		if(type == CAT_TYPE)
			url = makeURL("category/")+ makePathURL(id, title);
		else if(type == PLAT_TYPE)
			url = makeURL("platform/")+ makePathURL(id, title);	
	var div = 
			"<li name = 'liname' id='"+type+id+"' " +
			selectClass +
			">" +
				"<a " +
				"href='" + url + "' " +
				"onclick='makeSidebarDisbaled();'>" +
					"<span id = 'text_" + type + id + "'>" + title + "</span>" +
				"</a>" +
			"</li>";
	return div;
}

function subscribe()
{
	var email = getById("subscribeEmail").value;
	disable('subscribe_b', true);
	var okFunc = function(response)
				{			
					successLog('Subscribed Successfully', response['msg']);
					clearInput('subscribeEmail');
					disable('subscribe_b', false);
				};
	var errorFunc = function(response)
				{
					errorLog('Subscribe', response.responseJSON['error']);
					clearInput('subscribeEmail');	
					disable('subscribe_b', false);
				};
	var data = {
		'email' : email	
	};
	performAJAXCore('POST', JSON.stringify(data), 'application/json; charset=utf-8', makeURL('subscribe'), okFunc, errorFunc);
}

function performQuickBotSearch(value)
{
	var select = '#searchList';
	$(select).html('');
	var liID = "li_searchList_1";
		if(value == null || value.length < 3)
			return;
	var func = function(response)
				{					
					$.each(response, function(k,bot)
								{
									$(select).append("<li " +
											liID +
											"><a href='" + makeURL("description/"+makePathURL(bot.id,bot.title)) + "'>"+
											"<i class='fa fa-search color_green'></i> "+
											bot.title+"</a></li>");
									liID = "";
								}
							);
				};
	performAJAX("2/searchBot?value=" + value, func);
}

function searchDownArrow()
{
	$('#searchList').focus();
}

function makeLayout(layout)
{
	/*_clearMainContent();
		if(layout == "HOME")		
			makeLayoutHome();
		else if(layout == "CAT")		
			makeLayoutCat();
		else if(layout == "SUBMIT")		
			makeLayoutSubmit();	
		else if(layout == "DESCRIPTION")		
				makeLayoutDescription();	*/	
	LAYOUT = layout;
}

function makeLayoutHome()
{
	$("#_homepage").css({ display: "block" });
	$("#mct_search").css({ display: "block" });
	$("#_hp_bottom_strip").css({ display: "block" });
}

function makeLayoutCat()
{
	$("#_categories").css({ display: "block" });
	$("#mct_search").css({ display: "block" });
	$("#_cat_bottom_strip").css({ display: "block" });
}

function makeLayoutSubmit()
{
	$("#_submit").css({ display: "block" });
	$("#mct_submit").css({ display: "block" });
	$("#_hp_bottom_strip").css({ display: "block" });
}

function makeLayoutDescription()
{
	$("#mct_description").css({ display: "block" });
	$("#_description").css({ display: "block" });
	$("#_cat_bottom_strip").css({ display: "block" });
}

function _clearMainContent()
{
	clearMainContentTop();
	clearMainContent();
	clearMainContentBottom();
}

function clearMainContentTop()
{
	$("#mct_search").css({ display: "none" });
	$("#mct_submit").css({ display: "none" });
	$("#mct_description").css({ display: "none" });
}

function clearMainContent()
{
	$("#_submit").css({ display: "none" });
	$("#_homepage").css({ display: "none" });
	$("#_description").css({ display: "none" });
	$("#_categories").css({ display: "none" });
}

function clearMainContentBottom()
{
	$("#_cat_bottom_strip").css({ display: "none" });
	$("#_hp_bottom_strip").css({ display: "none" });
}

function bindScroll()
{
	   if(($(window).scrollTop() + $(window).height() > $(document).height() - SCROLL_LOAD_HEIGHT) && MORE_TO_LOAD) 
	   {
		   $(window).unbind('scroll');
		   window.scroll(0, $(document).height() - (SCROLL_LOAD_HEIGHT + 480));	  
		   loadMore();
		   $(window).bind('scroll', bindScroll);
	   }
}

function loadMore()
{   
		if(LAYOUT == "CAT")		
			loadMoreCategories();		
		else if(LAYOUT == "SHOUTOUT")		
			loadMoreShoutouts();
		else
			MORE_TO_LOAD = false;
}

function loadMoreCategories()
{
		if(TOTAL_PAGE_NUMBER > PAGE_NUMBER)
		{
			PAGE_NUMBER = PAGE_NUMBER + 1;			
			loadBots(selectedPlatId, selectedCatId, true);
		}
		if(TOTAL_PAGE_NUMBER <= PAGE_NUMBER)
			MORE_TO_LOAD = false;
}

function loadMoreShoutouts()
{
		if(TOTAL_PAGE_NUMBER > PAGE_NUMBER)
		{
			PAGE_NUMBER = PAGE_NUMBER + 1;			
			so_loadbots(PAGE_NUMBER);
		}
		if(TOTAL_PAGE_NUMBER <= PAGE_NUMBER)
			MORE_TO_LOAD = false;
}

function clearInput(id)
{
	getById(id).value = "";
}

function getById(id)
{
	return document.getElementById(id);
}

function getByName(name)
{
	return document.getElementsByName(name);
}

function getString(from)
{
	return from == null ? "" : from;			
}
 
function makeURL(suffix)
{	 
	 return baseURLBIG + suffix;
}

function getSpaceFree(value)
{
	return value.split(' ').join('');
}

function makePathURL(id, value)
{
	return id + "-" + getSpaceFree(value);
}

function getEmptyBanner()
{
	var div = "<div class='font20 bold text-center pad_top_25'>Data	not found</div>";	
	return div;
}

function validateName(name, minLength, maxLength, error) 
{
    error = "";
    var illegalChars = /\W\s/; // allow letters, numbers, and underscores 
	    if (name == "") 
	    {
	        error = "Please enter a value";     
	    }
	    else if ((name.length < minLength) || (name.length > maxLength)) 
	    {        
	        error = "Enter characters between "+minLength+"-" + maxLength;
	 
	    } 
	    else if (illegalChars.test(name)) 
	    {
	        error = "Illegal characters are not allowed";
	    }
    return error;
}

function invalidURL(textval) 
{
    var urlregex = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
    return urlregex.test(textval);
}

function invalidEmail(mail)
{
	return ( /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail));
}