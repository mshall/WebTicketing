package com.shall.customercomplaints.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Sim;

@Repository
public interface SimRepository extends JpaRepository<Sim, Integer> {

	public List<Sim> findByStatus(boolean isDeployed);

	public List<Sim> findBySimCondition(boolean isUsed);

	public List<Sim> findByStoreId(int storeId);

	public Sim findByMerchantId(int merhcnatId);

	public Sim findByTerminalId(int terminalId);

	public List<Sim> findByOperator(String opertor);
}
