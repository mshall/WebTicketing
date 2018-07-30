function getAllComplaints(){
	
	$.ajax({
		url : 'http://localhost:8082/v1/complaint/all',
		type : 'GET',
		contentType : "application/json; charset=utf-8",
		data : {},
		dataType : 'json',
		success : function(response) {
			processResponse(response);
		}
	});
}
function processResponse(response){
	console.log(response);
	var ticketstable=$('#allTickets');
	
	var output="<div > <table id=\"allTicketsTable\" class=\"table responsive\" border=\"1\"> <thead> <tr><th> Ticket-id </th>" +
			"<th> Ticket-Date</th>" +
			"<th> Ticket-Details</th> " +
			"<th></th></tr></thead>";
	 for (var i in response.results)
	 {
	 output+="<tr><td>" + response.results[i].complaintId + "</td><td>" + response.results[i].complaintOpeningTime + "</td><td>" + response.results[i].comments + "</td><td>" + response.results[i].phoneNumber + "</td></tr>";
	 }
	 output+="</tbody></body></div>";

	 
	 
	ticketstable.html(output);

	$('#allTicketsTable').DataTable();
}