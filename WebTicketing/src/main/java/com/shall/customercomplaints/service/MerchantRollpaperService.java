package com.shall.customercomplaints.service;

import java.util.Date;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Merchant;
import com.shall.customercomplaints.model.MerchantRollpaper;
import com.shall.customercomplaints.model.Rollpaper;
import com.shall.customercomplaints.repository.MerchantRepository;
import com.shall.customercomplaints.repository.MerchantRollpaperRepository;
import com.shall.customercomplaints.repository.RollpaperRepository;

@Service
public class MerchantRollpaperService implements GenericService<MerchantRollpaper, Integer> {

	@Autowired
	private MerchantRollpaperRepository merchantRollpaperRepository;

	@Autowired
	private MerchantRepository merchantRepository;

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
			entity = updateRollpaper(entity);
			entity = updateMerchantRollpaperEntity(entity);
			return GenericService.super.save(entity);
		} else {
			return null;
		}

	}

	/*
	 * This method is to add extra info like: merhcnat name & action date
	 * 
	 * @param MerchantRollpaper
	 */
	private MerchantRollpaper updateMerchantRollpaperEntity(MerchantRollpaper entity) {
		Merchant merchant = merchantRepository.findOne(entity.getMerchantId());
		if (merchant != null) {
			entity.setMerchantName(merchant.getMerchantName());
		}
		entity.setActionDate(new Date());
		return entity;
	}

	/*
	 * This method is to update the rollpaper by adding some needed fields for
	 * logging
	 * 
	 * @param MerchantRollpaper
	 */
	private MerchantRollpaper updateRollpaper(MerchantRollpaper entity) {
		// the amount of ordered rollpapers
		Rollpaper rollpaper = rollpaperRepository.findOne(entity.getRollpaperId());
		if (rollpaper != null) {
			// Get the rollpaper size and add it to the entity
			entity.setRollpaperSize(rollpaper.getRollpaperSize());
			// ---------- Update the rollpaper entity
			int rollpapersCount = rollpaper.getTotalIn();
			int out = entity.getRollpaperOutNumber();
			int remaining = rollpapersCount - out;
			rollpaper.setOut(out);
			rollpaper.setRemaining(remaining);
			rollpaper.setActionDate(new Date());
			rollpaperRepository.save(rollpaper);
		}
		return entity;
	}

	@Override
	public MerchantRollpaper update(MerchantRollpaper merchantRollpaper) {
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
