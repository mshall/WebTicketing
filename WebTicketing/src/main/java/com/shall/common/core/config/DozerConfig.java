package com.shall.common.core.config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.dozer.CustomConverter;
import org.dozer.DozerBeanMapper;
import org.dozer.loader.api.BeanMappingBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.shall.customercomplaints.model.Complaint;
import static org.dozer.loader.api.TypeMappingOptions.mapNull;
import static org.dozer.loader.api.TypeMappingOptions.mapEmptyString;

@Configuration
public class DozerConfig {
	@Bean(name = "org.dozer.Mapper")
	public DozerBeanMapper dozerBean() {
		List<CustomConverter> converters = new ArrayList<>();
		converters.add(new IfNotBlankConverter());
		converters.add(new IfNotNullConverter());
		List<String> mappingFiles = Arrays.asList("dozer-bean-mappings.xml");
		DozerBeanMapper dozerBean = new DozerBeanMapper();
		dozerBean.setCustomConverters(converters);
		// dozerBean.addMapping(beanMappingBuilder());
		// dozerBean.setMappingFiles(mappingFiles);
		return dozerBean;
	}

	public BeanMappingBuilder beanMappingBuilder() {
		return new BeanMappingBuilder() {
			@Override
			protected void configure() {
				mapping(Complaint.class, Complaint.class, mapNull(false), mapEmptyString(false));
			}
		};
	}
}