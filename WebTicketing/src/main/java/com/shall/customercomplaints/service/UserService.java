package com.shall.customercomplaints.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.User;
import com.shall.customercomplaints.network.request.Login;
import com.shall.customercomplaints.repository.UsersRepository;

@Service
public class UserService implements GenericService<User, Integer> {

	@Autowired
	private UsersRepository usersRepository;

	@Override
	public CrudRepository<User, Integer> getRepository() {
		// TODO Auto-generated method stub
		return usersRepository;
	}

	@Override
	public Integer getId(User entity) {
		return entity.getUserId();
	}

	@Override
	public User save(User entity) {
		User savedUser = findByEmail(entity.getEmail());
		if (savedUser == null) {
			return GenericService.super.save(entity);
		} else {
			return null;
		}

	}

	public User findByEmail(String email) {
		return usersRepository.findByEmail(email);
	}

	public User findByUsername(String username) {
		return usersRepository.findByUsername(username);
	}

	public List<User> getAllUsers() {
		return usersRepository.findAll();
	}

	public List<User> getAllUsersOfType(int userType) {
		return usersRepository.findByUserType(userType);
	}

	public boolean deleteUser(int userId) {
		usersRepository.delete(userId);
		if (usersRepository.findOne(userId) == null) {
			return true;
		} else {
			return false;
		}
	}

	public User updateUser(User user) {
		User existing = usersRepository.findOne(user.getUserId());
		if (existing != null) {
			user.setUserId(existing.getUserId());
			User updatedUser = usersRepository.save(user);
			return updatedUser;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}

	public User findUser(Login login) {
		return usersRepository.findByUsernameAndPassword(login.getUsername(), login.getPassword());
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
