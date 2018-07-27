package com.shall.customercomplaints.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Entity
public class Terminal {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "terminal_id")
	private Integer terminalId;

	private String model;
	@Column(name = "serial_number")
	private int serial_number;

	private String condition;
	private String status;
	private String currency;
	private String MCC;

	@Column(name = "terminal_class")
	private String terminalClass;
	private int sale;
	@Column(name = "online_returned")
	private int onlineReturned;
	@Column(name = "offline_returned")
	private int offlineReturned;
	@Column(name = "offline_sale")
	private int offlineSale;
	@Column(name = "online_void")
	private int onlineVoid;
	@Column(name = "offline_void")
	private int offlineVoid;
	private int preauth;
	private int amex;
	private String instatiment;
	private int prepaidservices;
	private int diners;
	private int premuim;
	@Column(name = "manual_entry")
	private int manualEntry;
	@Column(name = "store_id")
	private int storeId;
	@Column(name = "merchant_id")
	private int merchantId;
}