package com.mailer.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;




@Entity
@Table(name = "mailLogger")
@Data
public class EmailBean {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long srNo;
	private String subject;
	private String message;
	private String emailFrom;
	private String emailTo;
	private String status;
	private String path;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private java.util.Date time;
	@JsonInclude
	@Transient
	private String token;
	@Transient
	private List<MultipartFile> attachFile;
	
	@PrePersist
	private void oncreate() {
		time = new java.util.Date();
	}
}
