package com.shall.customercomplaints.service;

import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.repository.ComplaintsRepository;

@Service
public class ComplaintService implements GenericService<Complaint, Long> {

	@Autowired
	private ComplaintsRepository complaintsRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

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

	public List<Complaint> findByTechnicianId(int technicianId) {
		return complaintsRepository.findByTechnicianId(technicianId);
	}

	public Complaint updateComplaint(Complaint complaint) {
		if (complaint.getComplaintId() != null) {
			Complaint existingComplaint = complaintsRepository.findOne(complaint.getComplaintId());
			if (existingComplaint != null) {
				try {
					dozerMapper.map(complaint, existingComplaint);
					// PropertyUtils.copyProperties(complaint,
					// existingComplaint);
				} catch (Exception e) {
					e.printStackTrace();
				}
				Complaint updatdComplaint = complaintsRepository.save(existingComplaint);
				return updatdComplaint;
			} else {// This complaint doesn't exist
				return null;
			}
		} else {
			return null;
		}

	}

	public long countComplaints() {
		return complaintsRepository.count();
	}
}
