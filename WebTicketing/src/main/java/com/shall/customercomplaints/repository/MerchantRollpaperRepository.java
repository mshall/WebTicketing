package com.shall.customercomplaints.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.MerchantRollpaper;

@Repository
public interface MerchantRollpaperRepository extends JpaRepository<MerchantRollpaper, Integer> {

}
