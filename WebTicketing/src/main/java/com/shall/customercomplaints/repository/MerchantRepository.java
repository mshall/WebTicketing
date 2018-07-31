package com.shall.customercomplaints.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Merchant;

@Repository
public interface MerchantRepository extends JpaRepository<Merchant, Integer> {

	public List<Merchant> findByMerchantName(String merchantName);

	public Merchant findByEmail(String email);

	public List<Merchant> findByStatus(boolean status);

	public List<Merchant> findByPhone1(String phone1);

	public List<Merchant> findByPhone2(String phone2);

}
