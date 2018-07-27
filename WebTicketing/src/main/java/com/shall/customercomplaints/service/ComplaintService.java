package com.shall.customercomplaints.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.model.User;
import com.shall.customercomplaints.repository.ComplaintsRepository;

import java.util.List;

@Service
public class ComplaintService implements GenericService<Complaint, Long> {

	@Autowired
	private ComplaintsRepository complaintsRepository;

	@Override
	public CrudRepository<Complaint, Long> getRepository() {
		// TODO Auto-generated method stub
		return complaintsRepository;
	}

	@Override
	public Long getId(Complaint entity) {
		return entity.getComplaintId();
	}

	@Override
	public Complaint save(Complaint entity) {
		return GenericService.super.save(entity);
	}

	public List<Complaint> findByCustomerEmail(String email) {
		return complaintsRepository.findByCustomerEmail(email);
	}

	public List<Complaint> findByPhoneNumber(String phoneNumber) {
		return complaintsRepository.findByPhoneNumber(phoneNumber);
	}

	public List<Complaint> findByTerminalId(int termianlId) {
		return complaintsRepository.findByTerminalId(termianlId);
	}

	public List<Complaint> findByMerchantId(int merchantId) {
		return complaintsRepository.findByMerchantId(merchantId);
	}

	public Complaint updateComplaint(Complaint complaint) {
		if(complaint.getComplaintId()!=null){
			Complaint existing = complaintsRepository.findOne(complaint.getComplaintId());
			if (existing != null) {
				complaint.setComplaintId(existing.getComplaintId());
				Complaint updatdComplaint = complaintsRepository.save(complaint);
				return updatdComplaint;
			} else {// This complaint doesn't exist
				return null;
			}
		}else{
			return null;
		}

	}

	public long countComplaints() {
		return complaintsRepository.count();
	}
}
