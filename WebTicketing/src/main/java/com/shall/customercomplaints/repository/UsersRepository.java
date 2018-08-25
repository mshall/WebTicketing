
package com.shall.customercomplaints.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shall.customercomplaints.model.User;

@Repository
public interface UsersRepository extends JpaRepository<User, Integer> {

	public User findByEmail(String emaill);

	public User findByUsername(String emaill);

	public User findByEmailAndPassword(String email, String password);

	public User findByUsernameAndPassword(String username, String password);

	public List<User> findByUserType(int userType);

	public List<User> findByStatus(int status);
}
