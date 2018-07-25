package com.shall.customercomplaints.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, Integer> {

	public Users findByEmail(String emaill);

	public Users findByUsername(String emaill);

	public Users findByEmailAndPassword(String email, String password);

	public Users findByUsernameAndPassword(String email, String password);
}
