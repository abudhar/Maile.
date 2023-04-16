package com.mailer.service;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.multipart.MultipartFile;

import com.mailer.config.ApplicationsConstants;
import com.mailer.model.EmailBean;
import com.mailer.repository.MailRepository;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;

@Service
public class EmailServices {
	@Autowired
	private MailRepository mailRepo;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private Configuration freemarkerConfig;
	

	public EmailBean sendEmail(EmailBean request, Map<String, Object> model) {
		EmailBean response = new EmailBean();
		MimeMessage message = mailSender.createMimeMessage();
		try {
			// set mediaType
			MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
					StandardCharsets.UTF_8.name());
			// add attachment
			helper.addAttachment("Attachment", new File(request.getPath()));
			freemarker.template.Template t = freemarkerConfig.getTemplate("email-template-qrcode.ftl");
			String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, model);
			helper.setTo(request.getEmailTo());
			helper.setText(html, true);
			helper.setSubject(request.getSubject());
			helper.setFrom(request.getEmailFrom());
			mailSender.send(message);
			response.setMessage("mail send to : " + request.getEmailTo());
			response.setStatus("SUCCESS");
		} catch (MessagingException | IOException | TemplateException e) {
			response.setMessage("Mail Sending failure : " + e.getMessage());
			response.setStatus("Failed");
		}
		return response;
	}

	public String sendEmailAttach(EmailBean bean) {
		bean.setStatus("Failed!");
		bean.setEmailFrom(ApplicationsConstants.EMAILID);
		MimeMessage mime = authenticateEmail();
		try {
			mime.setFrom(bean.getEmailFrom());
			mime.addRecipient(Message.RecipientType.TO, new InternetAddress(bean.getEmailTo()));
			mime.setSubject(bean.getSubject());
			MimeMultipart mimeMultipart = new MimeMultipart();
			MimeBodyPart textMime = new MimeBodyPart();
			MimeBodyPart fileMime = new MimeBodyPart();
			textMime.setText(bean.getMessage());
			File file = new File(bean.getPath());
			fileMime.attachFile(file);
			mimeMultipart.addBodyPart(textMime);
			mimeMultipart.addBodyPart(fileMime);
			mime.setContent(mimeMultipart);
			Transport.send(mime);
			bean.setStatus("Success!");
		} catch (Exception e) {
			e.printStackTrace();
			bean.setStatus(e.getMessage());
		}
		mailRepo.save(bean);
		return bean.getStatus();

	}
	
	public String sendEmailwithAttach(EmailBean bean) {
		bean.setStatus("Failed!");
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
	        MimeMessageHelper mimeMessageHelper=new MimeMessageHelper(mimeMessage,true);
	        mimeMessageHelper.setFrom(bean.getEmailFrom());
	        mimeMessageHelper.setTo(bean.getEmailTo());
	        mimeMessageHelper.setText(bean.getMessage());
	        mimeMessageHelper.setSubject(bean.getSubject());
	        for(MultipartFile attachmentFile : bean.getAttachFile()) {
		        ByteArrayDataSource attachment = new ByteArrayDataSource(attachmentFile.getInputStream(), "application/octet-stream");
		        mimeMessageHelper.addAttachment(attachmentFile.getOriginalFilename(), attachment);
	        }
	        mailSender.send(mimeMessage);
			bean.setStatus("Success!");
		} catch (Exception e) {
			e.printStackTrace();
			bean.setStatus(e.getMessage());
		}
		mailRepo.save(bean);
		return bean.getStatus();
		
	}

	public String sendEmail(EmailBean bean) {
		bean.setStatus("Failed!");
		bean.setEmailFrom(ApplicationsConstants.EMAILID);
		MimeMessage mime = authenticateEmail();
		try {
			mime.setFrom(bean.getEmailFrom());
			mime.addRecipient(Message.RecipientType.TO, new InternetAddress(bean.getEmailTo()));
			mime.setSubject(bean.getSubject());
			mime.setText(bean.getMessage());
			Transport.send(mime);
			bean.setStatus("Success!");
		} catch (Exception e) {
			e.printStackTrace();
			bean.setStatus(e.getMessage());
		}
		mailRepo.save(bean);
		return bean.getStatus();

	}

	public MimeMessage authenticateEmail() {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", ApplicationsConstants.HOST);
		properties.put("mail.smtp.port", ApplicationsConstants.SMTPPORTNO);
		properties.put("mail.smtp.ssl.enable", ApplicationsConstants.SMTPSSLYN);
		properties.put("mail.smtp.auth", ApplicationsConstants.SMTPAUTHYN);
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(ApplicationsConstants.EMAILID, ApplicationsConstants.EMAILPASSWORD);
			}
		});
		session.setDebug(true);
		return new MimeMessage(session);
	}
}
