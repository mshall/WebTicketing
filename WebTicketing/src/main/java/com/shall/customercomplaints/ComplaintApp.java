package com.shall.customercomplaints;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ComplaintApp implements CommandLineRunner {

	private static final Logger LOG = LoggerFactory.getLogger("JCG");

	public static void main(String[] args) {
		SpringApplication.run(ComplaintApp.class, args);
	}

	@Override
	public void run(String... strings) {
	}
}
