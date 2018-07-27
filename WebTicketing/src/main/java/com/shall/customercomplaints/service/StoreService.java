package com.shall.customercomplaints.service;

import java.util.List;

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
			store.setStoreId(existingStore.getStoreId());
			Store updatedStore = usersRepository.save(store);
			return updatedStore;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}
}
