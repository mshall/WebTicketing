function getAllTerminals() {
	$.ajax({
		url : link+':8082/v1/terminal/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTerminalsResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processAllTerminalsResponse(response) {
	console.log(response);
	var terminalstable = $('#allTerminals');

	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].terminalId + "</td><td>"
				+ response.results[i].terminalSerialNumber + "</td><td>"
				+ response.results[i].model + "</td><td>"
				+ response.results[i].status + "</td><td>" 
				+response.results[i].tender+"</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='goToUpdateTerminalPage("
				+ response.results[i].terminalId
				+ ")'>Edit</button>"
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deleteTerminal("
				+ response.results[i].terminalId
				+ ")'>Delete</button>"
				+ "</td></tr>";
	}
	output += "";

	terminalstable.html(output);

	$('#terminalsTable').DataTable();
}
// ///////////////////////////////////////
function goToUpdateTerminalPage(terminalId) {
	window.location.replace("editTerminal.jsp?terminalId=" + terminalId);
}
//---------------------------------------------------------------------------------------------------
//----------------------------delete terminal
//---------------------------------------------------------------------------------------------------
function deleteTerminal(objectId) {
	var deleteObject = link+':8082/v1/terminal/' + objectId;
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
// //////////////////////////////////////////
function getTerminalById(terminalId) {
	$.ajax({
		url : link+':8082/v1/terminal/' + terminalId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			
			processGetTerminalByResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processGetTerminalByResponse(response) {
	console.log(response);

	$("#terminalId").val(response.results.terminalId);
	$("#terminalSerialNumber").val(response.results.terminalSerialNumber);
	$("#storeId").val(response.results.storeId);
	$("#currency").val(response.results.currency);
	$("#terminalClass").val(response.results.terminalClass);
	$("#status").val(response.results.status);
	$("#model").val(response.results.model);
	$("#condition").val(response.results.condition);
	$("#sale").attr('checked',response.results.sale);
	$("#onlineRefund").attr('checked',response.results.onlineRefund);
	$("#offlineRefund").attr('checked',response.results.offlineRefund);
	$("#offlineSale").attr('checked',response.results.offlineSale);
	$("#onlineVoid").attr('checked',response.results.onlineVoid);
	$("#offlineVoid").attr('checked',response.results.offlineVoid);
	$("#preauth").attr('checked',response.results.preauth);
	$("#amex").attr('checked',response.results.amex);
	$("#installments").attr('checked',response.results.installments);
	$("#prepaidServices").attr('checked',response.results.prepaidServices);
	$("#diners").attr('checked', response.results.diners);
	$("#premuim").attr('checked',response.results.premuim);
	$("#manualEntry").attr('checked',response.results.manualEntry);
	$("#tender").val(response.results.tender);

}

// ////////////////////////////////////////////////////
function addTerminal() {
	var data = new FormData();
	terminalId = $("#terminalId").val();
	terminalSerialNumber = $("#terminalSerialNumber").val();
	storeId = $("#storeId").val();
	currency = $("#currency").val();
	terminalClass = $("#terminalClass").val();
	status = $("#status").val();
	model = $("#model").val();
	condition = $("#condition").val();
	sale = $("#sale").is(":checked") ? "true" : "false";
	onlineRefund = $("#onlineRefund").is(":checked") ? "true" : "false";
	offlineRefund = $("#offlineRefund").is(":checked") ? "true" : "false";
	offlineSale = $("#offlineSale").is(":checked") ? "true" : "false";
	onlineVoid = $("#onlineVoid").is(":checked") ? "true" : "false";
	offlineVoid = $("#offlineVoid").is(":checked") ? "true" : "false";
	preauth = $("#preauth").is(":checked") ? "true" : "false";
	amex = $("#amex").is(":checked") ? "true" : "false";
	installments = $("#installments").is(":checked") ? "true" : "false";
	prepaidServices = $("#prepaidServices").is(":checked") ? "true" : "false";
	diners = $("#diners").is(":checked") ? "true" : "false";
	premuim = $("#premuim").is(":checked") ? "true" : "false";
	manualEntry = $("#manualEntry").is(":checked") ? "true" : "false";
	tender = $("#tender").val();

	var terminal = {
		"terminalId" : terminalId,
		"terminalSerialNumber" : terminalSerialNumber,
		"storeId" : storeId,
		"currency" : currency,
		"terminalClass" : terminalClass,
		"status" : "Stocked",
		"model" : model,
		"condition" : condition,
		"sale" : sale,
		"onlineRefund" : onlineRefund,
		"offlineRefund" : offlineRefund,
		"offlineSale" : offlineSale,
		"onlineVoid" : onlineVoid,
		"offlineVoid" : offlineVoid,
		"preauth" : preauth,
		"amex" : amex,
		"installments" : installments,
		"prepaidServices" : prepaidServices,
		"diners" : diners,
		"premuim" : premuim,
		"manualEntry" : manualEntry,
		"tender" : tender
	}
	sendData(JSON.stringify(terminal), link+':8082/v1/terminal/');

}

function processAddTerminalResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200||code == 0) {
		window.location.replace("Terminals.jsp");
	} else {
		formMessage.css("color", "red");
	}
}

// /////////////////////////////////

function updateTerminal() {
	var data = new FormData();
	terminalId = $("#terminalId").val();
	terminalSerialNumber = $("#terminalSerialNumber").val();
	storeId = $("#storeId").val();
	currency = $("#currency").val();
	terminalClass = $("#terminalClass").val();
	status = $("#status").val();
	model = $("#model").val();
	condition = $("#condition").val();
	sale = $("#sale").is(":checked") ? "true" : "false";
	onlineRefund = $("#onlineRefund").is(":checked") ? "true" : "false";
	offlineRefund = $("#offlineRefund").is(":checked") ? "true" : "false";
	offlineSale = $("#offlineSale").is(":checked") ? "true" : "false";
	onlineVoid = $("#onlineVoid").is(":checked") ? "true" : "false";
	offlineVoid = $("#offlineVoid").is(":checked") ? "true" : "false";
	preauth = $("#preauth").is(":checked") ? "true" : "false";
	amex = $("#amex").is(":checked") ? "true" : "false";
	installments = $("#installments").is(":checked") ? "true" : "false";
	prepaidServices = $("#prepaidServices").is(":checked") ? "true" : "false";
	diners = $("#diners").is(":checked") ? "true" : "false";
	premuim = $("#premuim").is(":checked") ? "true" : "false";
	manualEntry = $("#manualEntry").is(":checked") ? "true" : "false";
	tender = $("#tender").val();

	var terminal = {
		"terminalId" : terminalId,
		"terminalSerialNumber" : terminalSerialNumber,
		"storeId" : storeId,
		"currency" : currency,
		"terminalClass" : terminalClass,
		"status" : "Stocked",
		"model" : model,
		"condition" : condition,
		"sale" : sale,
		"onlineRefund" : onlineRefund,
		"offlineRefund" : offlineRefund,
		"offlineSale" : offlineSale,
		"onlineVoid" : onlineVoid,
		"offlineVoid" : offlineVoid,
		"preauth" : preauth,
		"amex" : amex,
		"installments" : installments,
		"prepaidServices" : prepaidServices,
		"diners" : diners,
		"premuim" : premuim,
		"manualEntry" : manualEntry,
		"tender" : tender
	}
	sendData(JSON.stringify(terminal),
			link+':8082/v1/terminal/update/');

}

function sendData(data, url) {
//	console.log(data);
	$.ajax({
		url : url,
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processAddTerminalResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
// ////////////////////////////////////////////////////

function getTerminalsByStatus(status){
	$.ajax({
		url : link+':8082/v1/terminal/?status='+status,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTerminalsResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
////////////////////////////////////////////////////





//////////////////////////////////////////////////////
$.urlParam = function(name) {
	var results = new RegExp('[\?&]' + name + '=([^]*)')
			.exec(window.location.href);
	if (results == null) {
		return null;
	} else {
		return results[1] || 0;
	}
}