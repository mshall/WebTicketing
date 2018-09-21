package com.shall.customercomplaints.service;

import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.dozer.DozerBeanMapper;
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

	@Autowired
	private DozerBeanMapper dozerMapper;

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
			try {
				existing = mapUser(user, existing);
				// dozerMapper.map(user, existing);
				// PropertyUtils.copyProperties(user, existing);
			} catch (Exception e) {
				e.printStackTrace();
			}
			User updatedUser = usersRepository.save(existing);
			return updatedUser;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}

	User mapUser(User source, User target) {
		if (source.getEmail() != null && !source.getEmail().isEmpty()) {
			target.setEmail(source.getEmail());
		}

		if (source.getPassword() != null && !source.getPassword().isEmpty()) {
			target.setPassword(source.getPassword());
		}

		if (source.getUsername() != null && !source.getUsername().isEmpty()) {
			target.setUsername(source.getUsername());
		}
		if (source.getCity() != null && !source.getCity().isEmpty()) {
			target.setCity(source.getCity());
		}

		if (source.getName() != null && !source.getName().isEmpty()) {
			target.setName(source.getName());
		}

		if (source.getPhone1() != null && !source.getPhone1().isEmpty()) {
			target.setPhone1(source.getPhone1());
		}

		if (source.getPhone2() != null && !source.getPhone2().isEmpty()) {
			target.setPhone2(source.getPhone2());
		}

		return target;
	}

	public User findUser(Login login) {
		return usersRepository.findByUsernameAndPassword(login.getUsername(), login.getPassword());
	}

	public List<User> getAllUsersByStatus(int status) {
		return usersRepository.findByStatus(status);
	}
}
