// -------------------------------------------------------------------------------------
// ---------------------------------------- Get All merchants for select
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
	var output = "<label class='col-sm-2'>Merchant</label>  <select name='sMerchantId' id='sMerchantId'  class='col-sm-4' style='border-radius:.5rem;' onchange='activateSearch(this,4)'>"
			+ "<option value=''>Select merchant</option>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].merchantId + "'>"
				+ response.results[i].merchantId + "</option>"
	}
	output += "</select>";
	dMerchantId.html(output);
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
	var taWithdrawalsJson = $("#taWithdrawalsJson");
	taWithdrawalsJson.val(JSON.stringify(response.results));
	var output = "";
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
	output += "";
	dWithdrawalsLogs.html(output);
	var table = $('#tWithdrawals').DataTable();

}

// -----------------------------------------------------------------------------------------
// Download Excel
// -----------------------------------------------------------------------------------------
function exportToExcel() {
	var data = $('#taWithdrawalsJson').val();
	if (data == '')
		return;

	JSONToCSVConvertor(data, "Withdrawals report", true);
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

// ---------------------------------------------------------------------
/*
 * Custom filtering function which will search data in column four between two
 * values
 */
// ---------------------------------------------------------------------
function activateSearch(inputText, columnIndex) {
	// Setup - add a text input to each footer cell
	// DataTable
	var table = $('#tWithdrawals').DataTable();

	// Apply the search
	/*
	 * table.columns().every(function() { var that = this; if (that.search() !==
	 * inputText.value) { that.search(inputText.value).draw(); } });
	 */
	console.log(inputText.value);
	table.search('');
	table.column(columnIndex).search(inputText.value).draw();
}
