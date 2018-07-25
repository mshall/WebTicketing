package com.shall.customercomplaints;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.service.GenericService;

@SpringBootApplication
public class ComplaintApp implements CommandLineRunner {

	private static final Logger LOG = LoggerFactory.getLogger("JCG");


	public static void main(String[] args) {
		SpringApplication.run(ComplaintApp.class, args);
	}

	@Override
	public void run(String... strings) {
		/*Complaint complaint = new Complaint(1L, "mohamed.s.elshall2011@gmail.com", LocalDateTime.now(),
				LocalDateTime.now(), false, "Initial comment on the first complaint");
		Complaint savedComplaint = complaintService.save(complaint);
		LOG.info("Complaint created in DB : {}", savedComplaint);*/
	}
}
