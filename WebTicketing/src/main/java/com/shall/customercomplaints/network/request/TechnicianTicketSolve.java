package com.shall.customercomplaints.network.request;

import lombok.Data;

@Data
public class TechnicianTicketSolve {

	int complaintId, technicianId;
	String note, comment;
}
