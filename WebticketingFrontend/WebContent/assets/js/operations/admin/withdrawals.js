// -------------------------------------------------------------------------------------
// ---------------------------------------- Get complaints by status
// -------------------------------------------------------------------------------------
function getAllMerchantsForWithdrawal() {
	// 
	$.ajax({
		url : 'http://localhost:8082/v1/merchant/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllMerchantsForWithdrawal(response);
		}
	});
}

function processGetAllMerchantsForWithdrawal(response) {
	console
			.log("withdrawals.processGetAllMerchantsForWithdrawal -> Response:\n"
					+ JSON.stringify(response));
	var dMerchantId = $("#dMerchantId");
	var output = "<div><select name='sMerchantId' id='sMerchantId' style='width:150px;' class='form-control'>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].merchantId + "'>"
				+ response.results[i].merchantId + "</option>"
	}
	output += "</select></div>";
	dMerchantId.html(output);
}

// -----------------------------------------------------------------------------------------
// Get all terminals serials
// -----------------------------------------------------------------------------------------
var allTerminalsResponse = null;
var targetedTerminalId = null;
function getAllTerminalSerialsForWithdrawal() {
	// 
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllTerminalForWithdrawal(response);
		}
	});
}

function processGetAllTerminalForWithdrawal(response) {
	console.log("withdrawals.processGetAllTerminalForWithdrawal -> Response:\n"
			+ JSON.stringify(response));
	allTerminalsResponse = response;
	var dTerminalId = $("#dTerminalSerial");
	var output = "<div><select name='sTerminalSerial' id='sTerminalSerial' style='width:150px;' class='form-control'>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].terminalSerialNumber
				+ "'>" + response.results[i].terminalSerialNumber + "</option>"
	}
	output += "</select></div>";
	dTerminalId.html(output);
}

// -----------------------------------------------------------------------------------------
// Assign a ticket
// -----------------------------------------------------------------------------------------
function withdrawTerminal() {
	var terminalSerialNumber = $("#sTerminalSerial").val();
	var merchantId = $("#sMerchantId").val();
	// 2018-07-27 19:12:06
	var currentdate = new Date();
	var timeNow = currentdate.getFullYear() + "-"
			+ (currentdate.getMonth() + 1) + "-" + currentdate.getDate() + " "
			+ currentdate.getHours() + ":" + currentdate.getMinutes() + ":"
			+ currentdate.getSeconds();
	for ( var i in allTerminalsResponse.results) {
		if (allTerminalsResponse.results[i].terminalSerialNumber == terminalSerialNumber) {
			targetedTerminalId = allTerminalsResponse.results[i].terminalId;
		}
	}
	var terminal = {
		"terminalId" : targetedTerminalId,
		"terminalSerialNumber" : terminalSerialNumber,
		"merchantId" : Number(merchantId),
		"createdDate" : timeNow,
		"status" : "Defected"

	}
	sendWithdrawTerminalData(JSON.stringify(terminal));

}
function sendWithdrawTerminalData(data) {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processAssignTicketResponse(response);
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
