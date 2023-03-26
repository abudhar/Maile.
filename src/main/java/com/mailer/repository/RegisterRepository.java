package com.mailer.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mailer.model.Register;

import java.util.List;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 4:03 PM
 */
public interface RegisterRepository extends JpaRepository<Register, Integer> {
	Register getRegistersByEmailAndPassword(String email, String password);
	List<Register> getAllByUserType(String userType);
}
