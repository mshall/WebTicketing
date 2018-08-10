package com.shall.customercomplaints.network.response;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Entity
public class TerminalVO {
	@Id
	@Column(name = "terminal_id")
	private Integer terminalId;

	@Column(name = "terminal_serial_number")
	private String terminalSerialNumber;

	@Column(name = "merchant_id")
	private int merchantId;

	@Column(name = "store_id")
	private int storeId;

	@Column(name = "first_sim_serial")
	private int firstSimSerial;

	@Column(name = "second_sim_serial")
	private int secondSimSerial;

	private String currency;

	@Column(name = "class")
	private String terminalClass;

	private String status;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "deployment_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date deploymentDate;

	private String model;

	@Column(name = "\"condition\"")
	private String condition;

	private boolean sale;

	@Column(name = "online_refund")
	private boolean onlineRefund;

	@Column(name = "offline_refund")
	private boolean offlineRefund;

	@Column(name = "offline_sale")
	private boolean offlineSale;

	@Column(name = "online_void")
	private boolean onlineVoid;

	@Column(name = "offline_void")
	private boolean offlineVoid;

	private boolean preauth;

	private boolean amex;

	private boolean installments;

	@Column(name = "prepaid_services")
	private boolean prepaidServices;

	private boolean diners;

	private boolean premuim;

	@Column(name = "manual_entry")
	private boolean manualEntry;

	private String branch;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "created_date", columnDefinition = "DATETIME(3)")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;
}