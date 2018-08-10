package com.shall.customercomplaints.network.response;

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
public class RollpaperVO {
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

}