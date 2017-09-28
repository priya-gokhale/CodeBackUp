function mainMethod() {
//alert("Hello World");
  $.get("/index.pl");
  
}

/* Api Call */
/*
function logIn() {
   var username = $('#login-username').val();
   var password = $('#login-password').val();
   var url = "http://localhost:5183/helloApi.pl/verifyLogin?username="+username+"&password="+password;
   alert("url = " + url);
   var logInStatus = $.get(url);
   alert("loginstatus = " + JSON.stringify(logInStatus.readyState));
 
   if (JSON.stringify(logInStatus.readyState) == 1) {
   		alert("Hi User ! ");
   	   $('#dashboard-nav').css({"display":"block"});
       showUserPage();
   }
}
*/

/* Ajax Call with JSON data */
function logIn() {
   var username = $('#login-username').val();
   var password = $('#login-password').val();
   alert("Hello");
   $.ajax({
                            type: 'POST',
                            url: '../index.pl',
                            data: "action=login",
                            success: function(data) {
                               // var mydata = JSON.parse(data);
                                alert("your ID is: " + data);
                            },
                            error: function() {
                            	alert("did not work");
                            }
                    });
}


function showUserPage() {
	/* Allow user to submit job */
	alert("showUserPage");
	window.location.href="dashboard.html";
}

function UserlogIn() {
   var username = $('#login-username').val();
   var password = $('#login-password').val();
   var params = "action=login&username="+username+"&password="+password;
   alert("params = " + params);
   alert("Hello UserlogIn");
   $.ajax({
                            type: 'POST',
                            url: '../index.pl',
                            data: params,
                            success: function(data) {
                            	//var jsonObj = JSON.parse(data);
                                alert("your result is: " + data.result);
                                if( data.result == "found" ) {
                               	  alert("Success");
                                  $('div#loginResult').text(data.message);
                                  $('#login-html').css({"display": "none"});
                                }
                                else {
                                  alert("Not found ")
                                  $('div#loginResult').text(data.message);
                                }
                            },
                            error: function() {
                            	alert("did not work");
                            }
                    });
}

function Upload() {
   var filePath = $('#myFile').val();
   var params = "action=upload&filePath="+filePath;
   alert(filePath + "Hello Upload");
   $.ajax({
                            type: 'POST',
                            url: '../index.pl',
                            data: params,
                            success: function(data) {
                            	alert(data.result);
                               	//var jsonObj = JSON.parse(data);
                               	
                                if( data.result == "uploaded" ) {
                                  $('div#upload-message').text(data.message);
                                }
                                else {
                                  $('div#upload-message').text(data.message);
                                }
                            },
                            error: function() {
                            	alert("Upload did not work");
                            }
                    });
}