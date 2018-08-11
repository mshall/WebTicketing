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

	var taDeploymentsJson = $("#taDeploymentsJson");
	taDeploymentsJson.val(JSON.stringify(response.results));

	var output = "<div ><table id='terminalsTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Vendor</th>"
			+ "<th>Model</th>"
			+ "<th>Serial number</th>"
			+ "<th>TID</th>"
			+ "<th>MID</th>"
			+ "<th>SIM 1</th>" + "<th>tender</th>" + "<th>created Date </th>"
			/*
			 * + "<th>condition</th>" + "<th>currency</th>" + "<th>MCC</th>" + "<th>Terminal
			 * Class</th>" + "<th>Sale</th>" + +"<th>OnlineReturned</th>" + "<th>OfflineReturned</th>" + "<th>offlineSale</th>" + "<th>onlineVoid</th>" + "<th>offlineVoid</th>" + +"<th>preauth</th>" + "<th>amex</th>" + "<th>instatiment</th>" + "<th>prepaidservices</th>" + "<th>diners</th>" + +"<th>premuim</th>" + "<th>manualEntry</th>" + "<th>storeId</th>"
			 */
			+ " </tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>Spectra</td><td>" + response.results[i].model
				+ "</td><td>" + response.results[i].terminalSerialNumber
				+ "</td><td>" + response.results[i].terminalId + "</td><td>"
				+ response.results[i].merchantId + "</td><td>"
				+ response.results[i].firstSimSerial + "</td><td>"
				+ response.results[i].tender + "</td><td>"
				+ response.results[i].createdDate + "</td></tr>";

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
	console.log(response);

	$("#terminalId").val(response.results.terminalId);
	$("#terminalSerialNumber").val(response.results.terminalSerialNumber);
	$("#storesList").val(response.results.storeId);
	$("#currency").val(response.results.currency);
	$("#terminalClass").val(response.results.terminalClass);
	$("#status").val(response.results.status);
	$("#model").val(response.results.model);
	$("#condition").val(response.results.condition);
	$("#sale").val(response.results.sale);
	$("#onlineRefund").val(response.results.onlineRefund);
	$("#offlineRefund").val(response.results.offlineRefund);
	$("#offlineSale").val(response.results.offlineSale);
	$("#onlineVoid").val(response.results.onlineVoid);
	$("#offlineVoid").val(response.results.offlineVoid);
	$("#preauth").val(response.results.preauth);
	$("#amex").val(response.results.amex);
	$("#installments").val(response.results.installments);
	$("#prepaidServices").val(response.results.prepaidServices);
	$("#diners").attr('checked', response.results.diners);
	$("#premuim").val(response.results.premuim);
	$("#manualEntry").val(response.results.manualEntry);
	$("#tender").val(response.results.tender);

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

	if (code == 200 || code == 0) {

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

function getTerminalsByStatus(status) {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/?status=' + status,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTerminalsResponse(response);
		}
	});
}
// //////////////////////////////////////////////////

// ////////////////////////////////////////////////////
$.urlParam = function(name) {
	var results = new RegExp('[\?&]' + name + '=([^]*)')
			.exec(window.location.href);
	if (results == null) {
		return null;
	} else {
		return results[1] || 0;
	}
}

// ////////////////////////////////////////////////
// -------------------------------------------------------------------------------------
// ---------------------------------------- Get All merchants for select
// -------------------------------------------------------------------------------------
function getAllMerchantsForDeplyment() {
	// 
	$.ajax({
		url : 'http://localhost:8082/v1/merchant/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllMerchantsForDeplyment(response);
		}
	});
}

function processGetAllMerchantsForDeplyment(response) {
	console.log("withdrawals.processGetAllMerchantsForDeplyment -> Response:\n"
			+ JSON.stringify(response));
	var dMerchantId = $("#dMerchantId");
	var output = "<label class='col-sm-2'>Merchant</label>  " +
			"<select name='sMerchantId' id='sMerchantId' class='col-sm-4' style='border-radius: .5rem' oninput=\"activateSearch(this,$('#terminalsTable'),4);\" ><option value=''>Select Merchant</option>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].merchantId + "'>"
				+ response.results[i].merchantId + "</option>"
	}
	output += "</select>";
	dMerchantId.html(output);
}

// -----------------------------------------------------------------------------------------
// Download Excel
// -----------------------------------------------------------------------------------------
function exportToExcel() {
	var data = $('#taDeploymentsJson').val();
	if (data == '')
		return;

	JSONToCSVConvertor(data, "Deplyments report", true);
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
