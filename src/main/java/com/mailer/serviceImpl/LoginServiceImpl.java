package com.mailer.serviceImpl;

import com.mailer.model.Register;
import com.mailer.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.websocket.server.ServerEndpoint;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 9:00 PM
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private MainServiceImpl mainService;

	@Override
	public String checkLoginType(String email, String password) {
		Register register = mainService.chekLogin(email, password);
		if (register != null) {
			return register.getUserType();
		} else {
			return "INVALID";
		}
	}
}
