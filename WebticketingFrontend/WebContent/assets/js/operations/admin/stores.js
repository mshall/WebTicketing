function getAllStores() {

	$.ajax({
		url : 'http://localhost:8082/v1/store/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAdminAllStoresResponse(response);
		}
	});
}
function processAdminAllStoresResponse(response) {
	console.log('store.processResponse -> Response: ' + response);
	var storestable = $('#allStores');

	var output = "<div ><table class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Store-id</th>" + "<th>Store Name</th>"
			+ "<th>Address</th>" + "<th>Details</th></tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].storeId + "</td><td>"
				+ response.results[i].storeName + "</td>" + "<td>"
				+ response.results[i].store_address + "</td><td>"
				+ response.results[i].storeDetails + "</td></tr>";
	}
	output += "</tbody></body></div>";

	storestable.html(output);
}

// ///////////////////// Tickets History ////////////////

function getTicketsHistory() {

}