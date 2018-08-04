function getAllTerminals() {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTerminalsResponse(response);
		}
	});
}

function processAllTerminalsResponse(response) {
	console.log(response);
	var terminalstable = $('#allTerminals');

	var output = "<div ><table id='terminalsTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>terminal Id</th>"
			+ "<th>serial number</th>"
			+ "<th>model</th>"
			+ "<th>status</th>"
			+ "<th>Tender</th>"
			+ "<th>Deploy</th>"
			/*
			 * + "<th>condition</th>" + "<th>currency</th>" + "<th>MCC</th>" + "<th>Terminal
			 * Class</th>" + "<th>Sale</th>" + +"<th>OnlineReturned</th>" + "<th>OfflineReturned</th>" + "<th>offlineSale</th>" + "<th>onlineVoid</th>" + "<th>offlineVoid</th>" + +"<th>preauth</th>" + "<th>amex</th>" + "<th>instatiment</th>" + "<th>prepaidservices</th>" + "<th>diners</th>" + +"<th>premuim</th>" + "<th>manualEntry</th>" + "<th>storeId</th>"
			 */
			+ " </tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].terminalId + "</td><td>"
				+ response.results[i].terminalSerialNumber + "</td><td>"
				+ response.results[i].model + "</td><td>"
				+ response.results[i].status + "</td><td>" + "Tender </td><td>"
				+ "<a href='#' onclick=\"goToUpdateTerminalPage("
				+ response.results[i].terminalId + "); > edit </a></td></tr>";

		/*
		 * + response.results[i].condition + "</td><td>" +
		 * response.results[i].currency + "</td><td>" +
		 * response.results[i].MCC + "</td><td>" +
		 * response.results[i].terminalClass + "</td><td>" +
		 * response.results[i].sale + "</td><td>" +
		 * response.results[i].onlineReturned + "</td><td>" +
		 * response.results[i].offlineReturned + "</td><td>" +
		 * response.results[i].offlineSale + "</td><td>" +
		 * response.results[i].onlineVoid + "</td><td>" +
		 * response.results[i].offlineVoid + "</td><td>" +
		 * response.results[i].preauth + "</td><td>" +
		 * response.results[i].amex + "</td><td>" +
		 * response.results[i].instatiment + "</td><td>" +
		 * response.results[i].prepaidservices + "</td><td>" +
		 * response.results[i].diners + "</td><td>" +
		 * response.results[i].premuim + "</td><td>" +
		 * response.results[i].manualEntry + "</td><td>" +
		 * response.results[i].storeId + "</td></tr>";
		 */
	}
	output += "</tbody></body></div>";

	terminalstable.html(output);

	$('#terminalsTable').DataTable();
}
// ///////////////////////////////////////
function goToUpdateTerminalPage(terminalId) {
	window.location.replace("TerminalUpdate.jsp?terminalId=" + terminalId);
}
// //////////////////////////////////////////
function getTerminalById() {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/' + $.urlParam('terminalId'),
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetTerminalByResponse(response);
		}
	});
}
function processGetTerminalByResponse(response) {
	console.log('terminal.processGetTerminalByResponse -> Response: '
			+ response);

	$("#terminalId").val(response.terminalId);
	$("#terminalSerialNumber").val(response.terminalSerialNumber);
	$("#storesList").val(response.storeId);
	$("#currency").val(response.currency);
	$("#terminalClass").val(response.terminalClass);
	$("#status").val(response.status);
	$("#model").val(response.model);
	$("#condition").val(response.condition);
	$("#sale").val(response.sale);
	$("#onlineRefund").val(response.onlineRefund);
	$("#offlineRefund").val(response.offlineRefund);
	$("#offlineSale").val(response.offlineSale);
	$("#onlineVoid").val(response.onlineVoid);
	$("#offlineVoid").val(response.offlineVoid);
	$("#preauth").val(response.preauth);
	$("#amex").val(response.amex);
	$("#installments").val(response.installments);
	$("#prepaidServices").val(response.prepaidServices);
	$("#diners").val(response.diners);
	$("#premuim").val(response.premuim);
	$("#manualEntry").val(response.manualEntry);
	$("#tender").val(response.tender);

}

// ////////////////////////////////////////////////////
function addTerminal() {
	var data = new FormData();
	terminalId = $("#terminalId").val();
	terminalSerialNumber = $("#terminalSerialNumber").val();
	storeId = $("#storesList").val();
	currency = $("#currency").val();
	terminalClass = $("#terminalClass").val();
	status = $("#status").val();
	model = $("#model").val();
	condition = $("#condition").val();
	sale = $("#sale").val();
	onlineRefund = $("#onlineRefund").val();
	offlineRefund = $("#offlineRefund").val();
	offlineSale = $("#offlineSale").val();
	onlineVoid = $("#onlineVoid").val();
	offlineVoid = $("#offlineVoid").val();
	preauth = $("#preauth").val();
	amex = $("#amex").val();
	installments = $("#installments").val();
	prepaidServices = $("#prepaidServices").val();
	diners = $("#diners").val();
	premuim = $("#premuim").val();
	manualEntry = $("#manualEntry").val();
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
	sendData(JSON.stringify(terminal), 'http://localhost:8082/v1/terminal/');

}

function processAddTerminalResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
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
	storeId = $("#storesList").val();
	currency = $("#currency").val();
	terminalClass = $("#terminalClass").val();
	status = $("#status").val();
	model = $("#model").val();
	condition = $("#condition").val();
	sale = $("#sale").val();
	onlineRefund = $("#onlineRefund").val();
	offlineRefund = $("#offlineRefund").val();
	offlineSale = $("#offlineSale").val();
	onlineVoid = $("#onlineVoid").val();
	offlineVoid = $("#offlineVoid").val();
	preauth = $("#preauth").val();
	amex = $("#amex").val();
	installments = $("#installments").val();
	prepaidServices = $("#prepaidServices").val();
	diners = $("#diners").val();
	premuim = $("#premuim").val();
	manualEntry = $("#manualEntry").val();
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
			'http://localhost:8082/v1/terminal/update/');

}

function sendData(data, url) {
	console.log(data);
	$.ajax({
		url : url,
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processAddTerminalResponse(response);
		}
	});
}
// ////////////////////////////////////////////////////
