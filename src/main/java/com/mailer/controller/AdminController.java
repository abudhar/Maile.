package com.mailer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mailer.service.MainService;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 8:53 PM
 */
@Controller
public class AdminController {
	@Autowired
	private MainService mainService;

}
