package com.shall.customercomplaints.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Users;
import com.shall.customercomplaints.repository.UsersRepository;

@Service
public class UserService implements GenericService<Users, Integer> {

	@Autowired
	private UsersRepository usersRepository;

	@Override
	public CrudRepository<Users, Integer> getRepository() {
		// TODO Auto-generated method stub
		return usersRepository;
	}

	@Override
	public Integer getId(Users entity) {
		return entity.getUserId();
	}

	@Override
	public Users save(Users entity) {
		Users savedUser = findByEmail(entity.getEmail());
		if (savedUser == null) {
			return GenericService.super.save(entity);
		} else {
			return null;
		}

	}

	public Users findByEmail(String email) {
		return usersRepository.findByEmail(email);
	}

	public Users findByUsername(String username) {
		return usersRepository.findByUsername(username);
	}

	public List<Users> getAllUsers() {
		return usersRepository.findAll();
	}

	public boolean deleteUser(int userId) {
		usersRepository.delete(userId);
		if (usersRepository.findOne(userId) == null) {
			return true;
		} else {
			return false;
		}
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
