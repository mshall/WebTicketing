package com.shall.customercomplaints.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.common.core.config.MyBeanUtils;
import com.shall.customercomplaints.model.Merchant;
import com.shall.customercomplaints.repository.MerchantRepository;

@Service
public class MerchantService implements GenericService<Merchant, Integer> {

	@Autowired
	private MerchantRepository merchantRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<Merchant, Integer> getRepository() {
		return merchantRepository;
	}

	@Override
	public Integer getId(Merchant entity) {
		return entity.getMerchantId();
	}

	@Override
	public Merchant save(Merchant entity) {
		return GenericService.super.save(entity);
	}

	public List<Merchant> findByPhone1(String phone1) {
		return merchantRepository.findByPhone1(phone1);
	}

	public List<Merchant> findByPhone2(String phone2) {
		return merchantRepository.findByPhone2(phone2);
	}

	public Merchant findByEmail(String email) {
		return merchantRepository.findByEmail(email);
	}

	public Merchant updateMerchant(Merchant merchant) {
		if (merchant.getMerchantId() != null) {
			Merchant existingMerchant = merchantRepository.findOne(merchant.getMerchantId());
			if (existingMerchant != null) {
				/*
				 * if(merchant.getAmexMerchantId() != null){
				 * existingMerchant.setAmexMerchantId(merchant.getAmexMerchantId
				 * ()); } if(merchant.getCity() != null){
				 * existingMerchant.setCity(merchant.getCity()); }
				 * if(merchant.getContactPerson() != null){
				 * 
				 * }
				 */
				try {
					existingMerchant = mapMerchant(merchant, existingMerchant);
					// MyBeanUtils.copyPropertiesNotNull(existingMerchant,
					// merchant);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// dozerMapper.map(merchant, existingMerchant);
				Merchant updatedMerchant = merchantRepository.save(existingMerchant);
				return updatedMerchant;
			} else {// This merchant doesn't exist
				return null;
			}
		} else {
			return null;
		}

	}

	Merchant mapMerchant(Merchant source, Merchant target) {
		if (source.getAmexMerchantId() != null && !source.getAmexMerchantId().isEmpty()) {
			target.setAmexMerchantId(source.getAmexMerchantId());
		}
		if (source.getCity() != null && !source.getCity().isEmpty()) {
			target.setCity(source.getCity());
		}
		if (source.getContactPerson() != null && !source.getContactPerson().isEmpty()) {
			target.setContactPerson(source.getContactPerson());
		}
		if (source.getCurrency() != null && !source.getCurrency().isEmpty()) {
			target.setCurrency(source.getCurrency());
		}
		if (source.getEmail() != null && !source.getEmail().isEmpty()) {
			target.setEmail(source.getEmail());
		}
		if (source.getMCC() != null && !source.getMCC().isEmpty()) {
			target.setMCC(source.getMCC());
		}
		if (source.getMerchantClass() != null && !source.getMerchantClass().isEmpty()) {
			target.setMerchantClass(source.getMerchantClass());
		}
		if (source.getMerchantId() > 0) {
			target.setMerchantId(source.getMerchantId());
		}

		if (source.getMerchantName() != null && !source.getMerchantName().isEmpty()) {
			target.setMerchantName(source.getMerchantName());
		}

		if (source.getPhone1() != null && !source.getPhone1().isEmpty()) {
			target.setPhone1(source.getPhone1());
		}

		if (source.getPhone2() != null && !source.getPhone2().isEmpty()) {
			target.setPhone2(source.getPhone2());
		}

		if (source.getPremiumId() != null && !source.getPremiumId().isEmpty()) {
			target.setPremiumId(target.getPremiumId());
		}

		if (source.getStreet() != null && !source.getStreet().isEmpty()) {
			target.setStreet(source.getStreet());
		}
		if (source.getVendor() != null && !source.getVendor().isEmpty()) {
			target.setVendor(source.getVendor());
		}
		return target;
	}

	public long countMerchants() {
		return merchantRepository.count();
	}
}
