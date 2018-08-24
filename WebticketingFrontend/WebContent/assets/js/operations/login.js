var loginCount = 0;
var userTry='';
function performLogin() {
	loginCount++;
	if (loginCount < 4) {
		var data = new FormData();
		var username = $("#uname").val();
		var password = $("#password").val();
		var login = {
			"username" : username,
			"password" : password
		}
		sendData(JSON.stringify(login));
	}else {
		loginCount=0;
		blockUser();
	}
}
function sendData(data) {
	$.ajax({
		url : link + ':8082/v1/user/login',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processResponse(response);
		}
	});
}

function processResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");

	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
		var userId = results.userId;
		var username = results.username;
		var email = results.email;
		var userType = results.userType;

		$.session.set('userId', userId);
		$.session.set('username', username);
		$.session.set('email', email);
		$.session.set('userType', userType);
		Cookies.set('user', username);
		if (userType === 0) {// This is a root admin
			window.location.replace("AdminHome.jsp");
		} else if (userType === 1) { // This is an admin
			window.location.replace("AdminHome.jsp");
		} else if (userType === 2) {// This is a technician
			window.location.replace("TechnicalHome.jsp");
		}
	} else {
		formMessage.css("color", "red");
	}

}
// ---------------------------------------------------------------------------------------------------
// ---------------------------- get user by user name
// ---------------------------------------------------------------------------------------------------
function getUserByUserName(userName) {
	$.ajax({
		url : link + ':8082/v1/user/' + userName,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			return response.results;
		}
	});
}

// ---------------------------------------------------------------------------------------------------
// ---------------------------- change password
// ---------------------------------------------------------------------------------------------------

function changePassword() {

	var data = new FormData();
	var username = $("#uname").val();
	var password = $("#newpsw").val();

	var results = getUserByUserName(username);
	var userId = results.userId;

	var user = {
		"userId" : userId,
		"username" : username,
		"password" : password
	}
	sendDataChangePassword(JSON.stringify(user));

}
function sendDataChangePassword(data) {
	$.ajax({
		url : link + ':8082/v1/user/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processChangePasswordResponse(response);
		}
	});
}

function processChangePasswordResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");

	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
		window.location.replace("AdminHome.jsp");

	} else {
		formMessage.css("color", "red");
	}

}

//---------------------------------------------------------------------------------------------------
//---------------------------- block user
//---------------------------------------------------------------------------------------------------

function blockUser() {

	var data = new FormData();
	var username = $("#uname").val();
	var results = getUserByUserName(username);
	var userId = results.userId;
	var user = {
		"userId" : userId,
		"username" : username,
		"status":1
	}
	sendDataBlockUser(JSON.stringify(user));

}
function sendDataBlockUser(data) {
	$.ajax({
		url : link + ':8082/v1/user/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processChangeBlockUser(response);
		}
	});
}

function processChangeBlockUser(response) {
	console.log(response);
	var formMessage = $("#form-message");

	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);
	if (code == 200) {
		formMessage.text("User is blocked, please contact with admin");
	} else {
		formMessage.css("color", "red");
	}

}
