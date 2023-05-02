package com.mailer.controller;

import com.mailer.model.Register;
import com.mailer.service.LoginService;
import com.mailer.service.MainService;

import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Project : Emailer
 * @Auther : Mohammed Abudhar Ghifari
 * @Created On : 02/02/2023 - 5:37 PM
 */
@Controller
public class LoginController {

	@Autowired
	private MainService mainService;
	@Autowired
	private LoginService loginService;

	@PostMapping(value = "/login")
	public String login(@RequestParam("email") String email,  @RequestParam("password") String password, Model model) throws UnsupportedEncodingException {
		String userType = loginService.checkLoginType(email, password);
		Register register = mainService.chekLogin(email, password);
		if(register != null && register.getBlobData() != null)
			register.setProfileImageUploadPath(new String(Base64.encodeBase64(register.getBlobData()), "UTF-8"));
		if (userType.equals("ADMIN")) {
			model.addAttribute("userType", userType);
			model.addAttribute("data", register);
			model.addAttribute("adminList", mainService.getAllAdmin());
		} else if (userType.equals("USER")) {
			model.addAttribute("userType", userType);
			model.addAttribute("data", register);
		} else  if(userType.equals("USER")) {
			if(register.getBlobData() != null)
				register.setProfileImageUploadPath(new String(Base64.encodeBase64(register.getBlobData()), "UTF-8"));
			model.addAttribute("userType", userType);
			model.addAttribute("data", register);
			model.addAttribute("adminList", mainService.getAllAdmin());
		
		} else {
			return "redirect:/login?response=Invalid Username or Password";
		}
		return "redirect:/dashboard?registerId=" + register.getRegisterId();
	}
}
