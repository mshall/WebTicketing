package com.shall.customercomplaints.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.shall.customercomplaints.model.Rollpaper;

@Repository
public interface RollpaperRepository extends JpaRepository<Rollpaper, Integer> {

}
