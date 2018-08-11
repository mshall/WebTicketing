package com.shall.customercomplaints.service;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Rollpaper;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.repository.RollpaperRepository;
import com.shall.customercomplaints.repository.StoreRepository;

@Service
public class RollpaperService implements GenericService<Rollpaper, Integer> {

	@Autowired
	private RollpaperRepository rollpaperRepository;

	@Autowired
	private StoreRepository storeRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<Rollpaper, Integer> getRepository() {
		return rollpaperRepository;
	}

	@Override
	public Integer getId(Rollpaper entity) {
		return entity.getStoreId();
	}

	@Override
	public Rollpaper save(Rollpaper entity) {
		Store store = storeRepository.findOne(entity.getStoreId());
		if (store != null) {
			entity.setStoreName(store.getStoreName());
		}
		return GenericService.super.save(entity);
	}

	public Rollpaper updateRollpaper(Rollpaper rollpaper) {
		Rollpaper existingRollpaper = rollpaperRepository.findOne(rollpaper.getRollpaperId());
		if (existingRollpaper != null) {
			try {
				dozerMapper.map(rollpaper, existingRollpaper);
				// PropertyUtils.copyProperties(rollpaper, existingRollpaper);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Rollpaper updatedRollpaper = rollpaperRepository.save(existingRollpaper);
			return updatedRollpaper;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}
}
