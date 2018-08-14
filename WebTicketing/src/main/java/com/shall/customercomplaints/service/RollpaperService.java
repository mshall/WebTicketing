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
				existingRollpaper = mapRollpaper(rollpaper, existingRollpaper);
				// dozerMapper.map(rollpaper, existingRollpaper);
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

	Rollpaper mapRollpaper(Rollpaper source, Rollpaper target) {
		if (source.getActionDate() != null) {
			target.setActionDate(source.getActionDate());
		}
		if (source.getOut() > 0) {
			target.setOut(source.getOut());
		}
		if (source.getRemaining() > 0) {
			target.setRemaining(source.getRemaining());
		}
		if (source.getRollpaperId() > 0) {
			target.setRollpaperId(source.getRollpaperId());
		}
		if (source.getRollpaperSize() != null && !source.getRollpaperSize().isEmpty()) {
			target.setRollpaperSize(source.getRollpaperSize());
		}
		if (source.getStoreId() > 0) {
			target.setStoreId(source.getStoreId());
		}
		if (source.getStoreName() != null && !source.getStoreName().isEmpty()) {
			target.setStoreName(source.getStoreName());
		}
		if (source.getTotalIn() > 0) {
			target.setTotalIn(source.getTotalIn());
		}
		return target;
	}
}
