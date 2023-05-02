package com.mailer.service;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailScheduler implements Job {
	private JavaMailSender javaMailSender;
	private SimpleMailMessage mailMessage;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		javaMailSender.send(mailMessage);
	}
}
