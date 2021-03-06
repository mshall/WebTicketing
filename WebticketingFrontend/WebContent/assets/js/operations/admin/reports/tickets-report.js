function getAllComplaints() {

	$.ajax({
		url : link + ':8082/v1/complaint/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsResponse(response);
		},
		error : function(data, textStatus, jqXHR) {
			handleAjaxError(data, textStatus, jqXHR);
		}
	});
}
function processGetAllComplaintsResponse(response) {
	console
			.log("tickets-report.processGetAllComplaintsResponse--->"
					+ response);
	var ticketstable = $('#allTickets');
	var taTicketsJson = $("#taTicketsJson");
	taTicketsJson.val(JSON.stringify(response.results));
	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].complaintId + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ response.results[i].terminalSerial + "</td><td>"
				+ response.results[i].terminalId + "</td><td>"
				+ response.results[i].merchantName + "</td><td>"
				+ response.results[i].merchantId + "</td><td>"
				+ response.results[i].merchantAddress + "</td><td>"
				+ response.results[i].merchantCity + "</td><td>"
				+ response.results[i].comments + "</td></tr>";
	}
	output += "";
	ticketstable.html(output);
	$('#allTicketsTable').DataTable();
}

// ///////////////////////// ticket history
// ///////////////////////////////////////
function getComplaintsByTechnician() {
	var userId = $.session.get('userId');
	$.ajax({
		url : link + ':8082/v1/complaint/?technicianId=' + userId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processComplaintsByTechnicianResponse(response);
		},
		error : function(data, textStatus, jqXHR) {
			handleAjaxError(data, textStatus, jqXHR);
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
				+ response.results[i].merchantName
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
		url : link + ':8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processUpdateComplaintResponse(response);
		},
		error : function(data, textStatus, jqXHR) {
			handleAjaxError(data, textStatus, jqXHR);
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
function getAllComplaintsByStatus(status) {
	// 
	$.ajax({
		url : link + ':8082/v1/complaint//status/' + status,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsByStatusResponse(response);
		},
		error : function(data, textStatus, jqXHR) {
			handleAjaxError(data, textStatus, jqXHR);
		}
	});
}

function processGetAllComplaintsByStatusResponse(response) {
	console.log("ticket.processGetAllComplaintsByStatusResponse -> Response:\n"
			+ JSON.stringify(response));
	var ticketstable = $('#allTickets');
	var taTicketsJson = $("#taTicketsJson");
	taTicketsJson.val(JSON.stringify(response.results));
	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].complaintId + "</td><td>"
				+ response.results[i].status + "</td><td>" + "serial num"
				+ "</td><td>" + response.results[i].terminalId + "</td><td>"
				+ "merchant name" + "</td><td>"
				+ response.results[i].merchantName + "</td><td>"
				+ "merchant address" + "</td><td>" + "city" + "</td><td>"
				+ response.results[i].comments + "</td></tr>";
	}
	output += "";

	ticketstable.html(output);

	$('#allTicketsTable').DataTable();
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
		url : link + ':8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processWithdrawTerminalResponse(response);
		},
		error : function(data, textStatus, jqXHR) {
			handleAjaxError(data, textStatus, jqXHR);
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

// -----------------------------------------------------------------------------------------
// Download Excel
// -----------------------------------------------------------------------------------------
function exportToExcel() {
	var data = $('#taTicketsJson').val();
	if (data == '')
		return;
	var maintainacePage = $("#maintainacePage").val();
	var reportName = "Tickets report";
	if (maintainacePage === undefined || maintainacePage === null
			|| maintainacePage === "") {
		reportName = "Tickets report";
	} else if(reportName = "maintainace"){
		reportName = "Maintainance report";
	}
	JSONToCSVConvertor(data, reportName, true);
}
// -----------------------------------------------------------------------------------------
// Print table
// -----------------------------------------------------------------------------------------
function printData(divToPrint) {
	newWin = window.open("");
	newWin.document.write(divToPrint.outerHTML);
	newWin.print();
	newWin.close();
}