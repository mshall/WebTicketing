function getAllStores() {
	$.ajax({
		url : link+':8082/v1/store/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAdminAllStoresResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processAdminAllStoresResponse(response) {
	console.log('store.processResponse -> Response: ' + response);
	var storestable = $('#allStores');
	var output="";
	for ( var i in response.results) {
		output += "<tr><td>" + response.results[i].storeId + "</td><td>"
				+ response.results[i].storeName + "</td>" + "<td>"
				+ response.results[i].store_address + "</td><td>"
				+ response.results[i].storeDetails + "</td><td>"
				+ "<button type='button' class='btn btn-warning' onclick='navigateToEditStore("
				+ response.results[i].storeId
				+ ")'>Edit</button>"
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deleteStore("
				+ response.results[i].storeId
				+")'>Delete</button>"
				+ "</td></tr>";
	}
	storestable.html(output);

	$('#storesTable').DataTable();
}
//---------------------------------------------------------------------------------------------------
//----------------------------navigate to edit store
//---------------------------------------------------------------------------------------------------
function navigateToEditStore(storeId) {
	var editStore = "addstore.jsp?storeId=" + storeId;
	window.location.replace(editStore);
}

//---------------------------------------------------------------------------------------------------
//----------------------------delete store
//---------------------------------------------------------------------------------------------------
function deleteStore(storeId) {
	var deleteObject = link+':8082/v1/store/' + storeId;
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
// ---------------------------------------------------------------------------------------------------
// ---------------------------- get store by id
// ---------------------------------------------------------------------------------------------------
function getStoreById(storeId) {
	$.ajax({
		url : link+':8082/v1/store/' + storeId,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processGetStoreByIdResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processGetStoreByIdResponse(response) {
	console.log('store.getStoreById -> Response: ' + response);
	$("#storeId").val(response.results.storeId);
	$("#storeName").val(response.results.storeName);
	$("#store_address").val(response.results.store_address);
	$("#storeDetails").val(response.results.storeDetails);
	
	$("#status").val(response.results.status);
}

//---------------------------------------------------------------------------------------------------
//---------------------------- add/edit store
//---------------------------------------------------------------------------------------------------
function addStore() {
	var data = new FormData();
//	storeId=$("#storeId").val();
	storeName=$("#storeName").val();
	store_address=$("#store_address").val();
	storeDetails=$("#storeDetails").val();

	
	var terminal = {
//		"storeId":storeId,
		"storeName":storeName,
		"store_address":store_address,
		"storeDetails":storeDetails,
		
	}
	sendDataSaveStore(JSON.stringify(terminal), link+':8082/v1/store/');

}

function sendDataSaveStore(data, url_new) {
	console.log(data);
	console.log(url_new);
	$.ajax({
		url : url_new,
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processSaveStoreResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processSaveStoreResponse(response) {
	console.log(response);
	var formMessage = $("#form-message");
	var code = response.code;
	var message = response.message;
	var results = response.results;

	// ----
	formMessage.text(message);

	if (code == 200||code == 0) {
		window.location.replace("Store.jsp");
	} else {
		formMessage.css("color", "red");
	}
}


function updateStore() {
	var data = new FormData();
	storeId=$("#storeId").val();
	storeName=$("#storeName").val();
	store_address=$("#store_address").val();
	storeDetails=$("#storeDetails").val();
	
	var terminal = {
		"storeId":storeId,
		"storeName":storeName,
		"store_address":store_address,
		"storeDetails":storeDetails,
		
	}
	sendDataSaveStore(JSON.stringify(terminal), link+':8082/v1/store/update');
}

//---------------------------- get store drop down list
//---------------------------------------------------------------------------------------------------

function getStoresDropdown(){
	$.ajax({
		url : link+':8082/v1/store/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processStoresDDResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processStoresDDResponse(response) {
	console.log('store.getStoresDropdown -> Response: ' + response);
	storesList = $('#storesList');

	output = "<select id=\"storeId\"><option value=\"\">Select...</option>";
	for ( var i in response.results) {
		output += "<option value="+response.results[i].storeId+">"+response.results[i].storeName+"</option>";
	}
	output += "</select>";
	storesList.html(output);
}
