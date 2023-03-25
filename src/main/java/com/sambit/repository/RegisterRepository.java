package com.sambit.repository;

import com.sambit.model.Register;
import org.springframework.data.jpa.repository.JpaRepository;

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
