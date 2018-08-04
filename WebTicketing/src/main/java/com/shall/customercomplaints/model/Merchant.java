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
public class Merchant {
	@Id
	@Column(name = "merchant_id")
	private Integer merchantId;

	@Column(name = "merchant_name")
	private String merchantName;
	private String email;
	private int MCC;
	private boolean status;
	private String city;
	private String street;
	private String phone1;
	private String phone2;
	private String currancy;
	private String vendor;
	@Column(name = "contact_person")
	private String contactPerson;
	@Column(name = "amex_merchant_id")
	private int amexMerchantId;
	@Column(name = "premium_id")
	private int premiumId;
	@Column(name="class")
	private String merchantClass;
}