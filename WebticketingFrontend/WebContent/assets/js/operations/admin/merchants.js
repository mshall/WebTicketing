function getAllMerchants() {
	$.ajax({
		url : link+':8082/v1/merchant/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processAdminAllMerchants(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}
function processAdminAllMerchants(response) {
	console.log('merchant.processResponse -> Response: '
			+ JSON.stringify(response));

	var merchantsTable = $('#allMerchants');

	var output = "";
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
				+ "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger' onclick='deleteMerchant("
				+ merchantId
				+")'>Delete</button>"
				+ "</td></tr>";
	}
	output += "";

	merchantsTable.html(output);
	$('#merchantsTable').DataTable();
}

// ///////////////////////////////////////////////////
function navigateToEditMerchant(merchantId) {
	var editMerchant = "editMerchant.jsp?merchantId=" + merchantId;
	// window.alert('dont call automatically');
	window.location.replace(editMerchant);
}
//---------------------------------------------------------------------------------------------------
//----------------------------delete Merchant
//---------------------------------------------------------------------------------------------------
function deleteMerchant(merchantId) {
    var deleteObject = link+':8082/v1/merchant/' + merchantId;
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
//---------------------------------------------------------------------------------------------------
//---------------------------- Add merchant operations
//---------------------------------------------------------------------------------------------------
function addMerchant() {
	console.log("merchant.addMerchant -> Request merchant add");
	var itMerchantId = $("#itMerchantId").val();
	var itMerchantName = $("#itMerchantName").val();
	var itContactPerson = $("#itContactPerson").val();
	var itPhone1 = $("#itPhone1").val();
	var itPhone2 = $("#itPhone2").val();
	var itEmail = $("#itEmail").val();
	var itCity = $("#itCity").val();
	var itStreet = $("#itStreet").val();
	var itAmexMerchantId = $("#itAmexMerchantId").val();
	var itPremiumId = $("#itPremiumId").val();
	var itMCC = $("#itMCC").val();
	var sClass = $("#sClass").val();
	var sCurrency = $("#sCurrency").val();
	var sStatus = $("#sStatus").val();
	var status = false;
	if (sStatus == "active") {
		status = true;
	}
	var updateData = {
		"merchantId" : Number(itMerchantId),
		"merchantName" : itMerchantName,
		"email" : itEmail,
		"status" : status,
		"city" : itCity,
		"street" : itStreet,
		"phone1" : itPhone1,
		"phone2" : itPhone2,
		"vendor" : "Spectra",
		"contactPerson" : itContactPerson,
		"amexMerchantId" : itAmexMerchantId,
		"premiumId" : itPremiumId,
		"merchantClass" : sClass,
		"currency" : sCurrency,
		"mcc" : itMCC
	}
	sendAddMerchantData(JSON.stringify(updateData));

}

function sendAddMerchantData(data) {
	console.log('merchant.sendAddMerchantData -> Object: \n'+JSON.stringify(data));
	$.ajax({
		url : link+':8082/v1/merchant/',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processUpdateMerchantResponse(response);
		},
     error: function(data, textStatus, jqXHR) {
         handleAjaxError(data, textStatus, jqXHR);
     }
	});
}


// ---------------------------------------------------------------------------------------------------
// ---------------------------- Edit merchant operations
// ---------------------------------------------------------------------------------------------------
function updateMerchant() {
	console.log("merchant.updateMerchant -> Request merchant update");
	var itMerchantId = $("#itMerchantId").val();
	var itMerchantName = $("#itMerchantName").val();
	var itContactPerson = $("#itContactPerson").val();
	var itPhone1 = $("#itPhone1").val();
	var itPhone2 = $("#itPhone2").val();
	var itEmail = $("#itEmail").val();
	var itCity = $("#itCity").val();
	var itStreet = $("#itStreet").val();
	var itAmexMerchantId = $("#itAmexMerchantId").val();
	var itPremiumId = $("#itPremiumId").val();
	var itMCC = $("#itMCC").val();
	var sClass = $("#sClass").val();
	var sCurrency = $("#sCurrency").val();
	var sStatus = $("#sStatus").val();
	var status = false;
	if (sStatus == "active") {
		status = true;
	}
	var updateData = {
		"merchantId" : Number(itMerchantId),
		"merchantName" : itMerchantName,
		"email" : itEmail,
		"status" : status,
		"city" : itCity,
		"street" : itStreet,
		"phone1" : itPhone1,
		"phone2" : itPhone2,
		"vendor" : "Spectra",
		"contactPerson" : itContactPerson,
		"amexMerchantId" : itAmexMerchantId,
		"premiumId" : itPremiumId,
		"merchantClass" : sClass,
		"currency" : sCurrency,
		"mcc" : itMCC
	}
	sendUpdateMerchantData(JSON.stringify(updateData));

}

function sendUpdateMerchantData(data) {
	console.log('merchant.sendUpdateMerchantData -> Object: \n'+JSON.stringify(data));
	$.ajax({
		url : link+':8082/v1/merchant/update',
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processUpdateMerchantResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processUpdateMerchantResponse(response) {
	console.log('Return\n' + JSON.stringify(response));
	window.scrollTo(0, 0);
	if (response.code == 200) {
		$("#successUpdate").show();
		window.location.replace("Merchant.jsp");
	} else {
		$("#errorUpdate").show();
	}

}
//---------------------------------------------------------------------------------------------------
//----------------------------get merchant by id
//---------------------------------------------------------------------------------------------------

function getMerchantById(merchantId) {
	var merchantDetailsUrl = link+':8082/v1/merchant/' + merchantId;
	$.ajax({
		url : merchantDetailsUrl,
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processMerchantDetails(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});

}

function processMerchantDetails(response) {
	console.log("merchants.processMerchantDetails-> "
			+ JSON.stringify(response));

	$("#sClass").val('A');
	$("#sCurrency").val('USD');
	$("#sStatus").val('active');
	var itMerchantId = $("#itMerchantId");
	var itMerchantName = $("#itMerchantName");
	var itContactPerson = $("#itContactPerson");
	var itPhone1 = $("#itPhone1");
	var itPhone2 = $("#itPhone2");
	var itEmail = $("#itEmail");
	var itCity = $("#itCity");
	var itStreet = $("#itStreet");
	var itAmexMerchantId = $("#itAmexMerchantId");
	var itPremiumId = $("#itPremiumId");
	var itMCC = $("#itMCC");
	itMerchantId.val(response.results.merchantId);
	itMerchantName.val(response.results.merchantName);
	itContactPerson.val(response.results.contactPerson);
	itPhone1.val(response.results.phone1);
	itPhone2.val(response.results.phone2);
	itEmail.val(response.results.email);
	itCity.val(response.results.city);
	itStreet.val(response.results.street);
	itAmexMerchantId.val(response.results.amexMerchantId);
	itPremiumId.val(response.results.premiumId);
	itMCC.val(response.results.mcc);
}



//---------------------------- get merchant drop down list
//---------------------------------------------------------------------------------------------------

function getMerchantsDropdown(){
	$.ajax({
		url : link+':8082/v1/merchant/all/',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processMerchantsDDResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processMerchantsDDResponse(response) {
	console.log('merchant.processMerchantsDDResponse -> Response: ' + response);
	merchantList = $('#merchantList');

	output = "<select id='merchantId'><option value=\"\">Select...</option>";
	for ( var i in response.results) {
		output += "<option value="+response.results[i].merchantId+">"+response.results[i].merchantName+"</option>";
	}
	output += "</select>";
	merchantList.html(output);
}
