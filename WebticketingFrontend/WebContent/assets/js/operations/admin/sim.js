function getSimApi(apiUrl) {
	console.log(apiUrl);
	$.ajax({
		url : apiUrl,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			//console.log(response);
			processAllSimResponse(response);
		}
	});
}
// ///////////////////////////////////////////

function getAllSim() {
		getSimApi('http://localhost:8082/v1/sim/all');
}

///////////////////////////////////////////////
function getAllSimDeployed() {
	getSimApi('http://localhost:8082/v1/sim/deployed');
}
////////////////////////////////////////////
function getAllSimStocked() {
	getSimApi('http://localhost:8082/v1/sim/stocked');
}
////////////////////////////////////////////
function getAllSimUsed() {
	getSimApi('http://localhost:8082/v1/sim/used');
}
////////////////////////////////////////////
function getAllSimNew() {
	getSimApi('http://localhost:8082/v1/sim/new');
}
////////////////////////////////////////////

function processAllSimResponse(response) {
	console.log(response);
	var simtable = $('#allSim');

	output = "<div ><table id=\"simTable\" class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>Sim Serial</th>"
			+ "<th>operator</th>"
			+ "<th>Sim Condition</th>"
			+ "<th>status</th>"
			+ +"<th>Store</th>"
			+ "<th>merchant</th>" 
			+ "<th>terminal</th>" +
					" <th> edit </th></tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].simSerial + "</td><td>"
				+ response.results[i].operator + "</td><td>"
				+ response.results[i].simCondition + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ response.results[i].storeId + "</td><td>"
				+ response.results[i].merchantId + "</td><td>"
				+ response.results[i].terminalId + "</td>" +
				+"<td><a href='#' onclick=''> edit </a></td></tr>";
	}
	output += "</tbody></body></div>";
	console.log($('#allSim').html());
	$('#allSim').html(output);
	
	$('#simTable').DataTable();
}

////////////////////////////////////////////
function getSimById(id) {
	$.ajax({
		url : 'http://localhost:8082/v1/sim/' + id,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetSimByResponse(response);
		}
	});
}
function processGetSimByResponse(response) {
	console.log('sim.processGetSimByResponse -> Response: ' + response);

	$("#simSerial").val(response.simSerial);
	$("#operator").val(response.operator);
	$("#simCondition").val(response.simCondition);
	$("#status").val(response.status);
	$("#storeId").val(response.storeId);
	$("#merchantId").val(response.merchantId);
	$("#terminalId").val(response.terminalId);

}

// //////////////////////////////////////////
function saveSim() {
	var data = new FormData();

	var simSerial = $("#simSerial").val();
	var operator = $("#operator").val();
	var simCondition = $("#simCondition").val();
	var status = $("#status").val();
	var storeId = $("#storeId").val();
	var merchantId = $("#merchantId").val();
	var terminalId = $("#terminalId").val();
	var sim = {
		"simSerial" : simSerial,
		"operator" : operator,
		"simCondition" : simCondition,
		"status" : status,
		"storeId" : storeId,
		"merchantId" : merchantId,
		"terminalId" : terminalId
	}
	sendData(JSON.stringify(sim));

}
function sendData(data) {
	$.ajax({
		url : 'http://localhost:8082/v1/sim/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processSaveSimResponse(response);
		}
	});
}

function processSaveSimResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
		window.location.replace("SIM.jsp");
	} else {
		formMessage.css("color", "red");
	}
}

// /////////////////////////////////
function getSimByOperatorDropdown(operator,divId,SimNo){
	$.ajax({
		url : 'http://localhost:8082/v1/sim/?operator='+operator,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processSimDDResponse(response,divId,SimNo);
		}
	});
}

function processSimDDResponse(response,divId,SimNo) {
	console.log('processSimDDResponse -> Response: ' + response);
	html_ = $('#'+divId+"");

	output = "<select id=\""+SimNo+"\"><option value=\"none\"></option>";
	for ( var i in response.results) {
		output += "<option value="+response.results[i].simSerial+">"+response.results[i].simSerial+"</option>";
	}
	output += "</select>";
	html_.html(output);
}
