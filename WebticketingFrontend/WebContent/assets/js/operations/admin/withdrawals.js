// -------------------------------------------------------------------------------------
// ---------------------------------------- Get All merchants
// -------------------------------------------------------------------------------------
function getAllMerchantsForWithdrawal() {
	// 
	$.ajax({
		url : link+':8082/v1/merchant/all',
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
		url : link+':8082/v1/terminal/all',
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
	var currentMonth = (currentdate.getMonth() + 1);
	if (currentMonth < 10) {
		currentMonth = "0" + currentMonth;
	}
	var currentDay = currentdate.getDate();
	if (currentDay < 10) {
		currentDay = "0" + currentDay;
	}
	var timeNow = currentdate.getFullYear() + "-" + currentMonth + "-"
			+ currentDay;
	for ( var i in allTerminalsResponse.results) {
		if (allTerminalsResponse.results[i].terminalSerialNumber == terminalSerialNumber) {
			targetedTerminalId = allTerminalsResponse.results[i].terminalId;
		}
	}
	var d = new Date();
	// d is "Sun Oct 13 2013 20:32:01 GMT+0530 (India Standard Time)"
	datetext = d.toTimeString();
	datetext = datetext.split(' ')[0];
	timeNow = timeNow + " " + datetext;
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
		url : link+':8082/v1/terminal/update/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processWithdrawTerminalResponse(response);
		}
	});
}
function processWithdrawTerminalResponse(response) {
	var status = response.code;
	if (status == 200) {
		$("#successUpdate").show();

	} else {
		$("#errorUpdate").show();
	}
}

// -----------------------------------------------------------------------------------------
// Get withdrawal history
// -----------------------------------------------------------------------------------------
function getWithdrawalsLogs() {
	$.ajax({
		url : link+':8082/v1/terminal/?status=Defected',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processWithdrawalLogsResponse(response);
		}
	});
}
function processWithdrawalLogsResponse(response) {
	console.log('withdrawals.processWithdrawalLogsResponse -> Response: '
			+ JSON.stringify(response));

	var dWithdrawalsLogs = $('#dWithdrawalsLogs');

	var output = "<div ><table id='tWithdrawals' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr>"
			+ "<th>Vendor</th>"
			+ "<th>Model</th>"
			+ "<th>Serial number</th>"
			+ "<th>TID</th>"
			+ "<th>MID</th"
			+ "><th>Sim 1</th>" + "<th>Sim 2</th></tr></thead>";
	for ( var i in response.results) {
		var merchantId = response.results[i].merchantId;
		output += "<tr><td>" + "Spectre" + "</td><td>"
				+ response.results[i].model + "</td>" + "<td>"
				+ response.results[i].terminalSerialNumber + "</td><td>"
				+ response.results[i].terminalId + "</td><td>"
				+ response.results[i].merchantId + "</td><td>"
				+ response.results[i].firstSimSerial + "</td>" + "<td>"
				+ response.results[i].secondSimSerial + "</td></tr>";
	}
	output += "</tbody></body></div>";

	dWithdrawalsLogs.html(output);
	$('#tWithdrawals').DataTable();
}
