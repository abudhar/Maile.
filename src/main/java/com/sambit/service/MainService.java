package com.sambit.service;

import com.sambit.model.Register;

import java.util.List;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 4:01 PM
 */
public interface MainService {
	Register saveRegister(Register register);
	Register chekLogin(String email, String password);
	Register getRegisterById(int registerId);
	List<Register> getAllAdmin();
}
