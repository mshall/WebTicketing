package com.shall.customercomplaints.service;

import java.util.List;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Complaint;
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
			Merchant existing = merchantRepository.findOne(merchant.getMerchantId());
			if (existing != null) {
				merchant.setMerchantId((existing.getMerchantId()));
				dozerMapper.map(merchant, existing);
				Merchant updatedMerchant = merchantRepository.save(existing);
				return updatedMerchant;
			} else {// This merchant doesn't exist
				return null;
			}
		} else {
			return null;
		}

	}

	public long countMerchants() {
		return merchantRepository.count();
	}
}
