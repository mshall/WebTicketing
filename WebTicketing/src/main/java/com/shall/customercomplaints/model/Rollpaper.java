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
public class Rollpaper {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "roll_paper_id")
	private Integer rollpaperId;

	@Column(name = "roll_paper_size")
	private String rollpaperSize;

	@Column(name = "total_in")
	private int totalIn;

	@Column(name = "store_id")
	private int storeId;

	@Column(name = "store_name")
	private String storeName;

	private int out;

	private int remaining;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "action_date", columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date actionDate;

}