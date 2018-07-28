function performLogin() {
	var data = new FormData();
	var username = $("#uname").val();
	var password = $("#password").val();
	var login = {
		"username" : username,
		"password" : password
	}
	sendData(JSON.stringify(login));

}
function sendData(data) {
	$.ajax({
		url : 'http://localhost:8082/v1/user/login',
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