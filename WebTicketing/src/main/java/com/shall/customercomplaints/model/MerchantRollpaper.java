package com.shall.customercomplaints.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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

	private int remaining;

	@Column(name = "meet_sla")
	private String meetSla;

	private String note;

	@Column(name = "merchant_name")
	private String merchantName;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "action_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date actionDate;

	@Column(name = "rollpaper_size")
	private String rollpaperSize;
}