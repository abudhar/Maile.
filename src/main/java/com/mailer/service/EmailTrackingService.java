package com.mailer.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mailer.model.EmailTracking;
import com.mailer.repository.EmailTrackingRepository;

@Service
public class EmailTrackingService {
    
    @Autowired
    private EmailTrackingRepository trackingRepository;
    
    public void updateStatus(String id, String status) {
        Optional<EmailTracking> optional = trackingRepository.findById(Integer.valueOf(id));
        if (optional.isPresent()) {
            EmailTracking tracking = optional.get();
            tracking.setStatus(status);
            trackingRepository.save(tracking);
        }
    }
}
