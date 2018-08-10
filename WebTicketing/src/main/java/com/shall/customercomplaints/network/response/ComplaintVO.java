package com.shall.customercomplaints.network.response;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Entity
public class ComplaintVO {

	@Id
	@GeneratedValue
	@Column(name = "complaint_id")
	private Long complaintId;

	@Column(name = "customer_email")
	private String customerEmail;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "complaint_opening_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date complaintOpeningTime;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "complaint_closing_time", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date complaintClosingTime;

	@Column(name = "status")
	private String status;

	private String comments;

	@Column(name = "merchant_id")
	private int merchantId;

	@Column(name = "terminal_id")
	private int terminalId;

	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "technician_id")
	private int technicianId;
	
	@Column(name = "complaint_solution")
	private String complaintSolution;
	
	@Column(name = "complaint_note")
	private String complaintNote;
	
}
