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
	console.log('technician.processAllTechnicians -> Response: '
			+ JSON.stringify(response));
	var technicalTable = $('#allTechnicals');

	var output = "<div ><table id='techniciansTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Technician id</th>"
			+ "<th>username</th>"
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

// -------------------------------------------------------------------------------------
// ---------------------------------------- Get technician list
// -------------------------------------------------------------------------------------
function getAllTechniciansForTicketing() {

	$.ajax({
		url : 'http://localhost:8082/v1/user/all/technician',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllTechniciansSelect(response);
		}
	});
}
function processAllTechniciansSelect(response) {
	console.log("technician.processAllTechniciansSelect -> Response:\n"
			+ JSON.stringify(response));
	var dTechnicians = $("#dTechnicians");
	var output = "<div><select name='sTechnicians' id='sTechnicians' style='width:150px;'>";
	for ( var i in response.results) {
		output += " <option value='" + response.results[i].userId + "'>"
				+ response.results[i].username + "</option>"
	}
	output += "</select> </div>";
	dTechnicians.html(output);
}
