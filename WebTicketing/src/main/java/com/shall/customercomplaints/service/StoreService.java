package com.shall.customercomplaints.service;

import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.model.User;
import com.shall.customercomplaints.repository.StoreRepository;
import com.shall.customercomplaints.repository.UsersRepository;

@Service
public class StoreService implements GenericService<Store, Integer> {

	@Autowired
	private StoreRepository usersRepository;
	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<Store, Integer> getRepository() {
		// TODO Auto-generated method stub
		return usersRepository;
	}

	@Override
	public Integer getId(Store entity) {
		return entity.getStoreId();
	}

	public Store updateStore(Store store) {
		Store existingStore = usersRepository.findOne(store.getStoreId());
		if (existingStore != null) {
			try {
				existingStore = mapStore(store, existingStore);
				// dozerMapper.map(store, existingStore);
				// PropertyUtils.copyProperties(store, existingStore);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Store updatedStore = usersRepository.save(existingStore);
			return updatedStore;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}

	Store mapStore(Store source, Store target) {
		if (source.getStore_address() != null && !source.getStore_address().isEmpty()) {
			target.setStore_address(source.getStore_address());
		}
		if (source.getStoreDetails() != null && !source.getStoreDetails().isEmpty()) {
			target.setStoreDetails(source.getStoreDetails());
		}

		if (source.getStoreName() != null && !source.getStoreName().isEmpty()) {
			target.setStoreName(source.getStoreName());
		}
		return target;
	}
}
