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
public class Sim {
	@Id
	@Column(name = "sim_serial")
	private Integer simSerial;

	private String operator;
	/*
	 * 0 -> New | 1 -> Used
	 */
	@Column(name = "sim_condition")
	private boolean simCondition;

	/*
	 * 0 -> Stocked | 1 -> Deployed
	 */
	private boolean status;

	@Column(name = "store_id")
	private int storeId;

	@Column(name = "merchant_id")
	private int merchantId;

	@Column(name = "terminal_id")
	private int terminalId;

}