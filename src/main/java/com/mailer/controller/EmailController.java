
package com.mailer.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mailer.model.EmailBean;
import com.mailer.service.EmailServices;



@RestController
@CrossOrigin("*")
public class EmailController {

	@Autowired
	private EmailServices emailService;

	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public ResponseEntity<?> sendMail(@RequestBody EmailBean ebean) {
		String sendEmail = this.emailService.sendEmail(ebean);
		return ResponseEntity.ok(sendEmail);

	}

	@RequestMapping(value = "/sendMailWithAttach", method = RequestMethod.POST)
	public ResponseEntity<?> sendMailWithAttach(@RequestBody EmailBean ebean) {
		String sendEmailAttach = this.emailService.sendEmailAttach(ebean);
		return ResponseEntity.ok(sendEmailAttach);

	}

	@PostMapping("/sendingEmail")
	public EmailBean sendEmail(@RequestBody EmailBean request) {
		Map<String, Object> model = new HashMap<>();
		model.put("name", "Abudhar al ghifari");
		model.put("location", "Bangalore, India");
		return emailService.sendEmail(request, model);
	}
	
	@PostMapping("/sendQRMail")
	public EmailBean sendQRMail(@RequestBody EmailBean request) {
		Map<String, Object> model = new HashMap<>();
		model.put("name", request.getEmailTo());
		model.put("location", "Chennai, India");
		return emailService.sendEmail(request, model);
	}
}
