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
			+ "<th>model</th>"
			+ "<th>serial number</th>"
			+ "<th>condition</th>"
			+ +"<th>status</th>"
			+ "<th>currency</th>"
			+ "<th>MCC</th>"

			+ "<th>Terminal Class</th>"
			+ "<th>Sale</th>"
			+ +"<th>OnlineReturned</th>"
			+ "<th>OfflineReturned</th>"
			+ "<th>offlineSale</th>"
			+ "<th>onlineVoid</th>"
			+ "<th>offlineVoid</th>"
			+ +"<th>preauth</th>"
			+ "<th>amex</th>"
			+ "<th>instatiment</th>"
			+ "<th>prepaidservices</th>"
			+ "<th>diners</th>"
			+ +"<th>premuim</th>"
			+ "<th>manualEntry</th>"
			+ "<th>storeId</th>" + "</tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].terminalId + "</td><td>"
				+ response.results[i].model + "</td><td>"
				+ response.results[i].serial_number + "</td><td>"
				+ response.results[i].condition + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ response.results[i].currency + "</td><td>"
				+ response.results[i].MCC + "</td><td>"
				+ response.results[i].terminalClass + "</td><td>"
				+ response.results[i].sale + "</td><td>"
				+ response.results[i].onlineReturned + "</td><td>"
				+ response.results[i].offlineReturned + "</td><td>"
				+ response.results[i].offlineSale + "</td><td>"
				+ response.results[i].onlineVoid + "</td><td>"
				+ response.results[i].offlineVoid + "</td><td>"
				+ response.results[i].preauth + "</td><td>"
				+ response.results[i].amex + "</td><td>"
				+ response.results[i].instatiment + "</td><td>"
				+ response.results[i].prepaidservices + "</td><td>"
				+ response.results[i].diners + "</td><td>"
				+ response.results[i].premuim + "</td><td>"
				+ response.results[i].manualEntry + "</td><td>"
				+ response.results[i].storeId + "</td></tr>";
	}
	output += "</tbody></body></div>";

	terminalstable.html(output);
	$('#allTerminals').DataTable();
}

// //////////////////////////////////////////
function getTerminalById(id) {
	$.ajax({
		url : 'http://localhost:8082/v1/terminal/' + id,
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

}
