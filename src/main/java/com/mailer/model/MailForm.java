package com.mailer.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MailForm {
	public String fromMail;
	public String toMail;
	public String subject;
	public String content;
	private MultipartFile attachments;
	
}
