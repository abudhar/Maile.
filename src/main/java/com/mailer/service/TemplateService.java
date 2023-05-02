package com.mailer.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mailer.model.Template;
import com.mailer.repository.TemplateRepository;

@Service
public class TemplateService {
    
    @Autowired
    private TemplateRepository templateRepository;
    
    public Template createTemplate(Template template) {
        return templateRepository.save(template);
    }
    
    public Template updateTemplate(Long id, Template template) {
        Template existingTemplate = templateRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Template not found"));
        existingTemplate.setName(template.getName());
        existingTemplate.setContent(template.getContent());
        existingTemplate.setSubject(template.getContent());
        return templateRepository.save(existingTemplate);
    }
    
    public List<Template> getAllTemplates() {
        return templateRepository.findAll();
    }
    
    public Template getTemplateById(Long id) {
        return templateRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Template not found"));
    }
    
    public Template getTemplateByName(String name) {
        return templateRepository.findByName(name);
    }
    
}
