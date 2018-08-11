function manageTechnicians() {
	$.ajax({
		url : 'http://localhost:8082/v1/user/all/technician',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTechnicians(response);
		}
	});
}
function processAllTechnicians(response) {
	console.log('technician.processAllTechnicians -> Response: '
			+ JSON.stringify(response));
	var technicalTable = $('#allTechnicals');

	var output = "<div ><table id='techniciansTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Technician id</th>"
			+ "<th>username</th>"
			+ "<th>email</th>" + "<th></th></tr></thead><tbody>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].userId + "</td><td>"
				+ response.results[i].username + "</td>" + "<td>"
				+ response.results[i].email + "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='navigateToAddTechnical("
				+ response.results[i].userId
				+ ")'>Edit</button>"
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger'>Delete</button>"
				+ "</td></tr>";
	}
	output += "</tbody></div>";

	technicalTable.html(output);
	$('#techniciansTable').DataTable();
}
//-------------------------------------------------------------------------------------
//---------------------------------------- navigate to add/edit techical
//-------------------------------------------------------------------------------------
function navigateToAddTechnical(technicianId){
	var edittechnical = "addTechnical.jsp?technicianId=" + technicianId;
	window.location.replace(edittechnical);
		
}
//-------------------------------------------------------------------------------------
//---------------------------------------- get technician by id
//-------------------------------------------------------------------------------------

function getTechnicianById(technicianId) {
	$.ajax({
		url : 'http://localhost:8082/v1/user/id/' + technicianId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetTechnicianByResponse(response);
		}
	});
}

function processGetTechnicianByResponse(response) {
	console.log("technicain.processGetTechnicianByResponse:-> "+response);
	
	$("#userId").val(response.results.userId);
	$("#name").val(response.results.name);
	$("#phone1").val(response.results.phone1);
	$("#phone2").val(response.results.phone2);
	$("#email").val(response.results.email);
	$("#city").val(response.results.city);
	$("#username").val(response.results.username);
	$("#password").val(response.results.password);
	$("#status").val(response.results.status);
	var userType=response.results.userType;
}
//-------------------------------------------------------------------------------------
//---------------------------------------- ADd technician
//-------------------------------------------------------------------------------------
function addTechnician(){
	var data = new FormData();
	userId=$("#userId").val();
	name=$("#name").val();
	phone1=$("#phone1").val();
	phone2=$("#phone2").val();
	email=$("#email").val();
	city=$("#city").val();
	username=$("#username").val();
	password=$("#password").val();
	status=$("#status").val();
	
	var technician={
			"name":name,
			"phone1":phone1,
			"phone2":phone2,
			"email":email,
			"city":city,
			"username":username,
			"password":password,
			"status":status,
			"userType":2
	}
	sendDataSaveUser(JSON.stringify(technician));
}

function sendData(data, url) {
	console.log(data);
	$.ajax({
		url : 'http://localhost:8082/v1/user/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processSaveUserResponse(response);
		}
	});
}

function processSaveUserResponse(response){
	console.log("technician.processSaveUserResponse-> "+response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200||code == 0) {
		window.location.replace("Technical.jsp");
	} else {
		formMessage.css("color", "red");
	}
}

//-------------------------------------------------------------------------------------
//---------------------------------------- update technician
//-------------------------------------------------------------------------------------
function updateTechnician(){
	
}

// -------------------------------------------------------------------------------------
// ---------------------------------------- Get technician list
// -------------------------------------------------------------------------------------
function getAllTechniciansForTicketing() {

	$.ajax({
		url : 'http://localhost:8082/v1/user/all/technician',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTechniciansSelect(response);
		}
	});
}
function processAllTechniciansSelect(response) {
	console.log("technician.processAllTechniciansSelect -> Response:\n"
			+ JSON.stringify(response));
	var dTechnicians = $("#dTechnicians");
	var output = "<div><select name='sTechnicians' id='sTechnicians' style='width:150px;'>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].userId + "'>"
				+ response.results[i].username + "</option>"
	}
	output += "</select> </div>";
	dTechnicians.html(output);
}
