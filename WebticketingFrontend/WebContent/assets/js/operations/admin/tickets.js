function getAllComplaints() {

	$.ajax({
		url : 'http://localhost:8082/v1/complaint/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processResponse(response);
		}
	});
}
function processResponse(response) {
	console.log(response);
	var ticketstable = $('#allTickets');

	var output = "<div > <table id=\"allTicketsTable\" class=\"table responsive\" border=\"1\"> <thead> <tr><th> Ticket-id </th>"
			+ "<th> Ticket-Date</th>"
			+ "<th> Ticket-Details</th> "
			+ "<th></th></tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].complaintId + "</td><td>"
				+ response.results[i].complaintOpeningTime + "</td><td>"
				+ response.results[i].comments + "</td><td>"
				+ response.results[i].phoneNumber + "</td></tr>";
	}
	output += "</tbody></body></div>";

	ticketstable.html(output);

	$('#allTicketsTable').DataTable();
}

// ///////////////////////// ticket history
// ///////////////////////////////////////
function getComplaintsByTechnician() {
	var userId = $.session.get('userId');
	$.ajax({
		url : 'http://localhost:8082/v1/complaint/?technicianId=' + userId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processComplaintsByTechnicianResponse(response);
		}
	});
}

function processComplaintsByTechnicainResponse(response) {
	console.log(response);
	var ticketstable = $('#allTicketsByTechnician');

	var output = "<div > <table id=\"allTicketsByTechnicianTable\" class=\"table responsive\" border=\"1\"> <thead> <tr><th> Ticket-id </th>"
			+ "<th>Vendore Name</th>"
			+ "<th>Serial number</th>"
			+ "<th> Ticket-Date</th>"
			+ "<th>Problem</th>"
			+ "<th>Mobile</th>"
			+ "<th>Status</th>" + "<th></th></tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>"
				+ response.results[i].complaintId
				+ "</td><td>"
				+ response.results[i].merchantId
				+ "</td><td>"
				+ response.results[i].terminalId
				+ "</td><td>"
				+ response.results[i].complaintOpeningTime
				+ "</td>"
				+ "<td>"
				+ response.results[i].comments
				+ "</td><td>"
				+ response.results[i].phoneNumber
				+ "</td><td>"
				+ response.results[i].status
				+ "</td>"
				+ "<td> <button type=\"button\" onclick=\"goTomaintenancePage("
				+ response.results[i].complaintId
				+ ");\" class=\"btn btn-lg btn-primary btn-block\">Maintenance</button></td></tr>";
	}
	output += "</tbody></body></div>";

	ticketstable.html(output);

	$('#allTicketsByTechnicianTable').DataTable();
}

function goTomaintenancePage(complaintId) {
	window.location
			.replace("TicketsMaintenance.jsp?complaintId=" + complaintId);
}

// //////////////////////////// maintenance ticket
// ///////////////////////////////////////
function updateComplaint() {
	var data = new FormData();

	var status = $("#status").val();
	var solution = $("#solution").val();
	var note = $("#note").val();
	var complaint = {
		"complaintId" : $.urlParam('complaintId'),
		"complaintSolution" : solution,
		"complaintNote" : note,
		"status" : status
	}
	sendData(JSON.stringify(complaint));

}
function sendData(data) {
	$.ajax({
		url : 'http://localhost:8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processUpdateComplaintResponse(response);
		}
	});
}

function processUpdateComplaintResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
		window.location.replace("TicketsHistory.jsp");
	} else {
		formMessage.css("color", "red");
	}
}
