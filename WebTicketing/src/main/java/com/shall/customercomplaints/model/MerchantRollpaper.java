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
public class MerchantRollpaper {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "roll_paper_id")
	private int rollpaperId;

	@Column(name = "merchant_id")
	private int merchantId;

	@Column(name = "roll_paper_out_number")
	private int rollpaperOutNumber;

	@Column(name = "meet_sla")
	private String meetSla;

	private String note;

}