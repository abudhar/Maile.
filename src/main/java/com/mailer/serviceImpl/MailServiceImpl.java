package com.mailer.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mailer.model.EmailBean;
import com.mailer.repository.MailRepository;
import com.mailer.service.MailService;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailRepository mailRepository;

	@Override
	public List<EmailBean> getAll() {
		return mailRepository.findAll();
	}

	@Override
	public EmailBean saveMail(EmailBean save) {
		return mailRepository.save(save);
	}
	
	

}
