package com.shall.customercomplaints.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Terminal;

@Repository
public interface TerminalRepository extends JpaRepository<Terminal, Integer> {

}
