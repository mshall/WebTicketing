function saveMerchantRoll(rollpaperId){
	console.log("saveMerchantRoll");
	var data = new FormData();
	merchantId = $("#merchantId").val();
	rollpaperOutNumber = $("#rollpaperOutNumber").val();
	meetSla = $("#meetSla").val();

	var merchantRoll = {
		"id":1,
		"rollpaperId" : rollpaperId,
		"merchantId" : merchantId,
		"rollpaperOutNumber" : rollpaperOutNumber,
		"meetSla" : meetSla
	}
	sendData(JSON.stringify(merchantRoll));

}


function sendData(data) {
	$.ajax({
		url : link+":8082/v1/merchant-rollpaper/",
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		data : data,
		dataType : 'json',
		success : function(response) {
			processSaveMerchantRollResponse(response);
		},
        error: function(data, textStatus, jqXHR) {
            handleAjaxError(data, textStatus, jqXHR);
        }
	});
}

function processSaveMerchantRollResponse(response){
	console.log('Return\n-------------->' + JSON.stringify(response));
	window.scrollTo(0, 0);
	if (response.code == 200) {
		$("#successUpdate").show();

	} else {
		$("#errorUpdate").show();
	}
}