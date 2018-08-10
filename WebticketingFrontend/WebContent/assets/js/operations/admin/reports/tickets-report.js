function getAllComplaints() {

	$.ajax({
		url : 'http://localhost:8082/v1/complaint/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsResponse(response);
		}
	});
}
function processGetAllComplaintsResponse(response) {
	console.log(response);
	var ticketstable = $('#allTickets');

	var output = "<div > <table id=\"allTicketsTable\" class=\"table responsive\" border=\"1\"> <thead> " +
			"<tr><th> Ticket-id </th>"
			+ "<th>status</th>"
			+ "<th>srial num</th>"
			+ "<th>Terminal Id</th>"
			+ "<th>Merchant Name</th>"
			+ "<th>Merchant ID</th>"
			+ "<th>Merchant Address</th>"
			+ "<th>City</th>"
			+ "<th>Problem</th></tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].complaintId + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ "serial num" + "</td><td>"
				+ response.results[i].terminalId + "</td><td>"
				+ "merchant name" + "</td><td>"
				+ response.results[i].merchantId + "</td><td>"
				+ "merchant address" + "</td><td>"
				+ "city" + "</td><td>"
				+ response.results[i].comments + "</td></tr>";
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
// -------------------------------------------------------------------------------------
// ------------------------------- maintenance ticket
// -------------------------------------------------------------------------------------
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
	sendUpdateComplaintData(JSON.stringify(complaint));

}
function sendUpdateComplaintData(data) {
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

// -------------------------------------------------------------------------------------
// ---------------------------------------- Get complaints by status
// -------------------------------------------------------------------------------------
function getAllComplaintsByStatus() {
	// 
	$.ajax({
		url : 'http://localhost:8082/v1/complaint//status/Open',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsByStatusResponse(response);
		}
	});
}

function processGetAllComplaintsByStatusResponse(response) {
	console.log("ticket.processGetAllComplaintsByStatusResponse -> Response:\n"
			+ JSON.stringify(response));
	var dTickets = $("#dTickets");
	var output = "<div><select name='sTickets' id='sTickets' style='width:150px;'>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].complaintId + "'>"
				+ response.results[i].complaintId + "</option>"
	}
	output += "</select> </div>";
	dTickets.html(output);
}

// -----------------------------------------------------------------------------------------
// Assign a ticket
// -----------------------------------------------------------------------------------------
function assignTicket() {
	var complaintId = $("#sTickets").val();
	var technicianId = $("#sTechnicians").val();
	var complaint = {
		"complaintId" : Number(complaintId),
		"technicianId" : Number(technicianId)
	}
	sendAssingTicketData(JSON.stringify(complaint));

}
function sendAssingTicketData(data) {
	$.ajax({
		url : 'http://localhost:8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processWithdrawTerminalResponse(response);
		}
	});
}
function processAssignTicketResponse(response) {
	var status = response.code;
	if (status == 200) {
		$("#successUpdate").show();

	} else {
		$("#errorUpdate").show();
	}
}
