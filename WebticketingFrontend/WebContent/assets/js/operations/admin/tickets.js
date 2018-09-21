function getAllComplaints() {

	$.ajax({
		url : link+':8082/v1/complaint/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processGetAllComplaintsResponse(response) {
	console.log(response);
	var ticketstable = $('#allTickets');

	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].complaintId + "</td><td>"
				+ response.results[i].complaintOpeningTime + "</td><td>"
				+ response.results[i].comments + "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='goTomaintenancePage("
				+ response.results[i].complaintId
				+ ")'>Edit</button>"
				+ "&nbsp;<button type='button' class='btn btn-danger' onclick='deleteTicketById("
				+ response.results[i].complaintId
				+ ")'>Delete</button>"
				+ "</td></tr>";
	}
	ticketstable.html(output);
	$('#allTicketsTable').DataTable();
}

//---------------------------------------------------------------------------------------------------
//----------------------------getComplaintsByTechnician
//---------------------------------------------------------------------------------------------------

function getComplaintsByTechnician() {
	var userId = $.session.get('userId');
	$.ajax({
		url : link+':8082/v1/complaint/?technicianId=' + userId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processComplaintsByTechnicianResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processComplaintsByTechnicianResponse(response) {
	console.log(response);
	var ticketstable = $('#allTicketsByTechnician');

	var output = "";
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
	output += "";

	ticketstable.html(output);

	$('#allTicketsByTechnicianTable').DataTable();
}
//-------------------------------------------------------------------------------------
//------------------------------- navigate to maintenance page 
//-------------------------------------------------------------------------------------

function goTomaintenancePage(complaintId) {
	if( $.session.get('userType')!=2){
	window.location
			.replace("TicketsMaintenance.jsp?complaintId=" + complaintId);
	}else{
		window.location
		.replace("TicketsMaintenanceTech.jsp?complaintId=" + complaintId);
	}
}
//---------------------------------------------------------------------------------------------------
//----------------------------delete ticket by id
//---------------------------------------------------------------------------------------------------
function deleteTicketById(objectId){
		var deleteObject = link+':8082/v1/complaint/' + objectId;
		$.ajax({
			url : deleteObject,
			type : 'DELETE',
			contentType : "application/json; charset=utf-8",
			data : {},
			dataType : 'json',
			success : function(response) {
                processDeleteResponse(response);
			},
            error: function(data, textStatus, jqXHR) {
                handleAjaxError(data, textStatus, jqXHR);
            }
		});	
	
}
// -------------------------------------------------------------------------------------
// ------------------------------- maintenance ticket
// -------------------------------------------------------------------------------------
function updateComplaint() {
	var data = new FormData();
	var complaintId=$("#complaintId").val();
	var status = $("#status").val();
	var solution = $("#solution").val();
	var note = $("#note").val();
	var complaint = {
		"complaintId" : complaintId,
		"complaintSolution" : solution,
		"complaintNote" : note,
		"status" : status
	}
	sendUpdateComplaintData(JSON.stringify(complaint));

}
function sendUpdateComplaintData(data) {
	$.ajax({
		url : link+':8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processUpdateComplaintResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
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
//		window.location.replace("TicketsHistory.jsp");
		$("#successUpdate").show();
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
		url : link+':8082/v1/complaint//status/'+status,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllComplaintsByStatusResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processGetAllComplaintsByStatusResponse(response) {
	console.log("ticket.processGetAllComplaintsByStatusResponse -> Response:\n"
			+ JSON.stringify(response));
	var dTickets = $("#dTickets");
	var output = "<div><select name='sTickets' id='sTickets' style='width:150px;'>" +
			"<option value=''>Select...</option>";
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
		url : link+':8082/v1/complaint/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processAssignTicketResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processAssignTicketResponse(response) {
	var status = response.code;
	if (status == 200||status == 0) {
		$("#successUpdate").show();

	} else {
		$("#errorUpdate").show();
	}
}
//-------------------------------------------------------------------------------------
//---------------------------------------- get technician by id
//-------------------------------------------------------------------------------------

function getTicketById(complaintId) {
	$.ajax({
		url : link+':8082/v1/complaint/' + complaintId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetTicketByResponse(response);
		},
      error: function(data, textStatus, jqXHR) {
          handleAjaxError(data, textStatus, jqXHR);
      }
	});
}

function processGetTicketByResponse(response) {
	console.log("tickets.processGetTicketByResponse:-> "+response);

	$("#complaintId").val(response.results.complaintId);
	$("#complaintSolution").val(response.results.complaintSolution);
	$("#complaintNote").val(response.results.complaintNote);
	$("#status").val(response.results.status);
	
}
