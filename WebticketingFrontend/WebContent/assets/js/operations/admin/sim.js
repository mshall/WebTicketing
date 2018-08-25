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
		getSimApi(link+':8082/v1/sim/all');
}

///////////////////////////////////////////////
function getAllSimDeployed() {
	getSimApi(link+':8082/v1/sim/deployed');
}
////////////////////////////////////////////
function getAllSimStocked() {
	getSimApi(link+':8082/v1/sim/stocked');
}
////////////////////////////////////////////
function getAllSimUsed() {
	getSimApi(link+':8082/v1/sim/used');
}
////////////////////////////////////////////
function getAllSimNew() {
	getSimApi(link+':8082/v1/sim/new');
}
////////////////////////////////////////////

function processAllSimResponse(response) {
	console.log(response);
	var simDiv = $('#allSim');

	output = "";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].simSerial + "</td><td>"
				+ response.results[i].operator + "</td><td>"
				+ response.results[i].simCondition + "</td><td>"
				+ response.results[i].status + "</td><td>"
				+ response.results[i].storeName + "</td><td>"
				+ response.results[i].merchantName + "</td><td>"
				+ response.results[i].terminalId + "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='navigateToSimPage("
				+ response.results[i].simSerial
				+ ")'>Edit</button>"
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger'>Delete</button>"
				+ "</td></tr>";
				
	}
	output += "";
	simDiv.html(output);
	
	$('#simTable').DataTable();
}
/////////////////////////////////////////

function navigateToSimPage(simId) {
	window.location.replace("addSIM.jsp?simId=" + simId);
}
////////////////////////////////////////////
function getSimById() {
	$.ajax({
		url : link+':8082/v1/sim/' + $.urlParam('simId'),
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

	$("#simSerial").val(response.results.simSerial);
	$("#operator").val(response.results.operator);
	$("#simCondition").val(response.results.simCondition);
	$("#status").val(response.results.status);
	$("#storeId").val(response.results.storeId);
	$("#merchantId").val(response.results.merchantId);
	$("#terminalId").val(response.results.terminalId);

}

// //////////////////////////////////////////
function saveSim(url) {
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
	sendData(JSON.stringify(sim),url);

}
function sendData(data,url) {
	$.ajax({
		url : url,
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
		url : link+':8082/v1/sim/?operator='+operator,
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

	output = "<select id=\""+SimNo+"\"><option value=\"\">Select...</option>";
	for ( var i in response.results) {
		output += "<option value="+response.results[i].simSerial+">"+response.results[i].simSerial+"</option>";
	}
	output += "</select>";
	html_.html(output);
}




//////////////////////////////////////////////////////
$.urlParam = function(name) {
	var results = new RegExp('[\?&]' + name + '=([^]*)')
			.exec(window.location.href);
	if (results == null) {
		return null;
	} else {
		return results[1] || 0;
	}
}