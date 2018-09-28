//var link="http://210.3.29.89";
var link="http://localhost";
function getURLParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}
	}
}

function handleAjaxError(data, textStatus, jqXHR) {
	console.log('handleAjaxError');
	$("#errorUpdate").append("<b></b>");
	$("#errorUpdate").show();
	console.log("data:"+data);
	console.log("textStatus:"+textStatus);
	console.log("jqXHR:"+jqXHR);
}

function processDeleteResponse(response) {
    console.log('Return\n' + JSON.stringify(response));
    window.scrollTo(0, 0);
    if (response.code == 200 ||response.code == 0) {
        $("#successUpdate").show();
    } else {
        $("#errorUpdate").show();
    }
    window.location.reload(true);
}