function getAllRollPapers() {
	$.ajax({
		url : 'http://localhost:8082/v1/rollpaper/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllRollPapersResponse(response);
		}
	});
}

function processAllRollPapersResponse(response) {
	console.log(response);
	var allRollPapers = $('#allRollPapers');

	var output = "<div ><table id='rollPapersTable' class=\"table responsive\" border=\"1\"> "
			+ "<thead> <tr><th>rollpaper Id</th>"
			+ "<th>rollpaper Size</th>"
			+ "<th>total In</th>"
			+ "<th>store Id</th>"
			+ "<th> </th>"
			+ " </tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].rollpaperId + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].totalIn + "</td><td>"
				+ response.results[i].storeId + "</td><td> Tender </td><td>"
				+ "<a href=\"#\" onclick=\"goToUpdateRollPage("
				+ response.results[i].rollpaperId + ")\" >edit</a></td></tr>";
	}
	output += "</tbody></body></div>";

	allRollPapers.html(output);

	$('#rollPapersTable').DataTable();
}

///////////////////////////////////////////////////
function goToUpdateRollPage(rollpaperId) {
	window.location.replace("RollUpdate.jsp?rollpaperId=" + rollpaperId);
}

/////////////////////////////////////////////////////
function getROllById() {
	$.ajax({
		url : 'http://localhost:8082/v1/rollpaper/' + $.urlParam('rollpaperId'),
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetRollByResponse(response);
		}
	});
}
function processGetRollByResponse(response) {
	console.log('processGetRollByResponse -> Response: '
			+ response);
	//$("#rollpaperId").val(response.rollpaperId);
	$("#rollpaperSize").val(response.rollpaperSize);
	$("#totalIn").val(response.totalIn);
	$("#storeId").val(response.storeId);
}

// ////////////////////////////////////////////////////
function addRoll() {
	var data = new FormData();
	//rollpaperId = $("#rollpaperId").val();
	rollpaperSize = $("#rollpaperSize").val();
	totalIn = $("#totalIn").val();
	storeId = $("#storeId").val();
	
	var terminal = {
		"rollpaperSize" : rollpaperSize,
		"totalIn" : totalIn,
		"storeId" : storeId
	}
	sendData(JSON.stringify(terminal), 'http://localhost:8082/v1/rollpaper/');

}

function processAddRollResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200) {
		window.location.replace("MerchantRP.jsp");
	} else {
		formMessage.css("color", "red");
	}
}

// /////////////////////////////////

function updateRoll() {
	var data = new FormData();
	rollpaperId = $("#rollpaperId").val();
	rollpaperSize = $("#rollpaperSize").val();
	totalIn = $("#totalIn").val();
	storeId = $("#storeId").val();
	
	var terminal = {
		"rollpaperId":rollpaperId,
		"rollpaperSize" : rollpaperSize,
		"totalIn" : totalIn,
		"storeId" : storeId
	}
	sendData(JSON.stringify(terminal),
			'http://localhost:8082/v1/rollpaper/update/');

}

function sendData(data, url) {
	console.log(data);
	$.ajax({
		url : url,
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processAddRollResponse(response);
		}
	});
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
