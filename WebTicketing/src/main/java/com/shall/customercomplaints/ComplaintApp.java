package com.shall.customercomplaints;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication

@ComponentScan(basePackages = { "com.shall.common.core.config", "com.shall.common.core.exception",
		"com.shall.customercomplaints" })
public class ComplaintApp implements CommandLineRunner {

	private static final Logger LOG = LoggerFactory.getLogger("JCG");

	public static void main(String[] args) {
		SpringApplication.run(ComplaintApp.class, args);
	}

	@Override
	public void run(String... strings) {
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurerAdapter() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedOrigins("*").allowedMethods("*").allowedHeaders("*");
			}
		};
	}
}
