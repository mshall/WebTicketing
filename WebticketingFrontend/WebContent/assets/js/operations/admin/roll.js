function getAllRollPapers() {
	$.ajax({
		url : link+':8082/v1/rollpaper/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAllRollPapersResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
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
			+ "<th>remaining</th>"
			+ "<th>store Id</th>"
			+ "<th>Tender</th>"
			+ "<th> </th>"
			+ " </tr></thead>";
	for ( var i in response.results) {
		output += "<tr><td><input type=\"checkbox\" value='"+response.results[i].rollpaperId+"' />" 
				+ response.results[i].rollpaperId + "</td><td>"
				+ response.results[i].rollpaperSize + "</td><td>"
				+ response.results[i].totalIn + "</td><td>"
				+ response.results[i].remaining + "</td><td>"
				+ response.results[i].storeName + "</td><td> Tender </td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='goToUpdateRollPage("
				+ response.results[i].rollpaperId
				+ ")'>Edit</button>"
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deleteRoll("+
            	+ response.results[i].rollpaperId
            	+")'>Delete</button>"
				+ "</td></tr>";
	}
	output += "</tbody></body></div>";

	allRollPapers.html(output);

	$('#rollPapersTable').DataTable();
}

///////////////////////////////////////////////////
function goToUpdateRollPage(rollpaperId) {
	window.location.replace("addRollPaper.jsp?rollpaperId=" + rollpaperId);
}

/////////////////////////////////////////////////////
function getROllById(rollpaperId) {
	$.ajax({
		url : link+':8082/v1/rollpaper/' + rollpaperId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetRollByResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processGetRollByResponse(response) {
	console.log('processGetRollByResponse -> Response: '
			+ response);
	$("#rollpaperId").val(response.results.rollpaperId);
	$("#rollpaperSize").val(response.results.rollpaperSize);
	$("#totalIn").val(response.results.totalIn);
	$("#storeId").val(response.results.storeId);
	$("#remaining").val(response.results.remaining);
	$("#out").val(response.results.out);
}

// ////////////////////////////////////////////////////
function addRoll() {
	var data = new FormData();
	//rollpaperId = $("#rollpaperId").val();
	rollpaperSize = $("#rollpaperSize").val();
	totalIn = $("#totalIn").val();
	storeId = $("#storeId").val();
	remaining = $("#remaining").val();
	out = $("#out").val();
	var terminal = {
		"rollpaperSize" : rollpaperSize,
		"totalIn" : totalIn,
		"storeId" : storeId,
		"remaining":remaining,
		"out":out
	}
	sendData(JSON.stringify(terminal), link+':8082/v1/rollpaper/');

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
	remaining = $("#remaining").val();
	out = $("#out").val();
	
	var terminal = {
		"rollpaperId":rollpaperId,
		"rollpaperSize" : rollpaperSize,
		"totalIn" : totalIn,
		"storeId" : storeId,
		"remaining":remaining,
		"out":out
	}
	sendData(JSON.stringify(terminal),
			link+':8082/v1/rollpaper/update/');

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
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
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
//---------------------------------------------------------------------------------------------------
//----------------------------delete roll
//---------------------------------------------------------------------------------------------------
function deleteRoll(rollId) {
    var deleteObject = link+':8082/v1/rollId/' + rollId;
    $.ajax({
        url : deleteObject,
        type : 'DELETE',
        contentType : "application/json; charset=utf-8",
        data : {},
        dataType : 'json',
        success : function(response) {
            processDeleteResponse(response);
        },
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
    });
}