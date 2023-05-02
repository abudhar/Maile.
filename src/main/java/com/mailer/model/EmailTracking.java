package com.mailer.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "email_tracking")
@Getter@Setter
public class EmailTracking {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "email_address")
    private String emailAddress;
    
    @Column(name = "sent_date")
    private Date sentDate;

    @Column(name = "opened_date")
    private Date recievedDate;
    
    @Column(name = "status")
    private String status;
    
    @PrePersist
	protected void onCreate() {
    	sentDate = new Date();
	}
    
    @PreUpdate
	protected void onUpdate() {
    	recievedDate = new Date();
	}

}
