package com.mailer.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mailer.model.Template;

public interface TemplateRepository extends JpaRepository<Template, Long> {
    
    Template findByName(String name);
    
}
