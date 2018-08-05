package com.shall.customercomplaints.service;

import org.apache.commons.beanutils.PropertyUtils;
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
	private DozerBeanMapper dozerMapper;
	
	@Override
	public CrudRepository<Rollpaper, Integer> getRepository() {
		// TODO Auto-generated method stub
		return rollpaperRepository;
	}

	@Override
	public Integer getId(Rollpaper entity) {
		return entity.getStoreId();
	}

	public Rollpaper updateRollpaper(Rollpaper rollpaper) {
		Rollpaper existingRollpaper = rollpaperRepository.findOne(rollpaper.getRollpaperId());
		if (existingRollpaper != null) {
			try {
				dozerMapper.map(rollpaper, existingRollpaper);
//				PropertyUtils.copyProperties(rollpaper, existingRollpaper);
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
