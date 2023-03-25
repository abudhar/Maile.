package com.sambit.controller;

import com.sambit.model.Register;
import com.sambit.service.MainService;

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


	@GetMapping(value = {"/home", "/"})
	public String home() {
		System.out.println("Inside Home Method------->>");
		return "Home";
	}

	@GetMapping(value = "/login")
	public String login(@RequestParam(value = "response", required = false) String response, Model model) {
		System.out.println("Inside Login Method------->>");
		model.addAttribute("response", response);
		return "Login";
	}
	
	@GetMapping(value = "/mail")
	public String mail(@RequestParam(value = "response", required = false) String response, Model model) {
		System.out.println("Inside mail Method------->>");
		model.addAttribute("response", response);
		return "mail";
	}
	
	
	@GetMapping(value = "/multiMail")
	public String multiMail(@RequestParam(value = "response", required = false) String response, Model model) {
		System.out.println("Inside mail Method------->>");
		model.addAttribute("response", response);
		return "multiMail";
	}
	
	@GetMapping(value = "/admin")
	public String admin(@RequestParam(value = "response", required = false) String response, Model model) {
		System.out.println("Inside admin Method------->>");
		model.addAttribute("adminList", mainService.getAllAdmin());
		model.addAttribute("response", response);
		return "admin";
	}

	@GetMapping(value = "/register")
	public String register(Model model) {
		System.out.println("Inside Register Method------->>");
		model.addAttribute("response", null);
		return "Register";
	}

	@PostMapping(value = "/register")
	public String register(Register register, Model model, @RequestParam("profileImage") MultipartFile profileImage) {
		System.out.println("Inside Register Method------->>");
		System.out.println("Register Data : " + register);
		System.out.println("Profile Image : " + profileImage);
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

	@RequestMapping(value = "/dashboard", method = {RequestMethod.GET, RequestMethod.POST})
	public String dashboard(@RequestParam(value = "registerId", required = false) String registerId, Model model) throws UnsupportedEncodingException {
		System.out.println("Inside Dashboard Method------->>");
		System.out.println("Register Id : " + registerId);
		Register register = mainService.getRegisterById(Integer.parseInt(registerId));
		if(register.getBlobData() != null)
			register.setProfileImageUploadPath(new String(Base64.encodeBase64(register.getBlobData()), "UTF-8"));
		model.addAttribute("data", register);
		if (register != null && register.getRegisterId() > 0 && (register.getUserType().equals("ADMIN") || register.getUserType().equals("USER"))) {
			model.addAttribute("userType", "ADMIN");
		} else if (register != null && register.getRegisterId() > 0 && register.getUserType().equals("STUDENT")) {
			model.addAttribute("userType", "STUDENT");
		} else {
			return "redirect:/login?response=Something Went Wrong";
		}
		return "Dashboard";
	}
}
