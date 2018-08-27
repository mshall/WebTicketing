function getUsersByStatus(userStatus) {
	$.ajax({
		url : link+':8082/v1/user/status/'+userStatus,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetUserByStatus(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processGetUserByStatus(response) {
	console.log('users.processGetUserByStatus -> Response: '
			+ JSON.stringify(response));
	var userTable = $('#allUsers');

	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].userId + "</td><td>"
				+ response.results[i].username + "</td>" + "<td>"
				+ response.results[i].email + "</td><td>"
				+ response.results[i].user_type + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='editUser("
				+ response.results[i].userId
				+ ")'>Edit</button>"
			//	+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deleteTechnical("
			//	+ response.results[i].userId
			//	+")'>Delete</button>"
				+ "</td></tr>";
	}
	output += "";
	userTable.html(output);
	$('#usersTable').DataTable();
}

//-------------------------------------------------------------------------------------
//---------------------------------------- navigate to updateUser
//-------------------------------------------------------------------------------------
function editUser(userId){
	var editUser = "editUser.jsp?userId=" + userId;
	window.location.replace(editUser);
		
}

//-------------------------------------------------------------------------------------
//---------------------------------------- get user by id
//-------------------------------------------------------------------------------------

function getUserById(userId) {
	$.ajax({
		url : link+':8082/v1/user/id/' + userId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetUserByResponse(response);
		},
      error: function(data, textStatus, jqXHR) {
          handleAjaxError(data, textStatus, jqXHR);
      }
	});
}

function processGetUserByResponse(response) {
	console.log("users.processGetUserByResponse:-> "+response);
	
	$("#userId").val(response.results.userId);
	$("#email").val(response.results.email);
	$("#username").val(response.results.username);
	$("#password").val(response.results.password);
	
}

//-------------------------------------------------------------------------------------
//---------------------------------------- update user
//-------------------------------------------------------------------------------------
function updateUser(){
	var data = new FormData();
	userId=$("#userId").val();
	password=$("#password").val();

	var user={
			"userId":userId,
			"password":password,
			"status":0,
	}
	sendDataSaveUser(JSON.stringify(user));
}

function sendDataSaveUser(data, url) {
	console.log(data);
	$.ajax({
		url : link+':8082/v1/user/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processSaveUserResponse(response);
		},
      error: function(data, textStatus, jqXHR) {
          handleAjaxError(data, textStatus, jqXHR);
      }
	});
}

function processSaveUserResponse(response){
	console.log("users.processSaveUserResponse-> "+response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200||code == 0) {
		window.history.go(-1);
	} else {
		$("#errorUpdate").html(message);
	}
}
