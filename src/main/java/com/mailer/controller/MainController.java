package com.mailer.controller;

import com.mailer.model.Register;
import com.mailer.repository.MailRepository;
import com.mailer.service.MailService;
import com.mailer.service.MainService;

import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 2:30 PM
 */
@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	@Autowired
	private MailService mailService;

	@GetMapping(value = { "/home", "/" })
	public String home() {
		return "Login";
	}

	@GetMapping(value = "/login")
	public String login(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("response", response);
		return "Login";
	}

	@GetMapping(value = "/mail")
	public String mail(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("response", response);
		return "mail";
	}

	@GetMapping(value = "/multiMail")
	public String multiMail(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("response", response);
		return "multiMail";
	}

	@GetMapping(value = "/mailLogger")
	public String mailLogger(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("mailList", mainService.getAllAdmin());
		model.addAttribute("response", response);
		return "mailLogger";
	}

	@GetMapping(value = "/admin")
	public String admin(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("adminList", mainService.getAllAdmin());
		model.addAttribute("response", response);
		return "admin";
	}

	@GetMapping(value = "/emailLog")
	public String emailLog(@RequestParam(value = "response", required = false) String response, Model model) {
		model.addAttribute("emailList", mailService.getAll());
		model.addAttribute("response", response);
		return "EmailLog";
	}
	
	@GetMapping(value = "/register")
	public String register(Model model) {
		model.addAttribute("response", null);
		return "Register";
	}

	@PostMapping(value = "/register")
	public String register(Register register, Model model, @RequestParam("profileImage") MultipartFile profileImage) {
		try {
			register.setBlobData(profileImage.getBytes());
			register = mainService.saveRegister(register);
			if (register != null && register.getRegisterId() > 0) {
				return "redirect:/login?response=Registration Successfull";
			} else {
				model.addAttribute("response", "Registration Failed");
				return "Register";
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET, RequestMethod.POST })
	public String dashboard(@RequestParam(value = "registerId", required = false) String registerId, Model model)
			throws UnsupportedEncodingException {
		Register register = mainService.getRegisterById(Integer.parseInt(registerId));
		if (register != null && register.getRegisterId() > 0 && register.getUserType() != null) {
			if (register.getBlobData() != null)
				register.setProfileImageUploadPath(new String(Base64.encodeBase64(register.getBlobData()), "UTF-8"));
			model.addAttribute("userType", register.getUserType());
			model.addAttribute("data", register);
		} else {
			return "redirect:/login?response=Something Went Wrong";
		}
		return "Dashboard";
	}
}
