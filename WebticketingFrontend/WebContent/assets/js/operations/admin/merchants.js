function getAllMerchants() {
	$.ajax({
		url : 'http://localhost:8082/v1/merchant/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAdminAllMerchants(response);
		}
	});
}
function processAdminAllMerchants(response) {
	console.log('merchant.processResponse -> Response: '
			+ JSON.stringify(response));

	var merchantsTable = $('#allMerchants');

	var output = "<div ><table id='merchantsTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Merchant name</th>"
			+ "<th>Active</th>"
			+ "<th>MCC</th>" + "<th>Class</th><th>Ops</th></tr></thead>";
	for ( var i in response.results) {
		var merchantId = response.results[i].merchantId;
		output += "<tr><td>"
				+ response.results[i].merchantName
				+ "</td><td>"
				+ response.results[i].status
				+ "</td>"
				+ "<td>"
				+ response.results[i].mcc
				+ "</td><td>"
				+ response.results[i].merchantClass
				+ "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='navigateToEditMerchant("
				+ merchantId
				+ ")'>Edit</button>"
				+ "<button type='button' class='btn btn-danger'>Delete</button>"
				+ "</td></tr>";
	}
	output += "</tbody></body></div>";

	merchantsTable.html(output);
	$('#merchantsTable').DataTable();
}

// ///////////////////////////////////////////////////////////////
function getMerchantById(id) {
	$.ajax({
		url : 'http://localhost:8082/v1/store/' + id,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetStoreByIdResponse(response);
		}
	});
}
function processGetStoreByIdResponse(response) {
	console.log('store.getStoreById -> Response: ' + response);
}

// ///////////////////////////////////////////////////
function navigateToEditMerchant(merchantId) {
	var editMerchant = "editMerchant.jsp?merchantId=" + merchantId;
	// window.alert('dont call automatically');
	window.location.replace(editMerchant);
}

function deleteMerchant(merchantId) {
	var deleteMerchant = "http://localhost:8082/v1/merchant/" + merchantId;
}

// ---------------------------------------------------------------------------------------------------
// ---------------------------- Edit merchant operations
// ---------------------------------------------
// ---------------------------------------------------------------------------------------------------

function populateEditMerchantForm(merchantId) {

}