package com.shall.customercomplaints.service;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.MerchantRollpaper;
import com.shall.customercomplaints.model.Rollpaper;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.model.User;
import com.shall.customercomplaints.repository.MerchantRollpaperRepository;
import com.shall.customercomplaints.repository.RollpaperRepository;
import com.shall.customercomplaints.repository.StoreRepository;

@Service
public class MerchantRollpaperService implements GenericService<MerchantRollpaper, Integer> {

	@Autowired
	private MerchantRollpaperRepository merchantRollpaperRepository;

	@Autowired
	private RollpaperRepository rollpaperRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<MerchantRollpaper, Integer> getRepository() {
		// TODO Auto-generated method stub
		return merchantRollpaperRepository;
	}

	@Override
	public Integer getId(MerchantRollpaper entity) {
		return entity.getId();
	}

	@Override
	public MerchantRollpaper save(MerchantRollpaper entity) {
		MerchantRollpaper savedUser = merchantRollpaperRepository.findOne(entity.getId());
		if (savedUser == null) {

			// ------------- Now also update the rollpaper entity to decerease
			// the amount of ordered rollpapers
			Rollpaper rollpaper = rollpaperRepository.findOne(entity.getRollpaperId());
			int rollpapersCount = rollpaper.getTotalIn();
			rollpapersCount = rollpapersCount - entity.getRollpaperOutNumber();
			rollpaper.setTotalIn(rollpapersCount);
			rollpaperRepository.save(rollpaper);
			return GenericService.super.save(entity);
		} else {
			return null;
		}

	}

	public MerchantRollpaper updateStore(MerchantRollpaper merchantRollpaper) {
		MerchantRollpaper existingMerchantRollpaper = merchantRollpaperRepository.findOne(merchantRollpaper.getId());
		if (existingMerchantRollpaper != null) {
			try {
				dozerMapper.map(merchantRollpaper, existingMerchantRollpaper);
				// PropertyUtils.copyProperties(merchantRollpaper,
				// existingMerchantRollpaper);
			} catch (Exception e) {
				e.printStackTrace();
			}
			MerchantRollpaper updatedMerchantRollpaper = merchantRollpaperRepository.save(existingMerchantRollpaper);
			return updatedMerchantRollpaper;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}
}
