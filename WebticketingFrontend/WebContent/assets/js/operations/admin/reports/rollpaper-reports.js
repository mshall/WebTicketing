function getAllRollpapersForVendors() {

	$.ajax({
		url : link+':8082/v1/rollpaper/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllRollpapersForVendors(response);
		}
	});
}
function processGetAllRollpapersForVendors(response) {
	console
			.log("tickets-report.processGetAllComplaintsResponse--->"
					+ response);
	var ticketstable = $('#dAllRollpapersForVendors');
	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].storeName + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].totalIn + "</td><td>"
				+ response.results[i].out + "</td><td>"
				+ response.results[i].remaining + "</td><td>"
				+ response.results[i].actionDate + "</td></tr>";
	}
	output += "";

	ticketstable.html(output);

	$('#tAllRollpapers').DataTable();
}

// -------------------------------------------------------------------------------
// Get all rollpapers logs for merchants
// -------------------------------------------------------------------------------

function getAllRollpapersForMerchants() {

	$.ajax({
		url : link+':8082/v1/merchant-rollpaper/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetAllRollpapersForMerchants(response);
		}
	});
}
function processGetAllRollpapersForMerchants(response) {
	console
			.log("tickets-report.processGetAllComplaintsResponse--->"
					+ response);
	var ticketstable = $('#dAllRollpapersForMerchants');
	var output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].merchantName + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].rollpaperOutNumber + "</td><td>"
				+ response.results[i].meetSla + "</td><td>"
				+ response.results[i].note + "</td><td>"
				+ response.results[i].actionDate + "</td></tr>";
	}
	output += "";

	ticketstable.html(output);

	$('#tAllRollpapers').DataTable();
}