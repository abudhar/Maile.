package com.mailer.serviceImpl;

import com.mailer.model.Register;
import com.mailer.repository.RegisterRepository;
import com.mailer.service.MainService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 4:01 PM
 */

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private RegisterRepository registerRepository;

	@Override
	public Register saveRegister(Register register) {
		try {
			register.setUserType("USER");
			return registerRepository.save(register);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Register chekLogin(String email, String password) {
		return registerRepository.getRegistersByEmailAndPassword(email, password);
	}

	@Override
	public Register getRegisterById(int registerId) {
		return registerRepository.getReferenceById(registerId);
	}

	@Override
	public List<Register> getAllAdmin() {
		return registerRepository.getAllByUserType("ADMIN");
	}
}
