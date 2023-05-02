
package com.mailer.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fileprocess.service.FileProcessing;
import com.mailer.model.EmailBean;
import com.mailer.service.EmailServices;
import com.mailer.service.EmailTrackingService;



@Controller
@CrossOrigin("*")
public class EmailController {

	@Autowired
	private EmailServices emailService;

    @Autowired
    private EmailTrackingService trackingService;

	
	@PostMapping("/sendMail")
	public ResponseEntity<String> handleFileUpload(@ModelAttribute EmailBean formData) {
	    String sendEmail = this.emailService.sendEmailwithAttach(formData);
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
	
    @PostMapping("/get-emails")
    public ResponseEntity<List<String>> getEmails(@RequestParam("file") MultipartFile file) throws IOException {
    	List<String> emails = FileProcessing
    			.createFileProcessor(file)
    			.extractEmails(file);
        return ResponseEntity.ok(emails);
    }
    
    @PostMapping("/updateMailTrack")
    public void updateMailStatus(@RequestParam("UUID") String id) {
        trackingService.updateStatus(id, "OPENED");
    }

}
