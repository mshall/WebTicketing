// -----------------------------------------------------------------------------------------
// Get withdrawal history
// -----------------------------------------------------------------------------------------
function getWithdrawalsLogs() {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/?status=Defected',
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
