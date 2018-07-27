package com.shall.customercomplaints.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {

}
