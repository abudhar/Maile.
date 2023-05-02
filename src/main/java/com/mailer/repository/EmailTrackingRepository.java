package com.mailer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mailer.model.EmailTracking;

@Repository
public interface EmailTrackingRepository  extends JpaRepository<EmailTracking, Integer>{

}
