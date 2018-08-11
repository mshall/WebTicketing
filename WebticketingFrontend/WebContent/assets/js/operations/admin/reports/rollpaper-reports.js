function getAllRollpapersForVendors() {

	$.ajax({
		url : 'http://localhost:8082/v1/rollpaper/all',
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
	var output = "<div > <table id=\"tAllRollpapersForVendors\" class=\"table responsive\" border=\"1\"> <thead> "
			+ "<tr><th>Store Name</th>"
			+ "<th>Roll Size</th>"
			+ "<th>Total</th>"
			+ "<th>Out</th>"
			+ "<th>Rest</th>"
			+ "<th>Date</th>" + "</tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].storeName + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].totalIn + "</td><td>"
				+ response.results[i].out + "</td><td>"
				+ response.results[i].remaining + "</td><td>"
				+ response.results[i].actionDate + "</td></tr>";
	}
	output += "</tbody></body></div>";

	ticketstable.html(output);

	$('#tAllRollpapers').DataTable();
}

// -------------------------------------------------------------------------------
// Get all rollpapers logs for merchants
// -------------------------------------------------------------------------------

function getAllRollpapersForMerchants() {

	$.ajax({
		url : 'http://localhost:8082/v1/merchant-rollpaper/all',
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
	var output = "<div > <table id=\"tAllRollpapersForMerchants\" class=\"table responsive\" border=\"1\"> <thead> "
			+ "<tr><th>Merchant Name</th>"
			+ "<th>Roll Size</th>"
			+ "<th>Out</th>"
			+ "<th>Meet SLA</th>"
			+ "<th>Note</th>"
			+ "<th>Date</th>" + "</tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].merchantName + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].rollpaperOutNumber + "</td><td>"
				+ response.results[i].meetSla + "</td><td>"
				+ response.results[i].note + "</td><td>"
				+ response.results[i].actionDate + "</td></tr>";
	}
	output += "</tbody></body></div>";

	ticketstable.html(output);

	$('#tAllRollpapers').DataTable();
}