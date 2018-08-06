package com.shall.customercomplaints.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shall.customercomplaints.model.Complaint;

@Repository
public interface ComplaintsRepository extends JpaRepository<Complaint, Long> {

	public List<Complaint> findByCustomerEmail(String emaill);

	public List<Complaint> findByPhoneNumber(String phoneNumber);

	public List<Complaint> findByMerchantId(int merchantId);

	public List<Complaint> findByTerminalId(int terminalId);

	public List<Complaint> findByStatus(String status);

	public List<Complaint> findByTechnicianId(int technicianId);
}
