package com.shall.customercomplaints.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Complaint;
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

	/*
	 * @Override public Customer createCustomer(Customer Customer) { return
	 * CustomerRepository.save(Customer); }
	 * 
	 * @Override public Customer getCustomer(Long id) { return
	 * CustomerRepository.findOne(id); }
	 * 
	 * @Override public Customer editCustomer(Customer Customer) { return
	 * CustomerRepository.save(Customer); }
	 * 
	 * @Override public void deleteCustomer(Customer Customer) {
	 * CustomerRepository.delete(Customer); }
	 * 
	 * @Override public void deleteCustomer(Long id) {
	 * CustomerRepository.delete(id); }
	 * 
	 * @Override public List<Customer> getAllCustomers(int pageNumber, int
	 * pageSize) { return CustomerRepository.findAll(new PageRequest(pageNumber,
	 * pageSize)).getContent(); }
	 * 
	 * @Override public List<Customer> getAllCustomers() { return
	 * CustomerRepository.findAll(); }
	 * 
	 * @Override public long countCustomers() { return
	 * CustomerRepository.count(); }
	 */
}
