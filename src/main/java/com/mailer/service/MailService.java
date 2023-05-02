package com.mailer.service;

import java.util.List;

import com.mailer.model.EmailBean;

public interface MailService {

	List<EmailBean> getAll();

	EmailBean saveMail(EmailBean save);
}
