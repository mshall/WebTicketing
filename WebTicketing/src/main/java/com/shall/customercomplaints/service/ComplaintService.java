package com.shall.customercomplaints.service;

import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.model.Merchant;
import com.shall.customercomplaints.model.Terminal;
import com.shall.customercomplaints.repository.ComplaintsRepository;
import com.shall.customercomplaints.repository.MerchantRepository;
import com.shall.customercomplaints.repository.TerminalRepository;

@Service
public class ComplaintService implements GenericService<Complaint, Long> {

	@Autowired
	private ComplaintsRepository complaintsRepository;

	@Autowired
	MerchantRepository merchantRepository;

	@Autowired
	TerminalRepository terminalRepository;

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
		Merchant merchant = merchantRepository.findOne(entity.getMerchantId());
		Terminal terminal = terminalRepository.findOne(entity.getTerminalId());
		entity = fillComplaintExtraFields(entity, merchant, terminal);
		return GenericService.super.save(entity);
	}

	private Complaint fillComplaintExtraFields(Complaint entity, Merchant merchant, Terminal terminal) {
		if (merchant != null) {
			entity.setMerchantName(merchant.getMerchantName());
			entity.setMerchantCity(merchant.getCity());
			entity.setMerchantAddress(merchant.getStreet());
		}
		if (terminal != null) {
			entity.setTerminalSerial(entity.getTerminalSerial());
		}
		return entity;
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

	public List<Complaint> findByStatus(String status) {
		return complaintsRepository.findByStatus(status);
	}

	public Complaint updateComplaint(Complaint complaint) {
		if (complaint.getComplaintId() != null) {
			Complaint existingComplaint = complaintsRepository.findOne(complaint.getComplaintId());
			if (existingComplaint != null) {
				try {
					existingComplaint = mapComplaints(complaint, existingComplaint);
					// dozerMapper.map(complaint, existingComplaint);
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

	public Complaint mapComplaints(Complaint source, Complaint target) {
		if (source.getComments() != null && !source.getComments().isEmpty()) {
			target.setComments(source.getComments());
		}
		if (source.getComplaintClosingTime() != null) {
			target.setComplaintClosingTime(source.getComplaintClosingTime());
		}
		if (source.getComplaintNote() != null && !source.getComplaintNote().isEmpty()) {
			target.setComplaintNote(source.getComplaintNote());
		}
		if (source.getComplaintOpeningTime() != null) {
			target.setComplaintOpeningTime(source.getComplaintOpeningTime());
		}
		if (source.getComplaintSolution() != null && !source.getComplaintSolution().isEmpty()) {
			target.setComplaintSolution(source.getComplaintSolution());
		}

		if (source.getCustomerEmail() != null && !source.getCustomerEmail().isEmpty()) {
			target.setCustomerEmail(source.getCustomerEmail());
		}

		if (source.getMerchantId() != 0) {
			target.setMerchantId(source.getMerchantId());
		}
		if (source.getPhoneNumber() != null && !source.getPhoneNumber().isEmpty()) {
			target.setPhoneNumber(source.getPhoneNumber());
		}
		if (source.getStatus() != null && !source.getStatus().isEmpty()) {
			target.setStatus(source.getStatus());
		}

		if (source.getTechnicianId() != 0) {
			target.setTechnicianId(source.getTechnicianId());
		}
		if (source.getTerminalId() != 0) {
			target.setStatus(source.getStatus());
		}

		return target;
	}

	public long countComplaints() {
		return complaintsRepository.count();
	}
}
