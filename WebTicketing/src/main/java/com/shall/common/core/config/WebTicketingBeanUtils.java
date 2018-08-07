package com.shall.common.core.config;

import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

public class WebTicketingBeanUtils {

	public static String[] getNullPropertyNames(Object source) {
		final BeanWrapper src = new BeanWrapperImpl(source);
		java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

		Set<String> emptyNames = new HashSet<String>();
		for (java.beans.PropertyDescriptor pd : pds) {
			Object srcValue = src.getPropertyValue(pd.getName());
			if (srcValue == null)
				emptyNames.add(pd.getName());
		}
		String[] result = new String[emptyNames.size()];
		return emptyNames.toArray(result);
	}

	// then use Spring BeanUtils to copy and ignore null
	public static void myCopyProperties(Object src, Object target) {

		BeanUtils.copyProperties(src, target, getNullPropertyNames(src));
	}

	// ---------------------------- Generic way to read params and via
	// reflection
	public static <T> void copyFields(T source, T target) throws Exception {
		Class<?> clazz = source.getClass();

		for (Field field : clazz.getFields()) {
			Object value = field.get(source);
			if (value != null) {
				field.set(target, value);
			}

		}
	}
	
	
	
}
