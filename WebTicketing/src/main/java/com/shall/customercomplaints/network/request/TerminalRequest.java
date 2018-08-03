package com.shall.customercomplaints.network.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class TerminalRequest {
	private Integer terminalId;

	private int merchantId;

	private int storeId;

	private int firstSimSerial;

	private int secondSimSerial;

	private String currency;

	private String terminalClass;

	private String status;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private String deploymentDate;

	private String model;

	private String condition;

	private boolean sale;

	private boolean onlineRefund;

	private boolean offlineRefund;

	private boolean offlineSale;

	private boolean onlineVoid;

	private boolean offlineVoid;

	private boolean preauth;

	private boolean amex;

	private boolean installments;

	private boolean prepaidServices;

	private boolean diners;

	private boolean premuim;

	private boolean manualEntry;

	private int amexMerchantId, MCC, premiumMerchantId;
	private String  merchantAddress, merchantCity, contactNumber, branch;
}