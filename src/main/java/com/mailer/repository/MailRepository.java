package com.mailer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mailer.model.EmailBean;


@Repository
public interface MailRepository extends JpaRepository<EmailBean, Integer>{

}
