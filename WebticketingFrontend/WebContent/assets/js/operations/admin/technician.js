function manageTechnicians() {

	$.ajax({
		url : 'http://localhost:8082/v1/user/all/technician',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTechnicians(response);
		}
	});
}
function processAllTechnicians(response) {
	console.log('technician.processAllTechnicians -> Response: ' + JSON.stringify(response));
	var technicalTable = $('#allTechnicals');

	var output = "<div ><table id='techniciansTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Technician id</th>" + "<th>username</th>"
			+ "<th>email</th>" + "</tr></thead><tbody>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].userId + "</td><td>"
				+ response.results[i].username + "</td>" + "<td>"
				+ response.results[i].email + "</td>";
	}
	output += "</tbody></div>";

	technicalTable.html(output);
	$('#techniciansTable').DataTable();
}
