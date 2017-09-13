var secureFunc;

function getCurrentUser()
{
	return CURRENT_USER;
}

function loadPageUserOp()
{		
	
}

function setCurrentUser(user)
{
		if(user != null)
		{
			$('#user').html(user);		
			showOnSign('log_out_open');
		}
		else
		{
			$('#user').html('');		
			showOnSign('signin');			
		}
	CURRENT_USER = user;
}

function setupOnClicks()
{	
	$('.cross').click(function(e) 
						{
							$('.signup_open').hide();
							$('.signin').hide();
							$('.forget_pass').hide();
							$('.log_out_open').hide(); 															
						}
					);
}
function logout()
{
	var okFunc = function(response)
					{
						$('.log_out_open').hide();
						setCurrentUser(null);
//						goHome();
						successLog('Logout', response['msg']);
					};	
	var errorFunc = function(response)
					{
						errorLog('Logout', response['error']);					
					};
	performAJAXCore('POST', null, null, makeURL('3/logout'), okFunc, errorFunc);	
	
}

function login(number)
{	
	var prefix = "sign" + number + "_"; 
	
	var email = getById(prefix + 'email').value;
	var password = getById(prefix + 'password').value;
	var rememberMe = $('#'+prefix + 'rememberMe').is(':checked');
	clearErrorSignIn(number);
	disable(prefix + "submit", true);	
	var okFunc = function(response)
					{
							if(number == 1)
							{
								$('.success_msg_pop').show();
								$('.signup_open').hide();
								$('.signin').hide();
								$('.forget_pass').hide();
								$('.log_out_open').show();
							}
							else
							{
								$('#shoutouts_pop').modal('hide');
								/*$('body').removeClass('modal-open');
								$('.modal-backdrop').remove();*/								
									if(secureFunc != null)
									{
										secureFunc();
										secureFunc = null;						
									}
							}
						setCurrentUser(response);
						clearInputSignIn(number);						
						disable(prefix + "submit", false);
					};					
	var errorFunc = function(response)
					{
						$('#user').html('');	
						showOnSign('signin');
						getById(prefix + 'email').textContent=response['responseText'];						
						disable(prefix + "submit", false);
						getById(prefix + 'password').value = "";
						showServerSideError(response['responseJSON'], "err_" + prefix );
						$("#" + prefix + 'email').removeClass( "bordr_error");
					};
	_login(email, password, rememberMe, okFunc, errorFunc);
}

function register(number)
{	
	var prefix = "reg" + number + "_"; 
	var username = getById(prefix + "username").value;
	var email = getById(prefix + "email").value;
	var password = getById(prefix + "password").value;
	var matchingPassword = getById(prefix + "matchingPassword").value;
	clearErrorReg(number);	
	
		if(password != matchingPassword)
		{
			getById("err_" + prefix + "matchingPassword").textContent = "Passwords do not match";
			var id = prefix + "matchingPassword";
			$("#" + id.replace("err_","")).addClass( "bordr_error");	
			clearInput(prefix + "matchingPassword");
			return;
		}	
	
	disable(prefix + "submit", true);
	
	var okFunc = function(response)
					{	
						disable(prefix + "submit", false);		
							if(number == 1)
								$('.signup_open').hide();
							else if(number == 2)
								$('.signup_open_pop').hide();							
						successLog('Register', response['msg']);
						clearInput(prefix + "username");
						clearInput(prefix + "email");
						clearInput(prefix + "password");
						clearInput(prefix + "matchingPassword");
						
					};
	var errorFunc = function(response)
					{
						disable(prefix + "submit", false);
						showServerSideError(response['responseJSON'], "err_" + prefix );						
					};
	_register(username, email, password, okFunc, errorFunc)
}

function forgotPassword(number)
{
	var prefix = "forgot" + number + "_"; 
	
	var email = getById(prefix + "email").value;
	getById(prefix + "email").textContent = "";	
	disable(prefix + "submit", true);
	
	var okFunc = function(response)
					{
							if(number == 1)
								$('.forget_pass').hide();
							else if(number == 2)
								$('.forget_pass_pop').hide();						
						clearInput(prefix + "email");
						successLog('Forgot Password', response['msg']);
						disable(prefix + "submit", false);
					};
	var errorFunc = function(response)
					{		
						clearForgot(number);
						showServerSideError(response['responseJSON'], "err_" + prefix);						
						disable(prefix + "submit", false);
					};	
	_forgotPassword(email, okFunc, errorFunc)
}

function _login(email, password, rememberMe, okFunc, errorFunc)
{
	var data = {
		'email' 		: email,
		'password' 		: password
	};
	performAJAXCore('POST', JSON.stringify(data), 'application/json; charset=utf-8', makeURL('3/login?rememberMe=')+rememberMe, okFunc, errorFunc);
}

function _register(username, email, password, okFunc, errorFunc)
{		
	var data = {
			'email' 	: email,
			'password'	: password,
			'username'	: username
			};
	performAJAXCore('POST', JSON.stringify(data), 'application/json; charset=utf-8', makeURL('3/register'), okFunc, errorFunc);
}

function _forgotPassword(email, okFunc, errorFunc)
{		
	var data = {
			'email' : email
			};
	performAJAXCore('POST', JSON.stringify(data), 'application/json; charset=utf-8', makeURL('3/forgotPassword'), okFunc, errorFunc);
}


function clearForgot(number)
{
	var prefix = 'forgot' + number + "_";
	
	getById(prefix + "email").value="";
	getById("err_" + prefix + 'email').textContent = "";
	$('#' + prefix + 'email').removeClass( "bordr_error");
}

function clearSignIn(number)
{
	clearInputSignIn(number);
	clearErrorSignIn(number);
}

function clearInputSignIn(number)
{
	var prefix = 'sign' + number + "_";
	
	getById(prefix + 'email').value = "";
	getById(prefix + 'password').value = "";
	$('#'+prefix + 'rememberMe').prop('checked', false);
}

function clearErrorClassSign(number)
{
	var prefix = 'sign' + number + "_";
	
	$('#' + prefix + 'email').removeClass( "bordr_error");
	$('#' + prefix + 'password').removeClass( "bordr_error");
}

function clearErrorSignIn(number)
{
	getById('err_sign' + number + '_email').textContent = "";
	
	clearErrorClassSign(number);
}

function clearReg(number)
{
	clearInputReg(number);
	clearErrorReg(number);
}

function clearInputReg(number)
{
	var prefix = 'reg' + number + "_";
	
	getById(prefix + 'email').value = "";
	getById(prefix + 'password').value = "";
	getById(prefix + 'username').value = "";
	getById(prefix + 'matchingPassword').value = "";
}

function clearErrorClassReg(number)
{
	var prefix = 'reg' + number + "_";
	
	$('#' + prefix + 'email').removeClass( "bordr_error");
	$('#' + prefix + 'password').removeClass( "bordr_error");
	$('#' + prefix + 'username').removeClass( "bordr_error");
	$('#' + prefix + 'matchingPassword').removeClass( "bordr_error");
}

function clearErrorReg(number)
{
	var prefix = 'err_reg' + number + "_";
	
	getById(prefix + 'email').textContent = "";
	getById(prefix + 'password').textContent = "";
	getById(prefix + 'username').textContent = "";
	getById(prefix + 'matchingPassword').textContent = "";	

	clearErrorClassReg(number);
}

function signUpShow1()
{
	$('.signup_open').show();
	$('.signin').hide();
	$('.forget_pass').hide();
	$('.log_out_open').hide();
}


function forgetShow1()
{
	$('.signup_open').hide();
	$('.signin').hide();
	$('.forget_pass').show();
	$('.log_out_open').hide();
}

function secureAccess(url)
{
	secureFunc = function(){url();};
	var okFunc = function(response)
					{
						secureFunc();
						secureFunc = null;
					};
	var errorFunc = function(response)
					{
						showOnSign('signin');
						loginPopUp();			
					};
//	okFunc();
	userLoggedIn(okFunc, errorFunc);	
}

function _shoutout()
{
	showLoader();
	secureFunc = null;
	window.location.href= makeURL("shoutouts");
}

function _submit()
{
	showLoader();
	makeLayout('SUBMIT');
	secureFunc = null;
	loadSubmitPage();
}

function loginPopUp()
{
	clearSignIn(2);
	clearReg(2);
	clearForgot(2);
//	$('#loginPopUp').click();
	$('#shoutouts_pop').modal('show');
//	$(".login2").show();
}

function userLoggedIn(okFunc, errorFunc)
{
	var user = getCurrentUser();
		if(user == null)
			errorFunc();
		else	
			okFunc(user);
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        alert(c);
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        	if (c.indexOf(nameEQ) == 0) 
        		return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function successLog(title, data)
{
	getById('successPop_title').textContent = title;
	getById('successPop_text').textContent = data;
	$("#success_msg_pop").modal('show');
}

function errorLog(title, data)
{
	getById('errorPop_title').innerHTML = title
	getById('errorPop_text').innerHTML = data;
	$("#error_msg_pop").modal('show');
}

function showServerSideError(data, elementPrefix)
{
	$.each(data,
			function(k, v)
				{
					var id = elementPrefix + k;
					getById(id).textContent = v;
					$("#" + id.replace("err_","")).addClass( "bordr_error");
				}
			);		
}

function showOnSign(id)
{
	$( ".sign").unbind( "click" );
	
		if(id == "log_out_open" )
		{
			$('.sign').click(function(e) {
				$('.log_out_open').toggle(); 
				$('.signup_open').hide();
				$('.forget_pass').hide();
				$('.signin').hide();
				
				clearSignIn(1);
				clearReg(1);
				clearForgot(1);	
		    });
		}
		else
		{
			$('.sign').click(function(e) {	
		        $('.signin').toggle();
				$('.signup_open').hide();
				$('.forget_pass').hide();
				$('.log_out_open').hide(); 
				
				clearSignIn(1);
				clearReg(1);
				clearForgot(1);	
		    });
		}
}

function disable(button, value)
{
	getById(button).disabled = value;	
}

function getCheckedBoxes(chkboxName) 
{
	  var checkboxes = getByName(chkboxName);
	  var checkboxesChecked = [];
		  for (var i=0; i<checkboxes.length; i++) 
		  {
			     if (checkboxes[i].checked)		     
			        checkboxesChecked.push(checkboxes[i].value);		     
		  }
	  return checkboxesChecked.length > 0 ? checkboxesChecked : null;
}