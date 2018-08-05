package com.shall.customercomplaints.service;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.MerchantRollpaper;
import com.shall.customercomplaints.model.Rollpaper;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.repository.MerchantRollpaperRepository;
import com.shall.customercomplaints.repository.RollpaperRepository;
import com.shall.customercomplaints.repository.StoreRepository;

@Service
public class MerchantRollpaperService implements GenericService<MerchantRollpaper, Integer> {

	@Autowired
	private MerchantRollpaperRepository rollpaperRepository;


	@Autowired
	private DozerBeanMapper dozerMapper;
	
	
	@Override
	public CrudRepository<MerchantRollpaper, Integer> getRepository() {
		// TODO Auto-generated method stub
		return rollpaperRepository;
	}

	@Override
	public Integer getId(MerchantRollpaper entity) {
		return entity.getId();
	}

	public MerchantRollpaper updateStore(MerchantRollpaper merchantRollpaper) {
		MerchantRollpaper existingMerchantRollpaper = rollpaperRepository.findOne(merchantRollpaper.getId());
		if (existingMerchantRollpaper != null) {
			try {
				dozerMapper.map(merchantRollpaper, existingMerchantRollpaper);
				// PropertyUtils.copyProperties(merchantRollpaper,
				// existingMerchantRollpaper);
			} catch (Exception e) {
				e.printStackTrace();
			}
			MerchantRollpaper updatedMerchantRollpaper = rollpaperRepository.save(existingMerchantRollpaper);
			return updatedMerchantRollpaper;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}
}
